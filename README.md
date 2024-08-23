# dotfiles

This system is used to install and update nix home manager on linux and mac. Home manager is configured to setup both dev tools and basic graphical programs for everyday use.

## Installation

### macOS

First install Nix. I recommend using the [graphical installer](https://determinate.systems/posts/graphical-nix-installer/) from [Determiniate Systems](https://determinate.systems/).

If you prefer to have a little more control over the install process you can use the Determinate Systems [commandline installer](https://github.com/DeterminateSystems/nix-installer) by running the following command.

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Now launch a new shell and run the following.

```bash
nix \
	--extra-experimental-features flakes \
	--extra-experimental-features nix-command \
	run nix-darwin -- switch \
	--flake github:nonas-hunter/dotfiles#[INSERT HOST NAME]
```

Once installed you can use the following command to update the macOS configuration.

```bash
darwin-rebuild switch --flake [INSERT PATH TO DOTFILES REPO]
```

## Inspiration
  
- Initial setup inspired by [rengare](https://github.com/rengare/dotfiles/tree/main)
- Updated setup inspired by [nmasur](https://github.com/nmasur/dotfiles/tree/master)
- Nixvim setup inspired by [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and [JMartJonesy](https://github.com/JMartJonesy/kickstart.nixvim/tree/main)
