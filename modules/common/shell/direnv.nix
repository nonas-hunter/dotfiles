{ config, ... }:
{

  # Enables quickly entering nix sheels when changing directories
  home-manager.users.${config.user}.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      whitelist = {
        prefix = [ config.dotfilesPath ];
      };
      hide_env_diff = true;
    };
  };

  # Prevent garbage collection
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

}

