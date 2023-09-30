# My neovim configuration
The intention is to stay as close to the default values/convetions as possible.

## Keybindings

[Added Keybindings](./added-keybindings.md)

## Shell scripts
- For development run `link-repo.sh` to remove previous config and create
a soft link to this repo.

- When done with changes run `deploy-repo.sh` to deploy the config
to the proper location.

## Usefull commands
- `PackerSync` to download and install packages.
- `LspXxx` to run various LSP commands.
- `Mason` for language server installations.

## Cleanup from previous installation
- `~/.config/nvim/`
- Packages stored at `~/.local/share/nvim` (`/site/pack/packer`)
and also logs `~/.cache/nvim`



