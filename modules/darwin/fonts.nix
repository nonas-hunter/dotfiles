{
  config,
  pkgs,
  lib,
  ...
}:
{
  config.home-manager.users.${config.user} = lib.mkIf pkgs.stdenv.isDarwin {
    home.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

    programs.alacritty.settings = lib.mkIf (config.gui.enable && config.alacritty.enable) {
      font.normal.family = "JetBrainsMono Nerd Font";
    };
  };
}
