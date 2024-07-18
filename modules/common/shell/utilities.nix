{ config, pkgs, ... }:

{
  config = {
    home-manager.users.${config.user} = {
      home.packages = with pkgs; [
        cmake
        ninja
        gperf
        wget
        ccache
        qemu
        dtc
        libmagic
        openocd
      ];
    };
  };
}
