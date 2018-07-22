########################################
{ nixpkgs         ? import ../nixpkgs
}:
########################################
let

inherit (nixpkgs)
 stdenv pkgs;

in
########################################
let

project =
 import ./project.nix;

in
########################################
let

environment =
 (import ./system.nix) {
  inherit pkgs stdenv;
  inherit project;
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