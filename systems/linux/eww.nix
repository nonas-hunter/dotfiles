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
  home.file."${specialArgs.dotfiles}/configs/eww/colors.scss".text = ''
  $base00: #${config.colorScheme.colors.base00};
  $base01: #${config.colorScheme.colors.base01};
  $base02: #${config.colorScheme.colors.base02};
  $base03: #${config.colorScheme.colors.base03};
  $base04: #${config.colorScheme.colors.base04};
  $base05: #${config.colorScheme.colors.base05};
  $base06: #${config.colorScheme.colors.base06};
  $base07: #${config.colorScheme.colors.base07};
  $base08: #${config.colorScheme.colors.base08};
  $base09: #${config.colorScheme.colors.base09};
  $base0a: #${config.colorScheme.colors.base0A};
  $base0b: #${config.colorScheme.colors.base0B};
  $base0c: #${config.colorScheme.colors.base0C};
  $base0d: #${config.colorScheme.colors.base0D};
  $base0e: #${config.colorScheme.colors.base0E};
  $base0f: #${config.colorScheme.colors.base0F};
'';

  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ../../configs/eww;
  };
}
