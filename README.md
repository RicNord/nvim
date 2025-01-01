# My Neovim configuration

The intention is to stay as close to the default values/conventions as possible
and minimize bloat.

## Keybindings for plugins etc

[Added Keybindings](./added-keybindings.md)

## Shell scripts

- For development run `link-repo.sh` to remove previous config and create a
  soft link to this repo.
- When done with changes run `deploy-repo.sh` to deploy the config to the
  proper location.
- To save backup of lazy-lock.json run:
  `cp ~/.config/nvim/lazy-lock.json ./lazy-lock.json.bk`

## Useful commands

- `Lazy` plugin manager
- `LspXxx` to run various LSP commands.
- `Mason` for language server installations.

## Cleanup from previous installation

- `~/.config/nvim/`
- `~/.local/share/nvim`
- `~/.local/state/nvim`
- `~/.cache/nvim`
