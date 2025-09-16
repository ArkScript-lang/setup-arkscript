# setup-arkscript

An action to be able to run ArkScript code in GitHub CIs.

## Usage

```yaml
- name: Setup ArkScript
  uses: ArkScript-lang/setup-arkscript@master
  with:
    os: ubuntu-24.04
    version: latest
    stdlib_update: yes
```

## Inputs

- **os**: OS ArkScript will be running on: linux (or ubuntu), windows, or macos.
    - Names like `ubuntu-latest` or `macos-14` will work because only the part before the `-` is used
- **version**: defaults to **latest**
    - **latest** will download the latest available release
    - **any valid tag** that exists on ArkScript-lang/Ark repository, eg **v4.0.0-18**
- **stdlib_update**: defaults to **no**
    - **yes**: fetch the latest available ArkScript stdlib
    - **no**: do not update the stdlib and use the one bundled with the release

