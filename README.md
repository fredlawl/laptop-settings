# Laptop Settings

## Dependencies

```sh
sudo apt install \
    stow \
    vim \
    zsh
```

- [Oh-my-zsh](https://ohmyz.sh/)

## Dotfiles

These are my generic settings that can be applied anywhere.

`stow -t "/home/$USER" --dotfiles -v dotfiles`

For specific systems:

`stow -t "/home/$USER" --dotfiles -v dotfiles-*`

All `dotfiles-*` depend on `dotfiles`.

### dotfiles-i3

Dependencies:

```sh
sudo apt install \
    feh \
    gnome-screenshot \
    i3 \
    i3lock \
    polybar \
    rofi
```

## Installing system

These are my generic settings that can be applied anywhere.

`stow -t "/" -v system`

For specific systems:

`stow -t "/" -v system-*`

## Test

To play with stow.

`stow -t "/home/$USER" --dotfiles -nv test`
