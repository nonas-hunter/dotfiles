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
      home-manager.sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];
      gui.enable = true;
      theme = {
         colors = (import ../../themes/ayu).mirage;
         config = (import ../../themes/ayu).config;
      };
      alacritty.enable = true;
      homebrew.enable = true;
      vscode.enable = false;
      nixvim.enable = true;
    }

  ];
}
