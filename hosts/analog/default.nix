# Chef Exécutif
# Leader of the brigade

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
        colors = (import ../../themes/everforest).darkHard;
        darkMode = true;
      };
      alacritty.enable = true;
      vscode.enable = true;
    }
    
  ];
}
