{
  config,
  pkgs,
  lib,
  ...
}:
{

  config = lib.mkIf pkgs.stdenv.isDarwin {

    users.users."${config.user}" = {
      # macOS user
      home = config.homePath;
    };

    home-manager.users.root.home.homeDirectory = lib.mkForce "/var/root";

  };
}
