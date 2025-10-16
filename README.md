# Dotfiles

These are my dotfiles which are handled by [chezmoi](https://www.chezmoi.io/)

You can provision a new machine with the dotfiles using the following command

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jonathanballs
```

![Screenshot 2024-07-04 at 16 16 24](https://github.com/jonathanballs/dotfiles/assets/4366510/6c7718d2-3f4c-40f5-9cf9-ee8d057d26f4)

Once [homebrew](https://brew.sh/) is installed locally you can install relevant utilities with

```
brew bundle --file=~/.local/share/chezmoi/.Brewfile
```
