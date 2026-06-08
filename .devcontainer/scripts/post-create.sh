#!/usr/bin/env bash
set -euo pipefail

sudo npm install -g generator-jhipster yo

echo
echo "JHipster dev container is ready."
echo "Versions:"
java -version
node --version
npm --version
jhipster --version
