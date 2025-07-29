# CHANGELOG

## 2025-07-28
- Update GitHub Actions workflow to use run ID in commit message for scheduled builds [3da220a](https://github.com/demyxsh/ssh/commit/3da220a894a17b10399f491bcb9f05e7086c5a46)

## 2024-02-08
- Update description with shameless plug and support link [97b9bef](https://github.com/demyxsh/ssh/commit/97b9befcd61d82f7a9f38f1cc425fc18e619d69e)
- Set base image to Alpine 3.18 [371df27](https://github.com/demyxsh/ssh/commit/371df272091b883e2237f431b1e0839556412332)

## 2023-08-17
- Add new file [5890f46](https://github.com/demyxsh/ssh/commit/5890f46a3d658a235bfbc692241fe71b03ff8702)
- Misc updates [114352d](https://github.com/demyxsh/ssh/commit/114352daa62da00d6f1d02406ae2627bd9f51b99)
- Add new ENVs [fcff27d](https://github.com/demyxsh/ssh/commit/fcff27d2a914c411a45e6ee676994c00fa3b62b3)

## 2022-03-03
- Put commands in a function [e7757d3](https://github.com/demyxsh/ssh/commit/e7757d37b5d653676f103e956b2ec90314ad91ec)
- Start sshd with custom log [512ff82](https://github.com/demyxsh/ssh/commit/512ff827139c1ad0172f594d7b13cdca2bc57ce8)
- Use -L flag in the conditional [7bd7c70](https://github.com/demyxsh/ssh/commit/7bd7c70466a86cc5440d161ec571318b9831bac4)
- Create .ssh directory if it doesn't exist [c161f25](https://github.com/demyxsh/ssh/commit/c161f2557bfbf00f9fd21683140a9fa57e6eb76d)
- Change log name if DEMYX_DOMAIN is set, default to ssh [2465a7e](https://github.com/demyxsh/ssh/commit/2465a7e79a8f38b07c1fe1e467a0abb6d1d59eae)
- Add WORKDIR [47fb741](https://github.com/demyxsh/ssh/commit/47fb74186cdf50675d39552558555aaa6e03ab6f)
- Set bash as the shell [b740fdd](https://github.com/demyxsh/ssh/commit/b740fdd83fecbc52377dcd01af5bea965cb195c6)

## 2022-01-19
- Update README.md [217a670](https://github.com/demyxsh/ssh/commit/217a670d101e7ef559a6a9710706eca1ed6ba4d6)
- Create version.json [6b09680](https://github.com/demyxsh/ssh/commit/6b0968021b3e8547cb166d06a02534f6d7ca0a90)
- Migrate to GitHub Actions [1222c5d](https://github.com/demyxsh/ssh/commit/1222c5d7fcf8c8155bc7cbe35f39257e0c00a4d9)

## 2021-03-08
- Added
    - `bin/demyx-entrypoint`
    - `bin/demyx-permission`
- Changed
    - Renamed src to bin.
    - Renamed entrypoint.sh to demyx-entrypoint.
    - Renamed permission.sh to demyx-permission.
    - `bin/demyx-entrypoint`
        - Add comments below the shebang.
        - Set strict mode.
        - Execute demyx-permission with sudo.
    - `bin/demyx-permission`
        - Add comments below the shebang.
        - Set strict mode.
    - `Dockerfile`
        - Update main environment variables and support old ones.
        - Rearrange RUN commands.
        - Update bash PS1.
        - Update COPY directory.
        - Move some commands to finalize RUN.
- Removed

## 2020-06-16
### Added
- permission.sh to generate host keys and reset permission/ownership

## 2020-04-14
### Added
- Created src directory for main file(s)
### Changed
- Set dumb-init as the shebang in the entrypoint
- Format LABEL and ENV entries
- Update finalize RUN commands
- Update ENTRYPOINT
### Removed
