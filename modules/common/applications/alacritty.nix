{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    alacritty = {
      enable = lib.mkEnableOption {
        description = "Enable Alacritty.";
        default = false;
      };
    };
  };

  config = lib.mkIf (config.gui.enable && config.alacritty.enable) {
    home-manager.users.${config.user} = {
      xsession.windowManager.i3.config.terminal = "alacritty";
      programs.alacritty = {
        enable = true;
        settings = {
          font = {
            size = 14.0;
          };
          colors = {
            primary = {
              background = config.theme.colors.background;
              foreground = config.theme.colors.foreground;
            };
            cursor = {
              text = config.theme.colors.foreground;
              cursor = config.theme.colors.cursor;
            };
            normal = {
              black = config.theme.colors.base00;
              red = config.theme.colors.base08;
              green = config.theme.colors.base0B;
              yellow = config.theme.colors.base0A;
              blue = config.theme.colors.base0D;
              magenta = config.theme.colors.base0E;
              cyan = config.theme.colors.base0C;
              white = config.theme.colors.base05;
            };
            bright = {
              black = config.theme.colors.base03;
              red = config.theme.colors.base09;
              green = config.theme.colors.base01;
              yellow = config.theme.colors.base02;
              blue = config.theme.colors.base04;
              magenta = config.theme.colors.base06;
              cyan = config.theme.colors.base0F;
              white = config.theme.colors.base07;
            };
          };
          draw_bold_text_with_bright_colors = false;
        };
      };
    };
  };
}
