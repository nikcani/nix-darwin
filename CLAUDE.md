# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A single-host nix-darwin flake for the Mac `nikbook` (aarch64-darwin, primary user `nikcani`). It lives at `/etc/nix-darwin` and tracks `nixpkgs-unstable` and nix-darwin `master`. There are no tests; "building" means applying the system configuration.

## Commands

The shell aliases below are defined in `configuration.nix`. They exist only after a successful rebuild and are also exposed as VS Code tasks (`.vscode/tasks.json`).

- `rebuild` formats with `alejandra /etc/nix-darwin`, then runs `sudo darwin-rebuild switch --flake /etc/nix-darwin`.
- `update` runs `nix flake update`, then `rebuild`, then brew/mas/Paperless upgrades and lists pending macOS updates.
- `garbage` runs `nix-collect-garbage -d` and `docker system prune --all -f`.

To check a change without switching (no sudo needed):
```bash
alejandra --check .
darwin-rebuild build --flake .#nikbook
```

Flakes only see git-tracked files, so a new `.nix` file must be `git add`ed before it will evaluate.

## Layout

`flake.nix` lists every module explicitly, so a new module file also has to be added to the `modules` list there.

- `configuration.nix`: system settings, shell aliases/env vars, launchd agents (e.g. `ollama serve`), services, `stateVersion`.
- `packages.nix`: nixpkgs packages in `environment.systemPackages`, including a custom PHP 8.5 env with `intl` and `pcov`.
- `default-apps.nix`: sets file-type handlers with `duti` in a `postActivation` script. Add entries to the `handlers` attrset (bundle id → list of UTIs). The script runs as root but pushes each call into the user's GUI session with `launchctl asuser`, because LaunchServices is per-user.
- `homebrew/`: `config.nix` turns on Homebrew with `cleanup = "uninstall"`, so **anything removed from `brews.nix`/`casks.nix`/`masApps.nix` is uninstalled on the next rebuild**. `masApps` maps app name to App Store ID.

## Conventions

- Keep package, cask, brew, and mas lists alphabetical. To disable an entry, comment it out (`#"name"`) and move it to the commented block at the end of its list. Don't delete it.
- Prefer nixpkgs over Homebrew when nixpkgs has a working, cached macOS build. `allowUnfree` is on, but unfree packages are not in the binary cache, so they can fail to build (e.g. `realvnc-connect-viewer` stays a cask for this reason). GUI apps from nixpkgs install to `/Applications/Nix Apps`.
- Some nixpkgs attributes differ from the cask name, or `nix search` leads to Linux-only ones (e.g. `libreoffice-bin`, `vlc-bin`, `lmstudio`). Leave a short inline comment when the name isn't obvious.
- Commit messages are short, lowercase, and imperative (e.g. `disable unused casks`).
