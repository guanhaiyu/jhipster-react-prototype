#!/usr/bin/env bash
set -euo pipefail

NPM_GLOBAL_PREFIX="${HOME}/.local"

mkdir -p "${NPM_GLOBAL_PREFIX}/bin"
npm config set prefix "${NPM_GLOBAL_PREFIX}"

if ! grep -q 'HOME/.local/bin' "${HOME}/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "${HOME}/.bashrc"
fi

export PATH="${NPM_GLOBAL_PREFIX}/bin:${PATH}"

npm install -g generator-jhipster yo

echo
echo "JHipster dev container is ready."
echo "Versions:"
java -version
node --version
npm --version
jhipster --version
