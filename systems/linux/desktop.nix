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
    (helpers.linkAppConfig "easyeffects")
    (helpers.linkAppConfig "hypr")
  ];

  home.packages = [
    (helpers.nixGLMesaWrap pkgs.alacritty)
    (helpers.nixGLMesaWrap pkgs.firefox)
    pkgs.wofi
    pkgs.pavucontrol
    pkgs.helvum
    pkgs.easyeffects
    pkgs.slack
    pkgs.spotify
  ];

}
