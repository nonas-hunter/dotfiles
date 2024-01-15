{ config, pkgs, specialArgs, lib, ... }:
{
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = "${specialArgs.dotfiles}/configs/eww";
  }
}
