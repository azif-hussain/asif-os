# AsifOS Philosophy

## Goal

Create a reproducible Fedora KDE workstation optimised for PHP/Laravel development.

## Principles

### 1. Keep the host OS clean

The host operating system should contain only tools that are required outside containers.

### Host Applications

- Fedora KDE
- Docker Engine
- Docker Compose
- Git
- GitHub CLI
- PhpStorm
- Google Chrome
- Slack
- Bitwarden
- DBeaver
- Postman
- Claude Code
- RustDesk

### Do NOT install on the host

- PHP
- Composer
- Node
- npm
- pnpm
- Yarn

These belong inside Docker containers.

### Every project is self-contained

Each project should define its own runtime using Docker Compose.

Benefits:

- Different PHP versions per project
- Different Node versions per project
- No dependency conflicts
- Easy onboarding
- Reproducible development environments

## Claude Code

Claude Code is installed using the native installer, not npm.

Reason:

- Keep the host clean
- Avoid installing Node/npm globally
- Match the Docker-first workstation philosophy

## Claude Code PATH

Claude Code native installer places the binary in:

```text
~/.local/bin/claude
