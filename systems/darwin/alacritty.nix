{ config, pkgs, specialArgs, lib, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors.primary.foreground = "#${config.colorScheme.colors.base05}";
      colors.primary.background = "#${config.colorScheme.colors.base00}";

      colors.cursor.text = "#${config.colorScheme.colors.base00}";
      colors.cursor.cursor = "#${config.colorScheme.colors.base05}";

      colors.normal.black = "#${config.colorScheme.colors.base00}";
      colors.normal.red = "#${config.colorScheme.colors.base08}";
      colors.normal.green = "#${config.colorScheme.colors.base0B}";
      colors.normal.yellow = "#${config.colorScheme.colors.base0A}";
      colors.normal.blue = "#${config.colorScheme.colors.base0D}";
      colors.normal.magenta = "#${config.colorScheme.colors.base0E}";
      colors.normal.cyan = "#${config.colorScheme.colors.base0C}";
      colors.normal.white = "#${config.colorScheme.colors.base05}";

      colors.bright.black = "#${config.colorScheme.colors.base03}";
      colors.bright.red = "#${config.colorScheme.colors.base08}";
      colors.bright.green = "#${config.colorScheme.colors.base0B}";
      colors.bright.yellow = "#${config.colorScheme.colors.base0A}";
      colors.bright.blue = "#${config.colorScheme.colors.base0D}";
      colors.bright.magenta = "#${config.colorScheme.colors.base0E}";
      colors.bright.cyan = "#${config.colorScheme.colors.base0C}";
      colors.bright.white = "#${config.colorScheme.colors.base07}";

      colors.indexed_colors = [
        {index = 17; color = "#${config.colorScheme.colors.base0F}";}
        {index = 18; color = "#${config.colorScheme.colors.base01}";}
        {index = 16; color = "#${config.colorScheme.colors.base09}";}
        {index = 19; color = "#${config.colorScheme.colors.base02}";}
        {index = 20; color = "#${config.colorScheme.colors.base04}";}
        {index = 21; color = "#${config.colorScheme.colors.base06}";}
      ];
    };
  };
}
