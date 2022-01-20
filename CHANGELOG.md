# CHANGELOG

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
