{
  description = "Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixgl.url = "github:guibou/nixgl";
    nix-colors.url = "github:misterio77/nix-colors";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, nixgl, nix-colors, home-manager, ...}@inputs:
    let
      version = "23.11";
      username = "luke";
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      
    in
    {
      homeConfigurations.luke-linux = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = allowUnfree;
          config.allowUnfreePredicate = allowUnfreePredicate;
          overlays = [ nixgl.overlay ];
        };
        extraSpecialArgs = {
          inherit inputs;
          username = username;
          home = "/home/${username}";
          dotfiles = "/home/${username}/dotfiles";
          version = version;
          nix-colors = nix-colors;
        };
        modules = [ ./systems/linux/home.nix ];
      };

      homeConfigurations.luke-darwin = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnfree = allowUnfreePredicate;
          config.allowUnfreePredicate = allowUnfreePredicate;
        };
        extraSpecialArgs = {
          inherit inputs;
          username = username;
          home = "/Users/${username}";
          dotfiles = "/Users/${username}/Documents/dotfiles";
          version = version;
          nix-colors = nix-colors;
        };
        modules = [ ./systems/darwin/home.nix ];
      };
    };
}


