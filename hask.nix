{ mkDerivation, base, hpack, stdenv }:
mkDerivation {
  pname = "example";
  version = "0.0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [ base ];
  preConfigure = "hpack";
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
