{ nixpkgs, ... }:
let
  protoc = nixpkgs.lib.getExe nixpkgs.protobuf;
  proto-lens-protoc = nixpkgs.lib.getExe nixpkgs.haskellPackages.proto-lens-protoc;

in
nixpkgs.writeShellScriptBin "generate-proto" ''
  curl https://raw.githubusercontent.com/zsa/kontroll/refs/heads/main/proto/keymapp.proto > proto/keymapp.proto
  ${protoc} \
    --plugin=protoc-gen-haskell=${proto-lens-protoc} \
    --haskell_out=keymapp/generated \
    --proto_path=proto \
    keymapp.proto
''
