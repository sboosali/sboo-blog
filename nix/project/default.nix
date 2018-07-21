########################################
inputs@
{ haskellPackages
, systemPackages  ? {}
, projectRoot     ? ../../../.. #TODO
}:
########################################
let

sboo-blog =
 import ./sboo-blog inputs;

in
########################################
{
 inherit sboo-blog;
}
########################################