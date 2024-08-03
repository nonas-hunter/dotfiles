{ inputs, config, pkgs, lib, ... }:
{
  options = {
    tmux = {
      enable = lib.mkEnableOption {
        description = "Enable tmux";
        default = true;
      };
    };
  };


  config = lib.mkIf (config.tmux.enable) {
    home-manager.users.${config.user} = {
      programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        terminal = "screen-256color";
        historyLimit = 100000;
        newSession = true;
      };
    };
  };
}


