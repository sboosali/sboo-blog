########################################
{ haskellPackages
, systemPackages
}:
########################################
let

name =
 "sboo-blog";

myDerivation = haskellPackages.mkDerivation {
 name        = "${name}-environment";
 buildInputs = [
   ()
 ];
};

myEnvironment = 
 myDerivation.env;

in
########################################

myEnvironment

########################################
/*NOTES

====================

  haskellPackages.mkDerivation =
    { buildInputs ? []
    , outputs     ? [ "out" ]
    , ...
    }:
    ...
    stdenv.mkDerivation { ... }

====================

`zlib.dev`

the "development output" has:
- `libz.so`
- `z.h`

and registers them in the right locations for different compilers.

====================

*/
########################################