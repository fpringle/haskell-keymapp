{-# OPTIONS_GHC -Wno-orphans #-}

{- | A Haskell description of the Keymapp API.

This module is automatically generated from [keymapp.proto](https://github.com/zsa/kontroll/blob/main/proto/keymapp.proto)
using [protoc](https://protobuf.dev/) and [proto-lens-protoc](https://hackage.haskell.org/package/proto-lens-protoc).
-}
module Control.Keymapp.API
  ( module Proto.Keymapp
  )
where

import Data.ProtoLens.Labels ()
import Network.GRPC.Common
import Network.GRPC.Common.Protobuf
import Proto.Keymapp

------------------------------------------------------------
-- Metadata

type instance RequestMetadata (Protobuf KeyboardService meth) = NoMetadata

type instance ResponseInitialMetadata (Protobuf KeyboardService meth) = NoMetadata

type instance ResponseTrailingMetadata (Protobuf KeyboardService meth) = NoMetadata
