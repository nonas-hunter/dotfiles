{ config, pkgs, lib, ... }:
{
  options = {
    yabai = {
      enable = lib.mkEnableOption {
        description = "Enable Yabai.";
        default = false;
      };
    };
  };

  config = lib.mkIf (pkgs.stdenv.isDarwin && config.yabai.enable) {
    services.yabai = {
      enable = true;
      config = {
        focus_follows_mouse = "autoraise";
        mouse_follows_focus = "off";
        window_placement    = "second_child";
        window_opacity      = "off";
        top_padding         = 36;
        bottom_padding      = 10;
        left_padding        = 10;
        right_padding       = 10;
        window_gap          = 10;
      };
      extraConfig = [
        "yabai -m rule --add app='System Preferences' manage=off"
      ];
    };

    services.skhd = {
      enable = true;
    };
  };
}
