{ config, pkgs, specialArgs, lib, ... }:
let
  helpers = import ../helpers.nix {
    inherit pkgs;
    inherit lib;
    inherit  config;
    inherit specialArgs;
  };
in
{
  imports = [
    (helpers.linkAppConfig "hypr")
    (helpers.linkAppConfig "eww")
    (helpers.linkAppConfig "easyeffects")
  ];

  fonts.fontconfig.enable = true;

  home.packages = [
    (helpers.nixGLMesaWrap pkgs.alacritty)
    pkgs.firefox
    pkgs.wofi
    pkgs.eww-wayland
    pkgs.pavucontrol
    pkgs.helvum
    pkgs.easyeffects
    pkgs.slack
    pkgs.spotify
    pkgs.wpgtk

    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
    pkgs.noto-fonts-emoji
    pkgs.fira-code
    pkgs.font-awesome
    pkgs.comic-mono
  ];
}
