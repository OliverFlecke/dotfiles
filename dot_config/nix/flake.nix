{
	description = "Darwin system flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nix-darwin.url = "github:nix-darwin/nix-darwin/master";
		nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
		nix-homebrew.url = "github:zhaofengli/nix-homebrew";
	};

	outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
	let
		configuration = { pkgs, config, ... }: {
			nixpkgs.hostPlatform = "aarch64-darwin";
			nix.settings.experimental-features = "nix-command flakes";
			programs.zsh.enable = true;
			system.primaryUser = "oliver";

			system.defaults = {
				dock.autohide = true;
				finder.FXPreferredViewStyle = "clmv";
				loginwindow.GuestEnabled = false;
				NSGlobalDomain.AppleICUForce24HourTime = true;
				NSGlobalDomain.AppleInterfaceStyle = "Dark";
				NSGlobalDomain.KeyRepeat = 2;
			};

			# List packages installed in system profile. To search by name, run:
			# $ nix-env -qaP | grep wget
			environment.systemPackages = [ 
				pkgs.bat
				pkgs.diff-so-fancy
				pkgs.fzf
				# pkgs.ghostty
				pkgs.git
				pkgs.glow
				pkgs.httpie
				pkgs.jq
				pkgs.kustomize
				pkgs.mise
				pkgs.mkalias
				pkgs.mosquitto
				pkgs.neovim
				pkgs.redis
				pkgs.ripgrep
				pkgs.sqlite
				# pkgs.tilt
				pkgs.tmux
			];

			homebrew = {
				enable = true;
				brews = [
					"kubernetes-cli"
					# "ffmpeg"
					# "geckodriver"
				];
				casks = [
					"firefox"
					"fantastical"
					"ghostty"
					"google-chrome"
					"iina"
					# "key-codes"
					# "keycastr"
					"lulu"
					"maccy"
					"microsoft-azure-storage-explorer"
					"ngrok"
					"notion"
					"onedrive"
					"orbstack"
					# "pearcleaner"
					"postman"
					"protonvpn"
					"skim"
					"slack"
					"spotify"
					"stats"
					"transmission"
					"visual-studio-code"
					"vlc"
					"whatsapp"
					# "zen"
				];
				# onActivation.cleanup = "zap";
				# onActivation.autoUpdate = true;
				# onActivation.upgrade = true;
			};

			fonts.packages = with pkgs; [
				nerd-fonts.hack
				nerd-fonts.jetbrains-mono
				nerd-fonts.fira-code
			];

			# Set up /Applications symlink for apps installed with Nix. Necessary for Spotlight.
			system.activationScripts.applications.text = let
				env = pkgs.buildEnv {
					name = "system-applications";
					paths = config.environment.systemPackages;
					pathsToLink = ["/Applications"];
				};
				in
					pkgs.lib.mkForce ''
					# Set up applications.
					echo "setting up /Applications..." >&2
					rm -rf /Applications/Nix\ Apps
					mkdir -p /Applications/Nix\ Apps
					find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
					while read -r src; do
						app_name=$(basename "$src")
						echo "copying $src" >&2
						${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
					done
					'';

			# Set Git commit hash for darwin-version.
			system.configurationRevision = self.rev or self.dirtyRev or null;

			# Used for backwards compatibility, please read the changelog before changing.
			# $ darwin-rebuild changelog
			system.stateVersion = 6;
		};
	in
	{
		# Build darwin flake using:
		# $ darwin-rebuild build --flake .#dev
		darwinConfigurations."main" = nix-darwin.lib.darwinSystem {
			modules = [
				configuration 
				nix-homebrew.darwinModules.nix-homebrew
				{
					nix-homebrew = {
						enable = true;
						enableRosetta = true;
						user = "oliver";
						# mutableTaps = false;
					};
				}
			];
		};
		darwinPackages = self.darwinConfigurations."main".pkgs;
	};
}
