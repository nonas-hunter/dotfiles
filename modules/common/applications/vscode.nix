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
    unfreePackages = [ "vscode" ];
    home-manager.users.${config.user} = {
      programs.vscode = {
        enable = true;
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
  
        extensions = (with pkgs.vscode-extensions; [
          vscodevim.vim
          ms-python.python
          teabyii.ayu
        ]);
  
        userSettings = {
          # General
          "editor.fontSize" = 14;
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
          "workbench.preferredDarkColorTheme" = "Ayu Mirage";
          "workbench.preferredLightColorTheme" = "Ayu Light";
          "workbench.iconTheme" = "material-icon-theme";
          "material-icon-theme.activeIconPack" = "none";
          "material-icon-theme.folders.theme" = "classic";
        };
      };
    };

  };
}
