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
    (helpers.linkAppConfig "swaylock")
  ];

  home.file."${specialArgs.dotfiles}/configs/swaylock/config".text = ''
  ignore-empty-password
  show-failed-attempts
  line-uses-inside
  indicator-caps-lock

  image=$HOME/.config/hypr/background.png

  indicator-radius=75
  indicator-thickness=20

  text-color=${config.colorScheme.colors.base0B}
  text-clear-color=${config.colorScheme.colors.base0A}
  text-ver-color=${config.colorScheme.colors.base0C}
  text-wrong-color=${config.colorScheme.colors.base08}

  key-hl-color=${config.colorScheme.colors.base0C}
  bs-hl-color=${config.colorScheme.colors.base08}

  ring-color=${config.colorScheme.colors.base0B}
  ring-wrong-color=${config.colorScheme.colors.base08}
  ring-ver-color=${config.colorScheme.colors.base0C}
  ring-clear-color=${config.colorScheme.colors.base0A}

  caps-lock-key-hl-color=${config.colorScheme.colors.base0A}
  caps-lock-bs-hl-color=${config.colorScheme.colors.base08}
  text-caps-lock-color=${config.colorScheme.colors.base0A}
  ring-caps-lock-color=${config.colorScheme.colors.base0B}

  color=${config.colorScheme.colors.base00}
  inside-color=${config.colorScheme.colors.base00}
  inside-wrong-color=${config.colorScheme.colors.base00}
  inside-clear-color=${config.colorScheme.colors.base00}
  inside-caps-lock-color=${config.colorScheme.colors.base00}
  inside-ver-color=${config.colorScheme.colors.base00}
  separator-color=${config.colorScheme.colors.base00}
'';
}
