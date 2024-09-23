# Laptop Settings

## Dependencies

- stow (GNU stow)
- vim
- zsh
- [Oh-my-zsh](https://ohmyz.sh/)

## Dotfiles

These are my generic settings that can be applied anywhere.

`stow -t "/home/$USER" --dotfiles -v dotfiles`

For specific systems:

`stow -t "/home/$USER" --dotfiles -v dotfiles-*`

### dotfiles-i3

Dependencies:

- i3lock
- feh
- picom
- gnome-screenshot

## Installing system

These are my generic settings that can be applied anywhere.

`stow -t "/" -v system`

For specific systems:

`stow -t "/" -v system-*`

## Test

To play with stow.

`stow -t "/home/$USER" --dotfiles -nv test`
