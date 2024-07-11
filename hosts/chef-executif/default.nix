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
    globals
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager.sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];

      gui.enable = true;
      theme = {
        name = (import ../../themes/everforest).name;
        colors = (import ../../themes/everforest).darkHard;
        darkMode = true;
      };
      alacritty.enable = true;
      nixvim.enable = true;
    }
    
  ];
}
