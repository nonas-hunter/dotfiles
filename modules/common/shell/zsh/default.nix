{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = {
    home-manager.users.${config.user} = {
      programs.zsh = {
        enable = true;
      };
    };
  };
}
