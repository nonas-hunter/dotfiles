{ config, pkgs, specialArgs, lib, ... }:
let
  helpers = import ./helpers.nix {
    inherit pkgs;
    inherit lib;
    inherit config;
    inherit specialArgs;
  };
in
{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.username = specialArgs.username;
  home.homeDirectory = specialArgs.home;
  home.stateVersion = specialArgs.version;

  home.packages = [
    pkgs.neovim
    pkgs.direnv
  ];


  programs.git.enable = true;
  programs.home-manager.enable = true;
}
