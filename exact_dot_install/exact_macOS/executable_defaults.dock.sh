#!/usr/bin/env sh

defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "titlesize" -int "32"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.5"
defaults write com.apple.dock "autohide-delay" -float "0.2"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"

killall Dock
