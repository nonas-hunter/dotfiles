{
  description = "Ledger Template";

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
      packages = with pkgs; [ ledger ];
    };
  };
}
