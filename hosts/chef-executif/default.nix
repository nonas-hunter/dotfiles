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
    inputs.home-manager.darwinModules.home-manager
    {
      gui.enable = true;
      theme = {
        colors = (import ../../themes/everforest).darkHard;
        dark = true;
      };
    }
    
  ];
}
