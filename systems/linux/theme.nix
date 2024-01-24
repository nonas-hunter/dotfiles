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

  colorScheme = specialArgs.nix-colors.colorSchemes.gruvbox-dark-medium;

  home.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
    pkgs.noto-fonts-emoji
    pkgs.linearicons-free
    pkgs.fira-code
    pkgs.font-awesome
    pkgs.comic-mono
    pkgs.orbitron
  ];
}
