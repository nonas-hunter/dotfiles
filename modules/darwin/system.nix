{
  config,
  pkgs,
  lib,
  ...
}:
{

  config = lib.mkIf pkgs.stdenv.isDarwin {
    services.nix-daemon.enable = true;

    nix.gc.interval = {
      Hour = 12;
      Minute = 15;
      Day = 1;
    };

    programs.zsh.enable = true;

    environment.systemPath = [
      "/Users/${config.user}/.local/bin"
    ];
  };

}
