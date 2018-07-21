########################################
###inputs@
{ nixpkgs 
, compilerFlavor  ? "ghc"
, compilerVersion ? "843"
}:
########################################
let

name =
 ''${compilerFlavor}${compilerVersion}'';
 # ^ e.g. "ghc843"

utilities =
 nixpkgs.haskell.lib;

in
########################################
let

compiler = 
 import ./compiler {
  inherit nixpkgs;
  compilerName = name;
 };

packages =
 import ./packages {
  inherit nixpkgs;
  compilerName = name;
 };

in
########################################
{

 inherit packages compiler utilities name;

}
########################################
/*NOTES


*/
########################################