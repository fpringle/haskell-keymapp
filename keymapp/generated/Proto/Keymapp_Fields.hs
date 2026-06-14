{- This file was auto-generated from keymapp.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Keymapp_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
blue ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "blue" a) =>
  Lens.Family2.LensLike' f s a
blue = Data.ProtoLens.Field.field @"blue"
connectedKeyboard ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "connectedKeyboard" a) =>
  Lens.Family2.LensLike' f s a
connectedKeyboard = Data.ProtoLens.Field.field @"connectedKeyboard"
currentLayer ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "currentLayer" a) =>
  Lens.Family2.LensLike' f s a
currentLayer = Data.ProtoLens.Field.field @"currentLayer"
firmwareVersion ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "firmwareVersion" a) =>
  Lens.Family2.LensLike' f s a
firmwareVersion = Data.ProtoLens.Field.field @"firmwareVersion"
friendlyName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "friendlyName" a) =>
  Lens.Family2.LensLike' f s a
friendlyName = Data.ProtoLens.Field.field @"friendlyName"
green ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "green" a) =>
  Lens.Family2.LensLike' f s a
green = Data.ProtoLens.Field.field @"green"
id ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "id" a) =>
  Lens.Family2.LensLike' f s a
id = Data.ProtoLens.Field.field @"id"
isConnected ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isConnected" a) =>
  Lens.Family2.LensLike' f s a
isConnected = Data.ProtoLens.Field.field @"isConnected"
keyboards ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "keyboards" a) =>
  Lens.Family2.LensLike' f s a
keyboards = Data.ProtoLens.Field.field @"keyboards"
keymappVersion ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "keymappVersion" a) =>
  Lens.Family2.LensLike' f s a
keymappVersion = Data.ProtoLens.Field.field @"keymappVersion"
layer ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "layer" a) =>
  Lens.Family2.LensLike' f s a
layer = Data.ProtoLens.Field.field @"layer"
led ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "led" a) =>
  Lens.Family2.LensLike' f s a
led = Data.ProtoLens.Field.field @"led"
maybe'connectedKeyboard ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'connectedKeyboard" a) =>
  Lens.Family2.LensLike' f s a
maybe'connectedKeyboard
  = Data.ProtoLens.Field.field @"maybe'connectedKeyboard"
on ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "on" a) =>
  Lens.Family2.LensLike' f s a
on = Data.ProtoLens.Field.field @"on"
red ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "red" a) =>
  Lens.Family2.LensLike' f s a
red = Data.ProtoLens.Field.field @"red"
success ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "success" a) =>
  Lens.Family2.LensLike' f s a
success = Data.ProtoLens.Field.field @"success"
sustain ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "sustain" a) =>
  Lens.Family2.LensLike' f s a
sustain = Data.ProtoLens.Field.field @"sustain"
vec'keyboards ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'keyboards" a) =>
  Lens.Family2.LensLike' f s a
vec'keyboards = Data.ProtoLens.Field.field @"vec'keyboards"