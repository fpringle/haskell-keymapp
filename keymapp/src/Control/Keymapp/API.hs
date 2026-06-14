{-# OPTIONS_GHC -Wno-orphans #-}

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
