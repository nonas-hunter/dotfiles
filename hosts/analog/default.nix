# Analog
# An old dog learning new tricks

{
  inputs,
  globals,
  overlays,
  ...
}:

inputs.darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { };
  modules = [
    ../../modules/common
    ../../modules/darwin
    (
      globals
      // rec {
        user = "luke.nonas-hunter";
      }
    )
    inputs.home-manager.darwinModules.home-manager
    {
      gui.enable = true;
      theme = {
        colors = (import ../../themes/ayu).mirage;
        darkMode = true;
      };
      alacritty.enable = true;
      vscode.enable = false;
    }
    
  ];
}
