# kickstart.nvim

## Introduction

A starting point for Neovim that is:

- Small
- Single-file
- Completely Documented

**NOT** a Neovim distribution, but instead a starting point for your configuration.

## Installation

### Install Neovim

Kickstart.nvim targets _only_ the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

External Requirements:

- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If want to write Typescript, you need `npm`
  - If want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Linux specific notes
> and quick install snippets

### Install Kickstart

> **NOTE** > [Backup](#FAQ) your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS           | PATH                                      |
| :----------- | :---------------------------------------- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |

#### Clone the repo

<details><summary> Linux and Mac </summary>

using https

```sh
git clone https://github.com/robinLudan/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

using ssh

```sh
git clone git@github.com:robinLudan/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>
### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. That includes also
examples of adding popularly requested plugins.

### Getting Started

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

### FAQ

- What should I do if I already have a pre-existing neovim configuration?
  - You should back it up and then delete all associated files.
  - This includes your existing init.lua and the neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
- Can I keep my existing configuration in parallel to kickstart?
  - Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
- What if I want to "uninstall" this configuration:
  - See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information
- Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  - The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the
    same functionality is available here:
    - [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  - Discussions on this topic can be found here:
    - [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    - [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Linux Install

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```

</details>
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git neovim
```

</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```

</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```

</details>
