{ nixpkgs, ... }:
let
  protoc = nixpkgs.lib.getExe nixpkgs.protobuf;
  proto-lens-protoc = nixpkgs.lib.getExe nixpkgs.haskellPackages.proto-lens-protoc;

in
nixpkgs.writeShellScriptBin "generate-proto" ''
  ${protoc} \
    --plugin=protoc-gen-haskell=${proto-lens-protoc} \
    --haskell_out=keymapp/generated \
    --proto_path=proto \
    keymapp.proto
''
