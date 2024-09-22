# Laptop Settings

## Dependencies

- stow (GNU stow)
- vim
- zsh
- [Oh-my-zsh](https://ohmyz.sh/)

## Dotfiles

These are my generic settings that can be applied anywhere.

`stow -t "/home/$USER" --dotfiles -v dotfiles`

For speicifc sysetms:

`stow -t "/home/$USER" --dotfiles -v dotfiles-*`

## Installing system

Useful for specific systems. In the future, these would be split
further into their own root-directories prefixed with `system-`.

`stow -t "/" -v system`

`stow -t "/" -v system-*`

## Test

To play with stow.

`stow -t "/home/$USER" --dotfiles -nv test`
