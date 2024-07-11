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
    home-manager.sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];

    home-manager.users.${config.user} = {
      modules = [ inputs.nixvim.homeManagerModules.nixvim ];
      programs.nixvim = {
        enable = true;
      };
    };
  };
}

