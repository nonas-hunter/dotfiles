{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    vscode = {
      enable = lib.mkEnableOption {
        description = "Enable Firefox.";
        default = false;
      };
    };
  };

  config = lib.mkIf (config.gui.enable && config.vscode.enable) {
    home-manager.users.${config.user} = {
      programs.vscode = {
        enable = true;
        enaleUpdateCheck = false
        enableExtensionUpdateCheck = false;
  
        extensions = (with pkgs.vscode-extensions; []);
  
        userSettings = {
          # General
          "editor.fontSize" = 16;
          "editor.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";
          "terminal.integrated.fontSize" = 14;
          "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
          "window.zoomLevel" = 1;
          "editor.multiCursorModifier" = "ctrlCmd";
          "workbench.startupEditor" = "none";
          "explorer.compactFolders" = false;
          # Whitespace
          "files.trimTrailingWhitespace" = true;
          "files.trimFinalNewlines" = true;
          "files.insertFinalNewline" = true;
          "diffEditor.ignoreTrimWhitespace" = false;
          # Git
          "git.enableCommitSigning" = true;
          "git-graph.repository.sign.commits" = true;
          "git-graph.repository.sign.tags" = true;
          "git-graph.repository.commits.showSignatureStatus" = true;
          # Styling
          "window.autoDetectColorScheme" = true;
          "workbench.preferredDarkColorTheme" = "Default Dark Modern";
          "workbench.preferredLightColorTheme" = "Default Light Modern";
          "workbench.iconTheme" = "material-icon-theme";
          "material-icon-theme.activeIconPack" = "none";
          "material-icon-theme.folders.theme" = "classic";
        };
      };
    };

    environment.systemPath = "/Applications/Visual Studio Code.app/Contents/Resources/app/bin";
  };
}
