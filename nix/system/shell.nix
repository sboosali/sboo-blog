########################################
{ nixpkgs ? import ../nixpkgs
}:
########################################
let

# inherit (nixpkgs)
#  callPackage;

in
########################################
let

mkEnvironment =
 import ./default.nix;

environment = 
 nixpkgs.callPackage mkEnvironment {};

in
########################################

environment

########################################