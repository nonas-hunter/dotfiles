{ config, lib, pkgs, ... }:

{
  config = {
    home-manager.users.${config.user} = {
      programs.zsh = {
        initExtra = ''
          export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
          export ZEPHYR_SDK_INSTALL_DIR=/Users/{config.user}/zephyr-sdk-0.16.3
          export STM32_PRG_PATH=/Applications/STMicroelectornics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin
        '';
      };
    };
  };
}
