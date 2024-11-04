{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    zsh = {
      enable = lib.mkEnableOption {
        description = "Enable zsh";
        default = true;
      };
    };
  };

  config = lib.mkIf (config.zsh.enable) {
    home-manager.users.${config.user} = {
      programs.zsh = {
        enable = true;
      };
      programs.direnv = {
        enableZshIntegration = true;
      };
    };
  };
}
