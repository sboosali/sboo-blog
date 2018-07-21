########################################
{ nixpkgs ? import ../nixpkgs
}:
########################################
let

haskellPackages =
 import ../haskell { inherit nixpkgs };

in
########################################
let

environment = 
 haskellPackages.callPackage (./default.nix) {};

in
########################################

environment

########################################