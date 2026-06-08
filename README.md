# JHipster React Prototype

Personal learning repo for a vanilla JHipster React + Spring Boot project.

## What This Repo Adds

- A VS Code dev container with Java 21, Node 22, Maven, Docker CLI, GitHub CLI, and JHipster.
- Useful daily tools: `rg`, `fd`, `jq`, `yq`, `fzf`, `httpie`, `shellcheck`, database clients, `tree`, `htop`, `vim`, and `nano`.
- Port forwarding for Spring Boot `8080`, the JHipster frontend dev server `9000`, and BrowserSync UI `3001`.
- A reference JDL file at `docs/jhipster-vanilla-react-springboot.jdl`.

## Build The Dev Container

1. Install Docker Desktop and VS Code.
2. Install the VS Code extension `Dev Containers`.
3. Open this repository in VS Code.
4. Run `Dev Containers: Reopen in Container`.
5. Wait for the container setup to finish. It installs `generator-jhipster` and `yo` after the first build.

Check the tools:

```bash
java -version
node --version
npm --version
jhipster --version
docker --version
gh --version
```

If `jhipster --version` says `command not found`, run this once inside the dev container:

```bash
mkdir -p "$HOME/.local/bin"
npm config set prefix "$HOME/.local"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
export PATH="$HOME/.local/bin:$PATH"
npm install -g generator-jhipster yo
jhipster --version
```

## Generate The Original JHipster App

Run this inside the dev container from the repo root:

```bash
jhipster --defaults \
  --base-name jhipsterReactPrototype \
  --package-name com.guanhaiyu.jhipsterreactprototype \
  --client-framework react \
  --skip-git
```

This keeps the app close to the original JHipster defaults, but switches the frontend to React and uses a Java package name that fits this practice repo. `--skip-git` is intentional because this repository already has Git initialized.

If you prefer answering the generator questions manually, run:

```bash
jhipster --skip-git
```

Choose these important options:

- Application type: monolith
- Backend: Spring Boot
- Authentication: JWT
- Build tool: Maven
- Client framework: React
- Development database: H2
- Production database: PostgreSQL

## Run The App

Start the backend:

```bash
./mvnw
```

Open:

```text
http://localhost:8080
```

For active frontend development, use two terminals:

```bash
./mvnw
npm start
```

The frontend dev server is available on:

```text
http://localhost:9000
```

## Push To The Current GitHub Repo

The current remote is expected to be:

```bash
git remote -v
```

Commit and push:

```bash
git status
git add .
git commit -m "Generate vanilla JHipster React Spring Boot app"
git push -u origin main
```

If GitHub authentication is not ready inside the container:

```bash
gh auth login
git push -u origin main
```

## Optional JDL Flow

The file `docs/jhipster-vanilla-react-springboot.jdl` records a reproducible vanilla app configuration. You can use it later as a reference, or generate from it in a temporary folder:

```bash
mkdir ../jhipster-generation-test
cd ../jhipster-generation-test
jhipster jdl ../jhipster-react-prototype/docs/jhipster-vanilla-react-springboot.jdl --skip-git
```

Generating from an application JDL usually creates an application folder, so the direct `jhipster --defaults ...` command above is simpler when you want the project files directly in this repo root.
