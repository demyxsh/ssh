# Changelog

## 2026-05-09
### Added
- None.
### Changed
- Switched base image from Alpine 3.18 to `debian:stable-slim`.
- Replaced Alpine setup commands with Debian equivalents and expanded installed packages.
- Hardened `sshd_config` defaults (auth/session limits, forwarding, keepalive, login grace).
- Updated `bin/demyx-sudo` host key logic to handle `rsa`, `ecdsa`, and `ed25519` keys with bidirectional sync and key generation fallback.
- Scheduled build run.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2026-05-08
### Added
- None.
### Changed
- Improved version extraction commands in GitHub Actions workflow.
### Fixed
- Fixed `jq` command quoting in GitHub Actions workflow.
### Removed
- None.
### Security
- None.

## 2025-07-28
### Added
- None.
### Changed
- Updated GitHub Actions workflow to use run ID in scheduled build commit messages.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2024-02-08
### Added
- None.
### Changed
- Updated description with support and project links.
- Set base image to Alpine 3.18.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2023-08-17
### Added
- Added new file(s).
- Added new environment variables.
### Changed
- Misc updates.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2022-03-03
### Added
- Added `WORKDIR`.
### Changed
- Wrapped commands in a function.
- Started `sshd` with custom log handling.
- Used `-L` flag in conditional checks.
- Changed log name when `DEMYX_DOMAIN` is set, defaulting to `ssh`.
- Set bash as default shell.
### Fixed
- Created `.ssh` directory if missing.
### Removed
- None.
### Security
- None.

## 2022-01-19
### Added
- Created `version.json`.
### Changed
- Updated `README.md`.
- Migrated CI to GitHub Actions.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2021-03-08
### Added
- Added `bin/demyx-entrypoint`.
- Added `bin/demyx-permission`.
### Changed
- Renamed `src` to `bin`.
- Renamed `entrypoint.sh` to `demyx-entrypoint`.
- Renamed `permission.sh` to `demyx-permission`.
- Added comments under shebang and strict mode in scripts.
- Executed `demyx-permission` with sudo in entrypoint.
- Updated Dockerfile environment variable handling with backward compatibility.
- Rearranged `RUN` commands and updated bash `PS1`.
- Updated `COPY` directory and moved some commands to final `RUN`.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-06-16
### Added
- Added `permission.sh` to generate host keys and reset permissions/ownership.
### Changed
- None.
### Fixed
- None.
### Removed
- None.
### Security
- None.

## 2020-04-14
### Added
- Created `src` directory for main files.
### Changed
- Set `dumb-init` as the shebang in entrypoint.
- Formatted `LABEL` and `ENV` entries.
- Updated final `RUN` commands.
- Updated `ENTRYPOINT`.
### Fixed
- None.
### Removed
- None.
### Security
- None.
