########################################
{ nixpkgs         ? import ../nixpkgs
}:

#TODO:
# , compilerFlavor  ? null
# , compilerVersion ? null
########################################
let

inherit (nixpkgs) stdenv;

haskell =
 import ../haskell {
  inherit nixpkgs;
 };

haskellName      = haskell.name;
haskellUtilities = haskell.utilities;
haskellCompiler  = haskell.compiler;
haskellPackages  = haskell.packages;

in
########################################
let

projectRoot =
 (../..);
 # `<project-root>/nix/environment/`

project = 
 import ../project {
  inherit haskellPackages projectRoot;
 };

derivationWithHaskellPackages =
 project.sboo-blog;

in
########################################
let

sbooUtilities =
 import ../sboo {
  inherit haskellUtilities stdenv;
 };

derivationOnlySystemPackages =
 sbooUtilities.mkDerivationOnlySystemBuildInputs
  derivationWithHaskellPackages;

 # ^ let `cabal new-build` install all haskell packages,
 # while `nix` provisions all system packages.

environment = 
 ###derivationOnlySystemPackages.env;
 derivationOnlySystemPackages;

in
########################################

environment

########################################
/*NOTES

====================

`haskellUtilities.extractBuildInputs`


  # This is useful to build environments for developing on that
  # package.

  getHaskellBuildInputs = p:
    (overrideCabal p (args: {
      passthru = (args.passthru or {}) // {
        _getHaskellBuildInputs = extractBuildInputs p.compiler args;
      };
    }))._getHaskellBuildInputs;


see:
- https://github.com/NixOS/nixpkgs/blob/bc4c0c4f4d5e6ec52a8001443c3fe6ce00220697/pkgs/development/haskell-modules/lib.nix#L298


====================

*/
########################################