########################################
inputs@
{ haskellPackages
, projectRoot
, systemPackages  ? {}
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