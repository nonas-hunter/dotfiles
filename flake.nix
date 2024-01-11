{
  description = "Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixgl.url = "github:guibou/nixgl";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, nixgl, home-manager, ...}@inputs:
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
        };
        modules = [ ./systems/linux/home.nix ];
      };
    };
}


