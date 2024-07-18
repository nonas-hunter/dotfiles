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
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        colorschemes.everforest = {
          enable = true;
          settings = {
            transparent_background = 1;
            background = "hard";
          };
        };

        opts = {
          swapfile = false;
          fileencoding = "utf-8";
          termguicolors = true;
          spell = true;
          wrap = false;
          
          tabstop = 4;
          shiftwidth = 4;
          expandtab = true;
          autoindent = true;
        };

        plugins.telescope = {
          enable = true;
          settings.defaults = {
            file_ignore_patterns = [
              "^.git/"
              "^__pycache__/"
              "%.ipynb"
            ];
            set_env.COLORTERM = "truecolor";
          };
        };
      };
    };
  };
}


