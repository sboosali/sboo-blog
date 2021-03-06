########################################
{ nixpkgs         ? import ../nixpkgs
}:
########################################
let

inherit (nixpkgs)
 stdenv pkgs;

in
########################################
# let

# haskell =
#  import ../haskell {
#   inherit nixpkgs;
#  };

# haskellName      = haskell.name;
# haskellUtilities = haskell.utilities;
# haskellCompiler  = haskell.compiler;
# haskellPackages  = haskell.packages;

# in
########################################
let

environment =
 import (./.) {
  inherit pkgs stdenv;
 };

in
########################################

environment

########################################
/*NOTES

====================

====================

*/
########################################