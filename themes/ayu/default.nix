{
  mirage = {
    base00 = "#1F2430"; # Black (Host)
    base01 = "#FF3333"; # Red (Syntax string)
    base02 = "#BAE67E"; # Green (Command)
    base03 = "#FFA759"; # Yellow (Command second)
    base04 = "#73D0FF"; # Blue (Path)
    base05 = "#D4BFFF"; # Magenta (Syntax var)
    base06 = "#95E6CB"; # Cyan (Prompt)
    base07 = "#CBCCC6"; # White

    base08 = "#707ABC"; # Bright Black
    base09 = "#FF3333"; # Bright Red (Command error)
    base0A = "#BAE67E"; # Bright Green (Exec)
    base0B = "#FFA759"; # Bright Yellow
    base0C = "#73D0FF"; # Bright Blue (Folder)
    base0D = "#D4BFFF"; # Bright Magenta
    base0E = "#95E6CB"; # Bright Cyan
    base0F = "#CBCCC6"; # Bright White

    background = "#1F2430"; # Background
    foreground = "#CBCCC6"; # Foreground (Text)

    cursor = "#FFCC66"; # Cursor
  };

  config = {
    name = "ayu";
    author = "dempfi";
    nixvim_settings = {
      mirage = true;
      overrides = {
        Comment.bg = "NONE";
        Normal.bg = "NONE";
        NonText.ctermbg = "NONE";
        CursorLine.ctermbg = "NONE";
      };
    };
  };
}
