# CHANGELOG

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
