{ config, pkgs, specialArgs, lib, ... }:
let
  helpers = import ../helpers.nix {
    inherit pkgs;
    inherit lib;
    inherit config;
    inherit specialArgs;
  };
in
{
  imports = [
    ../shared.nix
    ./desktop.nix
  ];

  targets.genericLinux.enable = true;

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.bash.enable = true;
}
