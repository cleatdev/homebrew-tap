# Cleat Homebrew tap

The Homebrew tap for [Cleat](https://cleat.sh), a Docker sandbox for AI coding agents.

## Install

```
brew install cleatdev/tap/cleat
```

The fully qualified name is required. Since Homebrew 6.0.0 a bare `brew tap` no longer grants trust. The qualified form does it in one step.

Cleat also installs with the one-line script, which stays the primary channel:

```
curl -fsSL https://cleat.sh/install | bash
```

## What Cleat is

Give the agent a cage, not your keys. Cleat runs a coding agent inside a Docker box so it can install anything, run unattended and never touch your credentials or your host. See [cleat.sh](https://cleat.sh) and [github.com/cleatdev/cleat](https://github.com/cleatdev/cleat).

Docker is a runtime requirement, not a formula dependency. If Docker is missing, `cleat` offers to install it on first run.

## Maintainer note: cutting a formula bump

The formula points at a real uploaded release asset, never the auto-generated tag tarball, because asset downloads are countable through the GitHub API. For each release:

```
cd cli
git archive --format=tar.gz --prefix=cleat-X.Y.Z/ vX.Y.Z -o /tmp/cleat-X.Y.Z.tar.gz
gh release upload vX.Y.Z /tmp/cleat-X.Y.Z.tar.gz --repo cleatdev/cleat
shasum -a 256 /tmp/cleat-X.Y.Z.tar.gz
```

Then set `url` and `sha256` in `Formula/cleat.rb` and validate before pushing:

```
brew audit --strict --online cleatdev/tap/cleat
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source cleatdev/tap/cleat
brew test cleat
```
