{ packages ? ""
}:
let
  nixpkgs = import ./nix/nixpkgs.nix;
  pre-commit-check = import ./nix/pre-commit.nix;
  monorepo = import ./keymapp.nix;
  allPackages = builtins.attrNames monorepo;
  shell-packages =
    if packages == ""
    then allPackages
    else nixpkgs.lib.strings.splitString "," packages;

  generate-proto = import ./scripts/generate-proto.nix { inherit nixpkgs; };
in
with nixpkgs;
with nixpkgs.haskellPackages;
shellFor {
  packages = p: nixpkgs.lib.attrVals shell-packages p;
  buildInputs = [
    cabal-install
    haskell-language-server
    hlint
    fourmolu
    ghcid
    niv
    nixpkgs-fmt
    act
    pre-commit

    generate-proto
  ];
  shellHook = ''
    ${pre-commit-check.shellHook}
  '';
}
