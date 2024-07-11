{ inputs, config, pkgs, lib, ... }:
{
  options = {
    nixvim = {
      enable = lib.mkEnableOption {
        description = "Enable neovim";
        default = false;
      };
    };
  };

  config = lib.mkIf (config.nixvim.enable) {
    home-manager.users.${config.user} = {
      programs.nixvim = {
        enable = true;
        colorschemes.${config.theme.name}.enable = true;
        colorschemes.${config.theme.name}.settings = {
          transparent_background = 1;
          background = "hard";
        };
      };
    };
  };
}

