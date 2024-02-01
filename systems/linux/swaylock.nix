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
  programs.swaylock = {
    enable = false;
    package = pkgs.swaylock;
    settings = {
      color = "${config.colorScheme.colors.base00}";
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "${config.colorScheme.colors.base05}";
      show-failed-attempts = true;
    };
  };
}
