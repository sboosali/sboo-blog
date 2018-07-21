########################################
{ nixpkgs
, compilerName
}:
########################################
let

haskellPackages =
 nixpkgs.haskell.packages.${compilerName};

in
########################################

haskellPackages

########################################