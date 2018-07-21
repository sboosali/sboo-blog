########################################
{ nixpkgs
, compilerName
}:
########################################
let

haskellCompiler =
 nixpkgs.haskell.compilers.${compilerName};

in
########################################

haskellCompiler

########################################