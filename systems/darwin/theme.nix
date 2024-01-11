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
  fonts.fontconfig.enable = true;

  colorScheme = specialArgs.nix-colors.colorSchemes.classic-light;
}
