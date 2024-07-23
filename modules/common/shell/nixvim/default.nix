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

  imports = [
    ./lsp.nix
    ./nvim-cmp.nix
  ];

  config = lib.mkIf (config.nixvim.enable) {
    home-manager.users.${config.user} = {
      programs.nixvim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        colorschemes.${config.theme.config.name} = {
          enable = true;
          settings = config.theme.config.nixvim_settings;
        };

        opts = {
          number = true;

          showmode = false;
          breakindent = true;
          undofile = true;
          ignorecase = true;
          smartcase = true;
          signcolumn = "yes";
          updatetime = 250;
          timeoutlen = 300;
          splitbelow = true;
          splitright = true;
          scrolloff = 10;
          hlsearch = true;

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

        plugins = {
          telescope = {
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

          sleuth = {
            enable = true;
          };

          comment = {
            enable = true;
          };

          todo-comments = {
            enable = true;
            signs = true;
          };

          bufferline = {
            enable = true;
          };
        };
      };
    };
  };
}


