with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "shellac";
  
  buildInputs = [
    pkgs.cabal2nix
    pkgs.haskellPackages.hpack
  ];
}
