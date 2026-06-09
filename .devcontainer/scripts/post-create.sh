#!/usr/bin/env bash
set -euo pipefail

NPM_GLOBAL_PREFIX="${HOME}/.local"
DOCKER_CONFIG_DIR="${DOCKER_CONFIG:-${HOME}/.docker-devcontainer}"

mkdir -p "${NPM_GLOBAL_PREFIX}/bin"
npm config set prefix "${NPM_GLOBAL_PREFIX}"

mkdir -p "${DOCKER_CONFIG_DIR}"
if [[ ! -f "${DOCKER_CONFIG_DIR}/config.json" ]]; then
  printf '{}\n' > "${DOCKER_CONFIG_DIR}/config.json"
fi

if ! grep -q 'HOME/.local/bin' "${HOME}/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "${HOME}/.bashrc"
fi

export PATH="${NPM_GLOBAL_PREFIX}/bin:${PATH}"

npm install -g generator-jhipster@9.1.0 yo

echo
echo "JHipster dev container is ready."
echo "Versions:"
java -version
node --version
npm --version
jhipster --version
