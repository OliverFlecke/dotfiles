FROM ubuntu:latest

RUN apt update
RUN apt install curl git -y
RUN apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsLS get.chezmoi.io)"

CMD ["sh", "-c", "date && chezmoi apply &&  /root/.install/zsh.sh"]
