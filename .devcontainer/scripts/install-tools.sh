#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  apt-transport-https \
  bash-completion \
  ca-certificates \
  curl \
  fd-find \
  fzf \
  gnupg \
  htop \
  httpie \
  iputils-ping \
  jq \
  less \
  lsof \
  mariadb-client \
  nano \
  netcat-openbsd \
  postgresql-client \
  procps \
  ripgrep \
  shellcheck \
  tree \
  unzip \
  vim \
  wget \
  yq \
  zip

ln -sf /usr/bin/fdfind /usr/local/bin/fd

apt-get clean
rm -rf /var/lib/apt/lists/*

chown -R vscode:vscode /home/vscode/.m2 /home/vscode/.npm
