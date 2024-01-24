{
  description = "Python Template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = {nixpkgs, ...}@inputs:
  let
    system = "x86_64-linux";
    pythonVersion = "python39";
    pkgs = import inputs.nixpkgs { inherit system; config.allowUnfree = true; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs;
        let
          devPython = pkgs.${pythonVersion}.withPackages
            (packages: with packages; [ 
              virtualenv
              pip
              setuptools
              wheel
            ]);
        in [ devPython ];
      shellHook = ''
        # Tells pip to put packages into $PIP_PREFIX instead of the usual locations.
        # See https://pip.pypa.io/en/stable/user_guide/#environment-variables.
        export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH
        export PIP_PREFIX=$(pwd)/_build/pip_packages
        export PYTHONPATH="$PIP_PREFIX/${pkgs.python3.sitePackages}:$PYTHONPATH"
        export PATH="$PIP_PREFIX/bin:$PATH"
        unset SOURCE_DATE_EPOCH
      '';
    };
  };
}
