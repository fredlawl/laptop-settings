# Laptop Settings

## Dependencies

```sh
sudo apt install \
    fzf \
    ripgrep \
    stow \
    vim \
    zsh

# Install this after Oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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

### dotfiles-nvim

Dependencies:

**Install & setup neovim**:

```sh
sudo apt purge neovim
sudo apt install fd-find lazygit luarocks
git clone git@github.com:neovim/neovim.git
cd neovim
git checkout stable
```

Follow INSTALL instructions to build and install neovim.

**Install & setup nvm**:

Download & install from [here](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)

```sh
source ~/.zshrc
nvm install node --lts
nvm use --lts
```

## Installing system

These are my generic settings that can be applied anywhere.

`stow -t "/" -v system`

For specific systems:

`stow -t "/" -v system-*`

## Test

To play with stow.

`stow -t "/home/$USER" --dotfiles -nv test`
