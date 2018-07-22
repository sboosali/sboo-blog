########################################
{ pkgs
, stdenv
, project
}:
########################################
let

systemBuildInputs = with pkgs; [
 zlib.out
 zlib.dev
];

in
########################################

stdenv.mkDerivation {
 name        = ''${project.name}--system-environment'';
 buildInputs = systemBuildInputs;
}

########################################