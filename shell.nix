with import <nixpkgs> { };

let
  buildCabal 
    = pkgs.writeShellScriptBin "buildCabal" ''
      ${pkgs.haskellPackages.hpack}/bin/hpack && 
      ${pkgs.cabal2nix}/bin/cabal2nix . > hask.nix
    '';
in
  stdenv.mkDerivation {
    name = "shellac";
    
    buildInputs = [
      buildCabal
    ];
  }
