{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    homebrew = {
      enable = lib.mkEnableOption {
        description = "Configure zsh .zprofile to enable homebrew";
        default = false;
      };
    };
  };

  config = lib.mkIf (config.homebrew.enable && config.zsh.enable) {
    home-manager.users.${config.user} = {
      programs.zsh = { 
        profileExtra = ''
          eval "$(/opt/homebrew/bin/brew shellenv)"
        '';
      };
    };
  };
}
