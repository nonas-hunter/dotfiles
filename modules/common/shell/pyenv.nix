{ inputs, config, pkgs, lib, ... }:
{
  options = {
    pyenv = {
      enable = lib.mkEnableOption {
        description = "Enable pyenv";
        default = false;
      };
    };
  };

  config = lib.mkIf (config.pyenv.enable) {
    home-manager.users.${config.user} = {
      programs.pyenv = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}


