{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = lib.mkIf (pkgs.stdenv.isDarwin && config.homebrew.enable) {

    # Requires Homebrew to be installed
    system.activationScripts.preUserActivation.text = ''
      if ! xcode-select --version 2>/dev/null; then
        $DRY_RUN_CMD xcode-select --install
      fi
      if ! /opt/homebrew/bin/brew --version 2>/dev/null; then
        $DRY_RUN_CMD /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      fi
    '';

    homebrew = {
      brews = [
        "pipx"
        "pyenv"
        "pyenv-virtualenv"
        "cmake"
        "ninja"
        "gperf"
        "ccache"
        "qemu"
        "dtc"
        "libmagic"
        "wget"
        "openocd"
        "uv"
      ];
      casks = [
        "docker"
      ];
      onActivation = {
        autoUpdate = false; # Don't update during rebuild
        cleanup = "zap"; # Uninstall all programs not declared
        upgrade = true;
      };
      global = {
        brewfile = true; # Run brew bundle from anywhere
        lockfiles = false; # Don't save lockfile (since running from anywhere)
      };
    };

    home-manager.users.${config.user} = lib.mkIf (config.zsh.enable){
      home.sessionPath = [ "/opt/homebrew/bin/" ];
      programs.zsh = {
        profileExtra = ''
          export PYENV_ROOT="$HOME/.pyenv"
          [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
          eval "$(pyenv init -)"
        '';
        initExtra = ''
          export PYENV_ROOT="$HOME/.pyenv"
          [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
          eval "$(pyenv init -)"
          eval "$(pyenv virtualenv-init -)"
        '';
      };
    };
  };
}
