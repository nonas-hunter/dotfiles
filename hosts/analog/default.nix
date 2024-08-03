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
        gitEmail = "luke.nonas-hunter@analog.com";
        gitName = "Luke Nonas-Hunter";
      }
    )
    inputs.home-manager.darwinModules.home-manager
    {
      nixpkgs.overlays = [] ++ overlays;
      home-manager.sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];
      gui.enable = true;
      theme = {
         colors = (import ../../themes/ayu).mirage;
         config = (import ../../themes/ayu).config;
      };
      alacritty.enable = true;
      homebrew.enable = true;
      zsh.enable = true;
      vscode.enable = true;
      nixvim.enable = true;
      tmux.enable = true;
    }

  ];
}
