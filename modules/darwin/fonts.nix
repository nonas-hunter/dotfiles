{
  config,
  pkgs,
  lib,
  ...
}:
{
  home-manager.users.${config.user} = lib.mkIf pkgs.stdenv.isDarwin {
    home.packages = with pkgs; [ (nerdfonts.override { fonts = [ "VictorMono" ]; }) ];

    programs.alacritty.settings = lib.mkIf (config.gui.enable && config.alacritty.enable) {
      font.normal.family = "VictorMono Nerd Font";
    };
  };
}
