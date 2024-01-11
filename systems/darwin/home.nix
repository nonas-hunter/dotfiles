{ config, pkgs, specialArgs, lib, ... }:
let
  helpers = import ../helpers.nix {
    inherit pkgs;
    inherit lib;
    inherit config;
    inherit specialArgs;
  };
in
{
  imports = [
    ../shared.nix
    ./theme.nix
    ./alacritty.nix
    specialArgs.nix-colors.homeManagerModules.default
  ];

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

}
