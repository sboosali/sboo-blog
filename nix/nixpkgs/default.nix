########################################
let

nixpkgs-bootstrap-path
 = <nixpkgs>;

nixpkgs-bootstrap =
 import nixpkgs-bootstrap-path {};

in
########################################
let

nixpkgs-pinned-path =
  (nixpkgs-bootstrap.fetchgit
    (nixpkgs-bootstrap.lib.importJSON
      ./nixpkgs.json));

nixpkgs-pinned =
 import nixpkgs-pinned-path {};

in
########################################

nixpkgs-pinned

########################################