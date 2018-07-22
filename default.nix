########################################
{ mkDerivation, stdenv
, zlib
}:
########################################
let

systemDependencies = [
 zlib
]; 

in
########################################
mkDerivation {

  src     = ./.;
  pname   = "-sboo-blog--system-environment";
  version = "0.0";
  license = stdenv.lib.licenses.gpl3;

  isLibrary    = true;
  isExecutable = true;

  librarySystemDepends    = systemDependencies;
  libraryPkgconfigDepends = systemDependencies;
  executableSystemDepends = systemDependencies;
  testSystemDepends       = systemDependencies;
  benchmarkSystemDepends  = systemDependencies;

}
########################################
/*NOTES

====================

> Each package will need to be explicitly specified if zlib needs headers (zlib.dev) or libraries (zlib.out) or both.

====================

> attribute 'dev' missing, at /home/sboo/haskell/sboo-blog/default.nix:10:2

  [
   zlib.out
   zlib.dev
  ]; 

====================

*/
########################################