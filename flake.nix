{
  description = "Luke's system";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      globals = 
        let
          baseName = "nonas-hunter";
        in
        rec {
          user = "luke";
          fullName = "Luke Nonas-Hunter";
          dotfilesRepo = "https://github.com/nonas-hunter/dotfiles";
        };

      overlays = [];

      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    rec {
      darwinConfigurations = {
        chef-executif = import ./hosts/chef-executif { inherit inputs globals overlays; };
        analog = import ./hosts/analog { inherit inputs globals overlays; };
      };

      homeConfigurations = {
        chef-executif = darwinConfigurations.chef-executif.config.home-manager.users.${globals.user}.home;
        analog = darwinConfigurations.analog.config.home-manager.users.${globals.user}.home;
      };
    };
}
