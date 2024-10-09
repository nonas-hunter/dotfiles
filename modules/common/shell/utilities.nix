{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      tree # display dir content
      uv # python manager
    ];
  };
}
