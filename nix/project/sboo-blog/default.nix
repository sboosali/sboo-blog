########################################
{ haskellPackages
, systemPackages
, projectRoot
}:
########################################
let

derivationViaCabal2nix =
 haskellPackages.callCabal2nix projectRoot {};

in
########################################

derivationViaCabal2nix

########################################
/*NOTES

====================
callCabal2nix

  haskellPackages.callCabal2nix ~/sboo-blog

is equivalent to:

  $ cabal2nix sboo-blog.cabal > ...

====================

*/
########################################