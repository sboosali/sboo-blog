########################################
{ stdenv
, zlib
}:
########################################
let

name =
"sboo-blog";

systemPackages = [ 
 zlib.out
 zlib.dev
];

in
########################################

stdenv.mkDerivation {
 name        = "${name}--system-environment";
 buildInputs = systemPackages;
 outputs     = ["out" "dev"];
}

########################################
/*NOTES

====================

  mkDerivation =
    { buildInputs ? []
    , outputs     ? [ "out" ]
    , ...
    }:
    ...
    derivation { ... }

====================

`zlib.dev`

the "development output" has:
- `libz.so`
- `z.h`

====================

*/
########################################