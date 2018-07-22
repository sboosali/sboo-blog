########################################
{ stdenv
, haskellUtilities
}:
########################################
let

mkDerivationOnlySystemBuildInputs = p:
 stdenv.mkDerivation {
  name        = ''${p.pname}--system-environment'';
  buildInputs = getSystemBuildInputs p;
 };

# onlySystemBuildInputs = p:
#   (haskellUtilities.overrideCabal p (args: {
#     buildInputs = getSystemBuildInputs p;
#     # ^ NOTE not:
#     #
#     #    buildInputs = args.buildInputs ++ [...]
#     #
#     # we're replacing, not extending, the build inputs.
#   }));

# Extract the system (non-haskell) build inputs of a haskell package.
# This is useful to build (via `nix`) environments for
# developing (via `cabal new-build`) on that package.

getSystemBuildInputs = p:

  (haskellUtilities.overrideCabal p (args: {
    passthru = (args.passthru or {}) // {
      _getSystemBuildInputs =
        (haskellUtilities.extractBuildInputs
          p.compiler
          args).systemBuildInputs;
    };
  }))._getSystemBuildInputs;

in
########################################
{
 inherit
  mkDerivationOnlySystemBuildInputs
  getSystemBuildInputs
  ;
}
########################################
/*NOTES

====================

`haskell.lib.overrideCabal`

         > haskellPackages.aeson.meta.homepage
         "https://github.com/bos/aeson"

         > x = haskell.lib.overrideCabal haskellPackages.aeson (old: { homepage = old.homepage + "#readme"; })

         > x.meta.homepage
         "https://github.com/bos/aeson#readme"

  overrideCabal = drv: f:
    (drv.override (original:
      original // 
      {
        mkDerivation = drv:
          (original.mkDerivation drv).override f;
      })) //
    {
      overrideScope = scope: 
        overrideCabal (drv.overrideScope scope) f;
    };

====================


*/
########################################