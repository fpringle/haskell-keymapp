{- This file was auto-generated from keymapp.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Keymapp (
        KeyboardService(..), BrightnessUpdateReply(),
        ConnectAnyKeyboardRequest(), ConnectKeyboardReply(),
        ConnectKeyboardRequest(), ConnectedKeyboard(),
        DecreaseBrightnessRequest(), DisconnectKeyboardReply(),
        DisconnectKeyboardRequest(), GetKeyboardsReply(),
        GetKeyboardsRequest(), GetStatusReply(), GetStatusRequest(),
        IncreaseBrightnessRequest(), Keyboard(), SetLayerReply(),
        SetLayerRequest(), SetRGBAllReply(), SetRGBAllRequest(),
        SetRGBLedReply(), SetRGBLedRequest(), SetStatusLedReply(),
        SetStatusLedRequest()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
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
{- | Fields :
     
         * 'Proto.Keymapp_Fields.success' @:: Lens' BrightnessUpdateReply Prelude.Bool@ -}
data BrightnessUpdateReply
  = BrightnessUpdateReply'_constructor {_BrightnessUpdateReply'success :: !Prelude.Bool,
                                        _BrightnessUpdateReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BrightnessUpdateReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BrightnessUpdateReply "success" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BrightnessUpdateReply'success
           (\ x__ y__ -> x__ {_BrightnessUpdateReply'success = y__}))
        Prelude.id
instance Data.ProtoLens.Message BrightnessUpdateReply where
  messageName _ = Data.Text.pack "api.BrightnessUpdateReply"
  packedMessageDescriptor _
    = "\n\
      \\NAKBrightnessUpdateReply\DC2\CAN\n\
      \\asuccess\CAN\SOH \SOH(\bR\asuccess"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        success__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"success")) ::
              Data.ProtoLens.FieldDescriptor BrightnessUpdateReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, success__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BrightnessUpdateReply'_unknownFields
        (\ x__ y__ -> x__ {_BrightnessUpdateReply'_unknownFields = y__})
  defMessage
    = BrightnessUpdateReply'_constructor
        {_BrightnessUpdateReply'success = Data.ProtoLens.fieldDefault,
         _BrightnessUpdateReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BrightnessUpdateReply
          -> Data.ProtoLens.Encoding.Bytes.Parser BrightnessUpdateReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"success") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "BrightnessUpdateReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData BrightnessUpdateReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BrightnessUpdateReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_BrightnessUpdateReply'success x__) ())
{- | Fields :
      -}
data ConnectAnyKeyboardRequest
  = ConnectAnyKeyboardRequest'_constructor {_ConnectAnyKeyboardRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ConnectAnyKeyboardRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message ConnectAnyKeyboardRequest where
  messageName _ = Data.Text.pack "api.ConnectAnyKeyboardRequest"
  packedMessageDescriptor _
    = "\n\
      \\EMConnectAnyKeyboardRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConnectAnyKeyboardRequest'_unknownFields
        (\ x__ y__
           -> x__ {_ConnectAnyKeyboardRequest'_unknownFields = y__})
  defMessage
    = ConnectAnyKeyboardRequest'_constructor
        {_ConnectAnyKeyboardRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ConnectAnyKeyboardRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ConnectAnyKeyboardRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConnectAnyKeyboardRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData ConnectAnyKeyboardRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConnectAnyKeyboardRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Keymapp_Fields.success' @:: Lens' ConnectKeyboardReply Prelude.Bool@ -}
data ConnectKeyboardReply
  = ConnectKeyboardReply'_constructor {_ConnectKeyboardReply'success :: !Prelude.Bool,
                                       _ConnectKeyboardReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ConnectKeyboardReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ConnectKeyboardReply "success" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConnectKeyboardReply'success
           (\ x__ y__ -> x__ {_ConnectKeyboardReply'success = y__}))
        Prelude.id
instance Data.ProtoLens.Message ConnectKeyboardReply where
  messageName _ = Data.Text.pack "api.ConnectKeyboardReply"
  packedMessageDescriptor _
    = "\n\
      \\DC4ConnectKeyboardReply\DC2\CAN\n\
      \\asuccess\CAN\SOH \SOH(\bR\asuccess"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        success__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"success")) ::
              Data.ProtoLens.FieldDescriptor ConnectKeyboardReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, success__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConnectKeyboardReply'_unknownFields
        (\ x__ y__ -> x__ {_ConnectKeyboardReply'_unknownFields = y__})
  defMessage
    = ConnectKeyboardReply'_constructor
        {_ConnectKeyboardReply'success = Data.ProtoLens.fieldDefault,
         _ConnectKeyboardReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ConnectKeyboardReply
          -> Data.ProtoLens.Encoding.Bytes.Parser ConnectKeyboardReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"success") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConnectKeyboardReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ConnectKeyboardReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConnectKeyboardReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ConnectKeyboardReply'success x__) ())
{- | Fields :
     
         * 'Proto.Keymapp_Fields.id' @:: Lens' ConnectKeyboardRequest Data.Int.Int32@ -}
data ConnectKeyboardRequest
  = ConnectKeyboardRequest'_constructor {_ConnectKeyboardRequest'id :: !Data.Int.Int32,
                                         _ConnectKeyboardRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ConnectKeyboardRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ConnectKeyboardRequest "id" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConnectKeyboardRequest'id
           (\ x__ y__ -> x__ {_ConnectKeyboardRequest'id = y__}))
        Prelude.id
instance Data.ProtoLens.Message ConnectKeyboardRequest where
  messageName _ = Data.Text.pack "api.ConnectKeyboardRequest"
  packedMessageDescriptor _
    = "\n\
      \\SYNConnectKeyboardRequest\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\ENQR\STXid"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor ConnectKeyboardRequest
      in Data.Map.fromList [(Data.ProtoLens.Tag 1, id__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConnectKeyboardRequest'_unknownFields
        (\ x__ y__ -> x__ {_ConnectKeyboardRequest'_unknownFields = y__})
  defMessage
    = ConnectKeyboardRequest'_constructor
        {_ConnectKeyboardRequest'id = Data.ProtoLens.fieldDefault,
         _ConnectKeyboardRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ConnectKeyboardRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ConnectKeyboardRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConnectKeyboardRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ConnectKeyboardRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConnectKeyboardRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ConnectKeyboardRequest'id x__) ())
{- | Fields :
     
         * 'Proto.Keymapp_Fields.friendlyName' @:: Lens' ConnectedKeyboard Data.Text.Text@
         * 'Proto.Keymapp_Fields.firmwareVersion' @:: Lens' ConnectedKeyboard Data.Text.Text@
         * 'Proto.Keymapp_Fields.currentLayer' @:: Lens' ConnectedKeyboard Data.Int.Int32@ -}
data ConnectedKeyboard
  = ConnectedKeyboard'_constructor {_ConnectedKeyboard'friendlyName :: !Data.Text.Text,
                                    _ConnectedKeyboard'firmwareVersion :: !Data.Text.Text,
                                    _ConnectedKeyboard'currentLayer :: !Data.Int.Int32,
                                    _ConnectedKeyboard'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ConnectedKeyboard where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ConnectedKeyboard "friendlyName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConnectedKeyboard'friendlyName
           (\ x__ y__ -> x__ {_ConnectedKeyboard'friendlyName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConnectedKeyboard "firmwareVersion" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConnectedKeyboard'firmwareVersion
           (\ x__ y__ -> x__ {_ConnectedKeyboard'firmwareVersion = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ConnectedKeyboard "currentLayer" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConnectedKeyboard'currentLayer
           (\ x__ y__ -> x__ {_ConnectedKeyboard'currentLayer = y__}))
        Prelude.id
instance Data.ProtoLens.Message ConnectedKeyboard where
  messageName _ = Data.Text.pack "api.ConnectedKeyboard"
  packedMessageDescriptor _
    = "\n\
      \\DC1ConnectedKeyboard\DC2#\n\
      \\rfriendly_name\CAN\SOH \SOH(\tR\ffriendlyName\DC2)\n\
      \\DLEfirmware_version\CAN\STX \SOH(\tR\SIfirmwareVersion\DC2#\n\
      \\rcurrent_layer\CAN\ETX \SOH(\ENQR\fcurrentLayer"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        friendlyName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "friendly_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"friendlyName")) ::
              Data.ProtoLens.FieldDescriptor ConnectedKeyboard
        firmwareVersion__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "firmware_version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"firmwareVersion")) ::
              Data.ProtoLens.FieldDescriptor ConnectedKeyboard
        currentLayer__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "current_layer"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"currentLayer")) ::
              Data.ProtoLens.FieldDescriptor ConnectedKeyboard
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, friendlyName__field_descriptor),
           (Data.ProtoLens.Tag 2, firmwareVersion__field_descriptor),
           (Data.ProtoLens.Tag 3, currentLayer__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConnectedKeyboard'_unknownFields
        (\ x__ y__ -> x__ {_ConnectedKeyboard'_unknownFields = y__})
  defMessage
    = ConnectedKeyboard'_constructor
        {_ConnectedKeyboard'friendlyName = Data.ProtoLens.fieldDefault,
         _ConnectedKeyboard'firmwareVersion = Data.ProtoLens.fieldDefault,
         _ConnectedKeyboard'currentLayer = Data.ProtoLens.fieldDefault,
         _ConnectedKeyboard'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ConnectedKeyboard
          -> Data.ProtoLens.Encoding.Bytes.Parser ConnectedKeyboard
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "friendly_name"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"friendlyName") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "firmware_version"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"firmwareVersion") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "current_layer"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"currentLayer") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConnectedKeyboard"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"friendlyName") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"firmwareVersion") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"currentLayer") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ConnectedKeyboard where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConnectedKeyboard'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ConnectedKeyboard'friendlyName x__)
                (Control.DeepSeq.deepseq
                   (_ConnectedKeyboard'firmwareVersion x__)
                   (Control.DeepSeq.deepseq
                      (_ConnectedKeyboard'currentLayer x__) ())))
{- | Fields :
      -}
data DecreaseBrightnessRequest
  = DecreaseBrightnessRequest'_constructor {_DecreaseBrightnessRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DecreaseBrightnessRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message DecreaseBrightnessRequest where
  messageName _ = Data.Text.pack "api.DecreaseBrightnessRequest"
  packedMessageDescriptor _
    = "\n\
      \\EMDecreaseBrightnessRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DecreaseBrightnessRequest'_unknownFields
        (\ x__ y__
           -> x__ {_DecreaseBrightnessRequest'_unknownFields = y__})
  defMessage
    = DecreaseBrightnessRequest'_constructor
        {_DecreaseBrightnessRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DecreaseBrightnessRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser DecreaseBrightnessRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "DecreaseBrightnessRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData DecreaseBrightnessRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DecreaseBrightnessRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Keymapp_Fields.success' @:: Lens' DisconnectKeyboardReply Prelude.Bool@ -}
data DisconnectKeyboardReply
  = DisconnectKeyboardReply'_constructor {_DisconnectKeyboardReply'success :: !Prelude.Bool,
                                          _DisconnectKeyboardReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DisconnectKeyboardReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DisconnectKeyboardReply "success" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DisconnectKeyboardReply'success
           (\ x__ y__ -> x__ {_DisconnectKeyboardReply'success = y__}))
        Prelude.id
instance Data.ProtoLens.Message DisconnectKeyboardReply where
  messageName _ = Data.Text.pack "api.DisconnectKeyboardReply"
  packedMessageDescriptor _
    = "\n\
      \\ETBDisconnectKeyboardReply\DC2\CAN\n\
      \\asuccess\CAN\SOH \SOH(\bR\asuccess"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        success__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"success")) ::
              Data.ProtoLens.FieldDescriptor DisconnectKeyboardReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, success__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DisconnectKeyboardReply'_unknownFields
        (\ x__ y__ -> x__ {_DisconnectKeyboardReply'_unknownFields = y__})
  defMessage
    = DisconnectKeyboardReply'_constructor
        {_DisconnectKeyboardReply'success = Data.ProtoLens.fieldDefault,
         _DisconnectKeyboardReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DisconnectKeyboardReply
          -> Data.ProtoLens.Encoding.Bytes.Parser DisconnectKeyboardReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"success") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "DisconnectKeyboardReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData DisconnectKeyboardReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DisconnectKeyboardReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_DisconnectKeyboardReply'success x__) ())
{- | Fields :
      -}
data DisconnectKeyboardRequest
  = DisconnectKeyboardRequest'_constructor {_DisconnectKeyboardRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DisconnectKeyboardRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message DisconnectKeyboardRequest where
  messageName _ = Data.Text.pack "api.DisconnectKeyboardRequest"
  packedMessageDescriptor _
    = "\n\
      \\EMDisconnectKeyboardRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DisconnectKeyboardRequest'_unknownFields
        (\ x__ y__
           -> x__ {_DisconnectKeyboardRequest'_unknownFields = y__})
  defMessage
    = DisconnectKeyboardRequest'_constructor
        {_DisconnectKeyboardRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DisconnectKeyboardRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser DisconnectKeyboardRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "DisconnectKeyboardRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData DisconnectKeyboardRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DisconnectKeyboardRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Keymapp_Fields.keyboards' @:: Lens' GetKeyboardsReply [Keyboard]@
         * 'Proto.Keymapp_Fields.vec'keyboards' @:: Lens' GetKeyboardsReply (Data.Vector.Vector Keyboard)@ -}
data GetKeyboardsReply
  = GetKeyboardsReply'_constructor {_GetKeyboardsReply'keyboards :: !(Data.Vector.Vector Keyboard),
                                    _GetKeyboardsReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GetKeyboardsReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField GetKeyboardsReply "keyboards" [Keyboard] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetKeyboardsReply'keyboards
           (\ x__ y__ -> x__ {_GetKeyboardsReply'keyboards = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField GetKeyboardsReply "vec'keyboards" (Data.Vector.Vector Keyboard) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetKeyboardsReply'keyboards
           (\ x__ y__ -> x__ {_GetKeyboardsReply'keyboards = y__}))
        Prelude.id
instance Data.ProtoLens.Message GetKeyboardsReply where
  messageName _ = Data.Text.pack "api.GetKeyboardsReply"
  packedMessageDescriptor _
    = "\n\
      \\DC1GetKeyboardsReply\DC2+\n\
      \\tkeyboards\CAN\SOH \ETX(\v2\r.api.KeyboardR\tkeyboards"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        keyboards__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "keyboards"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Keyboard)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"keyboards")) ::
              Data.ProtoLens.FieldDescriptor GetKeyboardsReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, keyboards__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetKeyboardsReply'_unknownFields
        (\ x__ y__ -> x__ {_GetKeyboardsReply'_unknownFields = y__})
  defMessage
    = GetKeyboardsReply'_constructor
        {_GetKeyboardsReply'keyboards = Data.Vector.Generic.empty,
         _GetKeyboardsReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetKeyboardsReply
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Keyboard
             -> Data.ProtoLens.Encoding.Bytes.Parser GetKeyboardsReply
        loop x mutable'keyboards
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'keyboards <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'keyboards)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'keyboards") frozen'keyboards x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "keyboards"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'keyboards y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'keyboards
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'keyboards <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'keyboards)
          "GetKeyboardsReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'keyboards") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData GetKeyboardsReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetKeyboardsReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_GetKeyboardsReply'keyboards x__) ())
{- | Fields :
      -}
data GetKeyboardsRequest
  = GetKeyboardsRequest'_constructor {_GetKeyboardsRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GetKeyboardsRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message GetKeyboardsRequest where
  messageName _ = Data.Text.pack "api.GetKeyboardsRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3GetKeyboardsRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetKeyboardsRequest'_unknownFields
        (\ x__ y__ -> x__ {_GetKeyboardsRequest'_unknownFields = y__})
  defMessage
    = GetKeyboardsRequest'_constructor
        {_GetKeyboardsRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetKeyboardsRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser GetKeyboardsRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "GetKeyboardsRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData GetKeyboardsRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetKeyboardsRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Keymapp_Fields.keymappVersion' @:: Lens' GetStatusReply Data.Text.Text@
         * 'Proto.Keymapp_Fields.connectedKeyboard' @:: Lens' GetStatusReply ConnectedKeyboard@
         * 'Proto.Keymapp_Fields.maybe'connectedKeyboard' @:: Lens' GetStatusReply (Prelude.Maybe ConnectedKeyboard)@ -}
data GetStatusReply
  = GetStatusReply'_constructor {_GetStatusReply'keymappVersion :: !Data.Text.Text,
                                 _GetStatusReply'connectedKeyboard :: !(Prelude.Maybe ConnectedKeyboard),
                                 _GetStatusReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GetStatusReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField GetStatusReply "keymappVersion" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetStatusReply'keymappVersion
           (\ x__ y__ -> x__ {_GetStatusReply'keymappVersion = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GetStatusReply "connectedKeyboard" ConnectedKeyboard where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetStatusReply'connectedKeyboard
           (\ x__ y__ -> x__ {_GetStatusReply'connectedKeyboard = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField GetStatusReply "maybe'connectedKeyboard" (Prelude.Maybe ConnectedKeyboard) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetStatusReply'connectedKeyboard
           (\ x__ y__ -> x__ {_GetStatusReply'connectedKeyboard = y__}))
        Prelude.id
instance Data.ProtoLens.Message GetStatusReply where
  messageName _ = Data.Text.pack "api.GetStatusReply"
  packedMessageDescriptor _
    = "\n\
      \\SOGetStatusReply\DC2'\n\
      \\SIkeymapp_version\CAN\SOH \SOH(\tR\SOkeymappVersion\DC2E\n\
      \\DC2connected_keyboard\CAN\STX \SOH(\v2\SYN.api.ConnectedKeyboardR\DC1connectedKeyboard"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        keymappVersion__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "keymapp_version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"keymappVersion")) ::
              Data.ProtoLens.FieldDescriptor GetStatusReply
        connectedKeyboard__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "connected_keyboard"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ConnectedKeyboard)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'connectedKeyboard")) ::
              Data.ProtoLens.FieldDescriptor GetStatusReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, keymappVersion__field_descriptor),
           (Data.ProtoLens.Tag 2, connectedKeyboard__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetStatusReply'_unknownFields
        (\ x__ y__ -> x__ {_GetStatusReply'_unknownFields = y__})
  defMessage
    = GetStatusReply'_constructor
        {_GetStatusReply'keymappVersion = Data.ProtoLens.fieldDefault,
         _GetStatusReply'connectedKeyboard = Prelude.Nothing,
         _GetStatusReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetStatusReply
          -> Data.ProtoLens.Encoding.Bytes.Parser GetStatusReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "keymapp_version"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"keymappVersion") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "connected_keyboard"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"connectedKeyboard") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "GetStatusReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"keymappVersion") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'connectedKeyboard") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData GetStatusReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetStatusReply'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GetStatusReply'keymappVersion x__)
                (Control.DeepSeq.deepseq
                   (_GetStatusReply'connectedKeyboard x__) ()))
{- | Fields :
      -}
data GetStatusRequest
  = GetStatusRequest'_constructor {_GetStatusRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GetStatusRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message GetStatusRequest where
  messageName _ = Data.Text.pack "api.GetStatusRequest"
  packedMessageDescriptor _
    = "\n\
      \\DLEGetStatusRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetStatusRequest'_unknownFields
        (\ x__ y__ -> x__ {_GetStatusRequest'_unknownFields = y__})
  defMessage
    = GetStatusRequest'_constructor
        {_GetStatusRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetStatusRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser GetStatusRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "GetStatusRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData GetStatusRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetStatusRequest'_unknownFields x__) ()
{- | Fields :
      -}
data IncreaseBrightnessRequest
  = IncreaseBrightnessRequest'_constructor {_IncreaseBrightnessRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show IncreaseBrightnessRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message IncreaseBrightnessRequest where
  messageName _ = Data.Text.pack "api.IncreaseBrightnessRequest"
  packedMessageDescriptor _
    = "\n\
      \\EMIncreaseBrightnessRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _IncreaseBrightnessRequest'_unknownFields
        (\ x__ y__
           -> x__ {_IncreaseBrightnessRequest'_unknownFields = y__})
  defMessage
    = IncreaseBrightnessRequest'_constructor
        {_IncreaseBrightnessRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          IncreaseBrightnessRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser IncreaseBrightnessRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "IncreaseBrightnessRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData IncreaseBrightnessRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_IncreaseBrightnessRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Keymapp_Fields.id' @:: Lens' Keyboard Data.Int.Int32@
         * 'Proto.Keymapp_Fields.friendlyName' @:: Lens' Keyboard Data.Text.Text@
         * 'Proto.Keymapp_Fields.isConnected' @:: Lens' Keyboard Prelude.Bool@ -}
data Keyboard
  = Keyboard'_constructor {_Keyboard'id :: !Data.Int.Int32,
                           _Keyboard'friendlyName :: !Data.Text.Text,
                           _Keyboard'isConnected :: !Prelude.Bool,
                           _Keyboard'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Keyboard where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Keyboard "id" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Keyboard'id (\ x__ y__ -> x__ {_Keyboard'id = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Keyboard "friendlyName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Keyboard'friendlyName
           (\ x__ y__ -> x__ {_Keyboard'friendlyName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Keyboard "isConnected" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Keyboard'isConnected
           (\ x__ y__ -> x__ {_Keyboard'isConnected = y__}))
        Prelude.id
instance Data.ProtoLens.Message Keyboard where
  messageName _ = Data.Text.pack "api.Keyboard"
  packedMessageDescriptor _
    = "\n\
      \\bKeyboard\DC2\SO\n\
      \\STXid\CAN\SOH \SOH(\ENQR\STXid\DC2#\n\
      \\rfriendly_name\CAN\STX \SOH(\tR\ffriendlyName\DC2!\n\
      \\fis_connected\CAN\ETX \SOH(\bR\visConnected"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        id__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "id"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"id")) ::
              Data.ProtoLens.FieldDescriptor Keyboard
        friendlyName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "friendly_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"friendlyName")) ::
              Data.ProtoLens.FieldDescriptor Keyboard
        isConnected__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "is_connected"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"isConnected")) ::
              Data.ProtoLens.FieldDescriptor Keyboard
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, id__field_descriptor),
           (Data.ProtoLens.Tag 2, friendlyName__field_descriptor),
           (Data.ProtoLens.Tag 3, isConnected__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Keyboard'_unknownFields
        (\ x__ y__ -> x__ {_Keyboard'_unknownFields = y__})
  defMessage
    = Keyboard'_constructor
        {_Keyboard'id = Data.ProtoLens.fieldDefault,
         _Keyboard'friendlyName = Data.ProtoLens.fieldDefault,
         _Keyboard'isConnected = Data.ProtoLens.fieldDefault,
         _Keyboard'_unknownFields = []}
  parseMessage
    = let
        loop :: Keyboard -> Data.ProtoLens.Encoding.Bytes.Parser Keyboard
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "id"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"id") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "friendly_name"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"friendlyName") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "is_connected"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"isConnected") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Keyboard"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"id") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"friendlyName") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"isConnected") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Keyboard where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Keyboard'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Keyboard'id x__)
                (Control.DeepSeq.deepseq
                   (_Keyboard'friendlyName x__)
                   (Control.DeepSeq.deepseq (_Keyboard'isConnected x__) ())))
{- | Fields :
     
         * 'Proto.Keymapp_Fields.success' @:: Lens' SetLayerReply Prelude.Bool@ -}
data SetLayerReply
  = SetLayerReply'_constructor {_SetLayerReply'success :: !Prelude.Bool,
                                _SetLayerReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetLayerReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetLayerReply "success" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetLayerReply'success
           (\ x__ y__ -> x__ {_SetLayerReply'success = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetLayerReply where
  messageName _ = Data.Text.pack "api.SetLayerReply"
  packedMessageDescriptor _
    = "\n\
      \\rSetLayerReply\DC2\CAN\n\
      \\asuccess\CAN\SOH \SOH(\bR\asuccess"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        success__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"success")) ::
              Data.ProtoLens.FieldDescriptor SetLayerReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, success__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetLayerReply'_unknownFields
        (\ x__ y__ -> x__ {_SetLayerReply'_unknownFields = y__})
  defMessage
    = SetLayerReply'_constructor
        {_SetLayerReply'success = Data.ProtoLens.fieldDefault,
         _SetLayerReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetLayerReply -> Data.ProtoLens.Encoding.Bytes.Parser SetLayerReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"success") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetLayerReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SetLayerReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetLayerReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SetLayerReply'success x__) ())
{- | Fields :
     
         * 'Proto.Keymapp_Fields.layer' @:: Lens' SetLayerRequest Data.Int.Int32@ -}
data SetLayerRequest
  = SetLayerRequest'_constructor {_SetLayerRequest'layer :: !Data.Int.Int32,
                                  _SetLayerRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetLayerRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetLayerRequest "layer" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetLayerRequest'layer
           (\ x__ y__ -> x__ {_SetLayerRequest'layer = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetLayerRequest where
  messageName _ = Data.Text.pack "api.SetLayerRequest"
  packedMessageDescriptor _
    = "\n\
      \\SISetLayerRequest\DC2\DC4\n\
      \\ENQlayer\CAN\SOH \SOH(\ENQR\ENQlayer"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        layer__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "layer"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"layer")) ::
              Data.ProtoLens.FieldDescriptor SetLayerRequest
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, layer__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetLayerRequest'_unknownFields
        (\ x__ y__ -> x__ {_SetLayerRequest'_unknownFields = y__})
  defMessage
    = SetLayerRequest'_constructor
        {_SetLayerRequest'layer = Data.ProtoLens.fieldDefault,
         _SetLayerRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetLayerRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SetLayerRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "layer"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"layer") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetLayerRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"layer") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SetLayerRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetLayerRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SetLayerRequest'layer x__) ())
{- | Fields :
     
         * 'Proto.Keymapp_Fields.success' @:: Lens' SetRGBAllReply Prelude.Bool@ -}
data SetRGBAllReply
  = SetRGBAllReply'_constructor {_SetRGBAllReply'success :: !Prelude.Bool,
                                 _SetRGBAllReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetRGBAllReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetRGBAllReply "success" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBAllReply'success
           (\ x__ y__ -> x__ {_SetRGBAllReply'success = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetRGBAllReply where
  messageName _ = Data.Text.pack "api.SetRGBAllReply"
  packedMessageDescriptor _
    = "\n\
      \\SOSetRGBAllReply\DC2\CAN\n\
      \\asuccess\CAN\SOH \SOH(\bR\asuccess"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        success__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"success")) ::
              Data.ProtoLens.FieldDescriptor SetRGBAllReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, success__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetRGBAllReply'_unknownFields
        (\ x__ y__ -> x__ {_SetRGBAllReply'_unknownFields = y__})
  defMessage
    = SetRGBAllReply'_constructor
        {_SetRGBAllReply'success = Data.ProtoLens.fieldDefault,
         _SetRGBAllReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetRGBAllReply
          -> Data.ProtoLens.Encoding.Bytes.Parser SetRGBAllReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"success") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetRGBAllReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SetRGBAllReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetRGBAllReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SetRGBAllReply'success x__) ())
{- | Fields :
     
         * 'Proto.Keymapp_Fields.red' @:: Lens' SetRGBAllRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.green' @:: Lens' SetRGBAllRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.blue' @:: Lens' SetRGBAllRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.sustain' @:: Lens' SetRGBAllRequest Data.Int.Int32@ -}
data SetRGBAllRequest
  = SetRGBAllRequest'_constructor {_SetRGBAllRequest'red :: !Data.Int.Int32,
                                   _SetRGBAllRequest'green :: !Data.Int.Int32,
                                   _SetRGBAllRequest'blue :: !Data.Int.Int32,
                                   _SetRGBAllRequest'sustain :: !Data.Int.Int32,
                                   _SetRGBAllRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetRGBAllRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetRGBAllRequest "red" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBAllRequest'red
           (\ x__ y__ -> x__ {_SetRGBAllRequest'red = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetRGBAllRequest "green" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBAllRequest'green
           (\ x__ y__ -> x__ {_SetRGBAllRequest'green = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetRGBAllRequest "blue" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBAllRequest'blue
           (\ x__ y__ -> x__ {_SetRGBAllRequest'blue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetRGBAllRequest "sustain" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBAllRequest'sustain
           (\ x__ y__ -> x__ {_SetRGBAllRequest'sustain = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetRGBAllRequest where
  messageName _ = Data.Text.pack "api.SetRGBAllRequest"
  packedMessageDescriptor _
    = "\n\
      \\DLESetRGBAllRequest\DC2\DLE\n\
      \\ETXred\CAN\SOH \SOH(\ENQR\ETXred\DC2\DC4\n\
      \\ENQgreen\CAN\STX \SOH(\ENQR\ENQgreen\DC2\DC2\n\
      \\EOTblue\CAN\ETX \SOH(\ENQR\EOTblue\DC2\CAN\n\
      \\asustain\CAN\EOT \SOH(\ENQR\asustain"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        red__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "red"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"red")) ::
              Data.ProtoLens.FieldDescriptor SetRGBAllRequest
        green__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "green"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"green")) ::
              Data.ProtoLens.FieldDescriptor SetRGBAllRequest
        blue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "blue"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"blue")) ::
              Data.ProtoLens.FieldDescriptor SetRGBAllRequest
        sustain__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sustain"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"sustain")) ::
              Data.ProtoLens.FieldDescriptor SetRGBAllRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, red__field_descriptor),
           (Data.ProtoLens.Tag 2, green__field_descriptor),
           (Data.ProtoLens.Tag 3, blue__field_descriptor),
           (Data.ProtoLens.Tag 4, sustain__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetRGBAllRequest'_unknownFields
        (\ x__ y__ -> x__ {_SetRGBAllRequest'_unknownFields = y__})
  defMessage
    = SetRGBAllRequest'_constructor
        {_SetRGBAllRequest'red = Data.ProtoLens.fieldDefault,
         _SetRGBAllRequest'green = Data.ProtoLens.fieldDefault,
         _SetRGBAllRequest'blue = Data.ProtoLens.fieldDefault,
         _SetRGBAllRequest'sustain = Data.ProtoLens.fieldDefault,
         _SetRGBAllRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetRGBAllRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SetRGBAllRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "red"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"red") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "green"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"green") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "blue"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"blue") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sustain"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"sustain") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetRGBAllRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"red") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"green") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"blue") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"sustain") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData SetRGBAllRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetRGBAllRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SetRGBAllRequest'red x__)
                (Control.DeepSeq.deepseq
                   (_SetRGBAllRequest'green x__)
                   (Control.DeepSeq.deepseq
                      (_SetRGBAllRequest'blue x__)
                      (Control.DeepSeq.deepseq (_SetRGBAllRequest'sustain x__) ()))))
{- | Fields :
     
         * 'Proto.Keymapp_Fields.success' @:: Lens' SetRGBLedReply Prelude.Bool@ -}
data SetRGBLedReply
  = SetRGBLedReply'_constructor {_SetRGBLedReply'success :: !Prelude.Bool,
                                 _SetRGBLedReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetRGBLedReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetRGBLedReply "success" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBLedReply'success
           (\ x__ y__ -> x__ {_SetRGBLedReply'success = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetRGBLedReply where
  messageName _ = Data.Text.pack "api.SetRGBLedReply"
  packedMessageDescriptor _
    = "\n\
      \\SOSetRGBLedReply\DC2\CAN\n\
      \\asuccess\CAN\SOH \SOH(\bR\asuccess"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        success__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"success")) ::
              Data.ProtoLens.FieldDescriptor SetRGBLedReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, success__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetRGBLedReply'_unknownFields
        (\ x__ y__ -> x__ {_SetRGBLedReply'_unknownFields = y__})
  defMessage
    = SetRGBLedReply'_constructor
        {_SetRGBLedReply'success = Data.ProtoLens.fieldDefault,
         _SetRGBLedReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetRGBLedReply
          -> Data.ProtoLens.Encoding.Bytes.Parser SetRGBLedReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"success") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetRGBLedReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SetRGBLedReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetRGBLedReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SetRGBLedReply'success x__) ())
{- | Fields :
     
         * 'Proto.Keymapp_Fields.led' @:: Lens' SetRGBLedRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.red' @:: Lens' SetRGBLedRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.green' @:: Lens' SetRGBLedRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.blue' @:: Lens' SetRGBLedRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.sustain' @:: Lens' SetRGBLedRequest Data.Int.Int32@ -}
data SetRGBLedRequest
  = SetRGBLedRequest'_constructor {_SetRGBLedRequest'led :: !Data.Int.Int32,
                                   _SetRGBLedRequest'red :: !Data.Int.Int32,
                                   _SetRGBLedRequest'green :: !Data.Int.Int32,
                                   _SetRGBLedRequest'blue :: !Data.Int.Int32,
                                   _SetRGBLedRequest'sustain :: !Data.Int.Int32,
                                   _SetRGBLedRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetRGBLedRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetRGBLedRequest "led" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBLedRequest'led
           (\ x__ y__ -> x__ {_SetRGBLedRequest'led = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetRGBLedRequest "red" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBLedRequest'red
           (\ x__ y__ -> x__ {_SetRGBLedRequest'red = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetRGBLedRequest "green" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBLedRequest'green
           (\ x__ y__ -> x__ {_SetRGBLedRequest'green = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetRGBLedRequest "blue" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBLedRequest'blue
           (\ x__ y__ -> x__ {_SetRGBLedRequest'blue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetRGBLedRequest "sustain" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetRGBLedRequest'sustain
           (\ x__ y__ -> x__ {_SetRGBLedRequest'sustain = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetRGBLedRequest where
  messageName _ = Data.Text.pack "api.SetRGBLedRequest"
  packedMessageDescriptor _
    = "\n\
      \\DLESetRGBLedRequest\DC2\DLE\n\
      \\ETXled\CAN\SOH \SOH(\ENQR\ETXled\DC2\DLE\n\
      \\ETXred\CAN\STX \SOH(\ENQR\ETXred\DC2\DC4\n\
      \\ENQgreen\CAN\ETX \SOH(\ENQR\ENQgreen\DC2\DC2\n\
      \\EOTblue\CAN\EOT \SOH(\ENQR\EOTblue\DC2\CAN\n\
      \\asustain\CAN\ENQ \SOH(\ENQR\asustain"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        led__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "led"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"led")) ::
              Data.ProtoLens.FieldDescriptor SetRGBLedRequest
        red__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "red"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"red")) ::
              Data.ProtoLens.FieldDescriptor SetRGBLedRequest
        green__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "green"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"green")) ::
              Data.ProtoLens.FieldDescriptor SetRGBLedRequest
        blue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "blue"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"blue")) ::
              Data.ProtoLens.FieldDescriptor SetRGBLedRequest
        sustain__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sustain"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"sustain")) ::
              Data.ProtoLens.FieldDescriptor SetRGBLedRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, led__field_descriptor),
           (Data.ProtoLens.Tag 2, red__field_descriptor),
           (Data.ProtoLens.Tag 3, green__field_descriptor),
           (Data.ProtoLens.Tag 4, blue__field_descriptor),
           (Data.ProtoLens.Tag 5, sustain__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetRGBLedRequest'_unknownFields
        (\ x__ y__ -> x__ {_SetRGBLedRequest'_unknownFields = y__})
  defMessage
    = SetRGBLedRequest'_constructor
        {_SetRGBLedRequest'led = Data.ProtoLens.fieldDefault,
         _SetRGBLedRequest'red = Data.ProtoLens.fieldDefault,
         _SetRGBLedRequest'green = Data.ProtoLens.fieldDefault,
         _SetRGBLedRequest'blue = Data.ProtoLens.fieldDefault,
         _SetRGBLedRequest'sustain = Data.ProtoLens.fieldDefault,
         _SetRGBLedRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetRGBLedRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SetRGBLedRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "led"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"led") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "red"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"red") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "green"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"green") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "blue"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"blue") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sustain"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"sustain") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetRGBLedRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"led") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"red") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"green") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"blue") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"sustain") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData SetRGBLedRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetRGBLedRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SetRGBLedRequest'led x__)
                (Control.DeepSeq.deepseq
                   (_SetRGBLedRequest'red x__)
                   (Control.DeepSeq.deepseq
                      (_SetRGBLedRequest'green x__)
                      (Control.DeepSeq.deepseq
                         (_SetRGBLedRequest'blue x__)
                         (Control.DeepSeq.deepseq (_SetRGBLedRequest'sustain x__) ())))))
{- | Fields :
     
         * 'Proto.Keymapp_Fields.success' @:: Lens' SetStatusLedReply Prelude.Bool@ -}
data SetStatusLedReply
  = SetStatusLedReply'_constructor {_SetStatusLedReply'success :: !Prelude.Bool,
                                    _SetStatusLedReply'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetStatusLedReply where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetStatusLedReply "success" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetStatusLedReply'success
           (\ x__ y__ -> x__ {_SetStatusLedReply'success = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetStatusLedReply where
  messageName _ = Data.Text.pack "api.SetStatusLedReply"
  packedMessageDescriptor _
    = "\n\
      \\DC1SetStatusLedReply\DC2\CAN\n\
      \\asuccess\CAN\SOH \SOH(\bR\asuccess"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        success__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "success"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"success")) ::
              Data.ProtoLens.FieldDescriptor SetStatusLedReply
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, success__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetStatusLedReply'_unknownFields
        (\ x__ y__ -> x__ {_SetStatusLedReply'_unknownFields = y__})
  defMessage
    = SetStatusLedReply'_constructor
        {_SetStatusLedReply'success = Data.ProtoLens.fieldDefault,
         _SetStatusLedReply'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetStatusLedReply
          -> Data.ProtoLens.Encoding.Bytes.Parser SetStatusLedReply
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "success"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"success") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetStatusLedReply"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"success") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SetStatusLedReply where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetStatusLedReply'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SetStatusLedReply'success x__) ())
{- | Fields :
     
         * 'Proto.Keymapp_Fields.led' @:: Lens' SetStatusLedRequest Data.Int.Int32@
         * 'Proto.Keymapp_Fields.on' @:: Lens' SetStatusLedRequest Prelude.Bool@
         * 'Proto.Keymapp_Fields.sustain' @:: Lens' SetStatusLedRequest Data.Int.Int32@ -}
data SetStatusLedRequest
  = SetStatusLedRequest'_constructor {_SetStatusLedRequest'led :: !Data.Int.Int32,
                                      _SetStatusLedRequest'on :: !Prelude.Bool,
                                      _SetStatusLedRequest'sustain :: !Data.Int.Int32,
                                      _SetStatusLedRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SetStatusLedRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SetStatusLedRequest "led" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetStatusLedRequest'led
           (\ x__ y__ -> x__ {_SetStatusLedRequest'led = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetStatusLedRequest "on" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetStatusLedRequest'on
           (\ x__ y__ -> x__ {_SetStatusLedRequest'on = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SetStatusLedRequest "sustain" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SetStatusLedRequest'sustain
           (\ x__ y__ -> x__ {_SetStatusLedRequest'sustain = y__}))
        Prelude.id
instance Data.ProtoLens.Message SetStatusLedRequest where
  messageName _ = Data.Text.pack "api.SetStatusLedRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3SetStatusLedRequest\DC2\DLE\n\
      \\ETXled\CAN\SOH \SOH(\ENQR\ETXled\DC2\SO\n\
      \\STXon\CAN\STX \SOH(\bR\STXon\DC2\CAN\n\
      \\asustain\CAN\ETX \SOH(\ENQR\asustain"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        led__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "led"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"led")) ::
              Data.ProtoLens.FieldDescriptor SetStatusLedRequest
        on__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "on"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"on")) ::
              Data.ProtoLens.FieldDescriptor SetStatusLedRequest
        sustain__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sustain"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"sustain")) ::
              Data.ProtoLens.FieldDescriptor SetStatusLedRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, led__field_descriptor),
           (Data.ProtoLens.Tag 2, on__field_descriptor),
           (Data.ProtoLens.Tag 3, sustain__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SetStatusLedRequest'_unknownFields
        (\ x__ y__ -> x__ {_SetStatusLedRequest'_unknownFields = y__})
  defMessage
    = SetStatusLedRequest'_constructor
        {_SetStatusLedRequest'led = Data.ProtoLens.fieldDefault,
         _SetStatusLedRequest'on = Data.ProtoLens.fieldDefault,
         _SetStatusLedRequest'sustain = Data.ProtoLens.fieldDefault,
         _SetStatusLedRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SetStatusLedRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SetStatusLedRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "led"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"led") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "on"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"on") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sustain"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"sustain") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SetStatusLedRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"led") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"on") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"sustain") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData SetStatusLedRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SetStatusLedRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SetStatusLedRequest'led x__)
                (Control.DeepSeq.deepseq
                   (_SetStatusLedRequest'on x__)
                   (Control.DeepSeq.deepseq (_SetStatusLedRequest'sustain x__) ())))
data KeyboardService = KeyboardService {}
instance Data.ProtoLens.Service.Types.Service KeyboardService where
  type ServiceName KeyboardService = "KeyboardService"
  type ServicePackage KeyboardService = "api"
  type ServiceMethods KeyboardService = '["connectAnyKeyboard",
                                          "connectKeyboard",
                                          "decreaseBrightness",
                                          "disconnectKeyboard",
                                          "getKeyboards",
                                          "getStatus",
                                          "increaseBrightness",
                                          "setLayer",
                                          "setRGBAll",
                                          "setRGBLed",
                                          "setStatusLed",
                                          "unsetLayer"]
  packedServiceDescriptor _
    = "\n\
      \\SIKeyboardService\DC29\n\
      \\tGetStatus\DC2\NAK.api.GetStatusRequest\SUB\DC3.api.GetStatusReply\"\NUL\DC2B\n\
      \\fGetKeyboards\DC2\CAN.api.GetKeyboardsRequest\SUB\SYN.api.GetKeyboardsReply\"\NUL\DC2K\n\
      \\SIConnectKeyboard\DC2\ESC.api.ConnectKeyboardRequest\SUB\EM.api.ConnectKeyboardReply\"\NUL\DC2Q\n\
      \\DC2ConnectAnyKeyboard\DC2\RS.api.ConnectAnyKeyboardRequest\SUB\EM.api.ConnectKeyboardReply\"\NUL\DC2T\n\
      \\DC2DisconnectKeyboard\DC2\RS.api.DisconnectKeyboardRequest\SUB\FS.api.DisconnectKeyboardReply\"\NUL\DC26\n\
      \\bSetLayer\DC2\DC4.api.SetLayerRequest\SUB\DC2.api.SetLayerReply\"\NUL\DC28\n\
      \\n\
      \UnsetLayer\DC2\DC4.api.SetLayerRequest\SUB\DC2.api.SetLayerReply\"\NUL\DC29\n\
      \\tSetRGBLed\DC2\NAK.api.SetRGBLedRequest\SUB\DC3.api.SetRGBLedReply\"\NUL\DC29\n\
      \\tSetRGBAll\DC2\NAK.api.SetRGBAllRequest\SUB\DC3.api.SetRGBAllReply\"\NUL\DC2B\n\
      \\fSetStatusLed\DC2\CAN.api.SetStatusLedRequest\SUB\SYN.api.SetStatusLedReply\"\NUL\DC2R\n\
      \\DC2IncreaseBrightness\DC2\RS.api.IncreaseBrightnessRequest\SUB\SUB.api.BrightnessUpdateReply\"\NUL\DC2R\n\
      \\DC2DecreaseBrightness\DC2\RS.api.DecreaseBrightnessRequest\SUB\SUB.api.BrightnessUpdateReply\"\NUL"
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "getStatus" where
  type MethodName KeyboardService "getStatus" = "GetStatus"
  type MethodInput KeyboardService "getStatus" = GetStatusRequest
  type MethodOutput KeyboardService "getStatus" = GetStatusReply
  type MethodStreamingType KeyboardService "getStatus" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "getKeyboards" where
  type MethodName KeyboardService "getKeyboards" = "GetKeyboards"
  type MethodInput KeyboardService "getKeyboards" = GetKeyboardsRequest
  type MethodOutput KeyboardService "getKeyboards" = GetKeyboardsReply
  type MethodStreamingType KeyboardService "getKeyboards" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "connectKeyboard" where
  type MethodName KeyboardService "connectKeyboard" = "ConnectKeyboard"
  type MethodInput KeyboardService "connectKeyboard" = ConnectKeyboardRequest
  type MethodOutput KeyboardService "connectKeyboard" = ConnectKeyboardReply
  type MethodStreamingType KeyboardService "connectKeyboard" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "connectAnyKeyboard" where
  type MethodName KeyboardService "connectAnyKeyboard" = "ConnectAnyKeyboard"
  type MethodInput KeyboardService "connectAnyKeyboard" = ConnectAnyKeyboardRequest
  type MethodOutput KeyboardService "connectAnyKeyboard" = ConnectKeyboardReply
  type MethodStreamingType KeyboardService "connectAnyKeyboard" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "disconnectKeyboard" where
  type MethodName KeyboardService "disconnectKeyboard" = "DisconnectKeyboard"
  type MethodInput KeyboardService "disconnectKeyboard" = DisconnectKeyboardRequest
  type MethodOutput KeyboardService "disconnectKeyboard" = DisconnectKeyboardReply
  type MethodStreamingType KeyboardService "disconnectKeyboard" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "setLayer" where
  type MethodName KeyboardService "setLayer" = "SetLayer"
  type MethodInput KeyboardService "setLayer" = SetLayerRequest
  type MethodOutput KeyboardService "setLayer" = SetLayerReply
  type MethodStreamingType KeyboardService "setLayer" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "unsetLayer" where
  type MethodName KeyboardService "unsetLayer" = "UnsetLayer"
  type MethodInput KeyboardService "unsetLayer" = SetLayerRequest
  type MethodOutput KeyboardService "unsetLayer" = SetLayerReply
  type MethodStreamingType KeyboardService "unsetLayer" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "setRGBLed" where
  type MethodName KeyboardService "setRGBLed" = "SetRGBLed"
  type MethodInput KeyboardService "setRGBLed" = SetRGBLedRequest
  type MethodOutput KeyboardService "setRGBLed" = SetRGBLedReply
  type MethodStreamingType KeyboardService "setRGBLed" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "setRGBAll" where
  type MethodName KeyboardService "setRGBAll" = "SetRGBAll"
  type MethodInput KeyboardService "setRGBAll" = SetRGBAllRequest
  type MethodOutput KeyboardService "setRGBAll" = SetRGBAllReply
  type MethodStreamingType KeyboardService "setRGBAll" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "setStatusLed" where
  type MethodName KeyboardService "setStatusLed" = "SetStatusLed"
  type MethodInput KeyboardService "setStatusLed" = SetStatusLedRequest
  type MethodOutput KeyboardService "setStatusLed" = SetStatusLedReply
  type MethodStreamingType KeyboardService "setStatusLed" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "increaseBrightness" where
  type MethodName KeyboardService "increaseBrightness" = "IncreaseBrightness"
  type MethodInput KeyboardService "increaseBrightness" = IncreaseBrightnessRequest
  type MethodOutput KeyboardService "increaseBrightness" = BrightnessUpdateReply
  type MethodStreamingType KeyboardService "increaseBrightness" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl KeyboardService "decreaseBrightness" where
  type MethodName KeyboardService "decreaseBrightness" = "DecreaseBrightness"
  type MethodInput KeyboardService "decreaseBrightness" = DecreaseBrightnessRequest
  type MethodOutput KeyboardService "decreaseBrightness" = BrightnessUpdateReply
  type MethodStreamingType KeyboardService "decreaseBrightness" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\rkeymapp.proto\DC2\ETXapi\"b\n\
    \\bKeyboard\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\ENQR\STXid\DC2#\n\
    \\rfriendly_name\CAN\STX \SOH(\tR\ffriendlyName\DC2!\n\
    \\fis_connected\CAN\ETX \SOH(\bR\visConnected\"\136\SOH\n\
    \\DC1ConnectedKeyboard\DC2#\n\
    \\rfriendly_name\CAN\SOH \SOH(\tR\ffriendlyName\DC2)\n\
    \\DLEfirmware_version\CAN\STX \SOH(\tR\SIfirmwareVersion\DC2#\n\
    \\rcurrent_layer\CAN\ETX \SOH(\ENQR\fcurrentLayer\"\DC2\n\
    \\DLEGetStatusRequest\"\128\SOH\n\
    \\SOGetStatusReply\DC2'\n\
    \\SIkeymapp_version\CAN\SOH \SOH(\tR\SOkeymappVersion\DC2E\n\
    \\DC2connected_keyboard\CAN\STX \SOH(\v2\SYN.api.ConnectedKeyboardR\DC1connectedKeyboard\"\NAK\n\
    \\DC3GetKeyboardsRequest\"@\n\
    \\DC1GetKeyboardsReply\DC2+\n\
    \\tkeyboards\CAN\SOH \ETX(\v2\r.api.KeyboardR\tkeyboards\"\ESC\n\
    \\EMConnectAnyKeyboardRequest\"(\n\
    \\SYNConnectKeyboardRequest\DC2\SO\n\
    \\STXid\CAN\SOH \SOH(\ENQR\STXid\"0\n\
    \\DC4ConnectKeyboardReply\DC2\CAN\n\
    \\asuccess\CAN\SOH \SOH(\bR\asuccess\"\ESC\n\
    \\EMDisconnectKeyboardRequest\"3\n\
    \\ETBDisconnectKeyboardReply\DC2\CAN\n\
    \\asuccess\CAN\SOH \SOH(\bR\asuccess\"'\n\
    \\SISetLayerRequest\DC2\DC4\n\
    \\ENQlayer\CAN\SOH \SOH(\ENQR\ENQlayer\")\n\
    \\rSetLayerReply\DC2\CAN\n\
    \\asuccess\CAN\SOH \SOH(\bR\asuccess\"z\n\
    \\DLESetRGBLedRequest\DC2\DLE\n\
    \\ETXled\CAN\SOH \SOH(\ENQR\ETXled\DC2\DLE\n\
    \\ETXred\CAN\STX \SOH(\ENQR\ETXred\DC2\DC4\n\
    \\ENQgreen\CAN\ETX \SOH(\ENQR\ENQgreen\DC2\DC2\n\
    \\EOTblue\CAN\EOT \SOH(\ENQR\EOTblue\DC2\CAN\n\
    \\asustain\CAN\ENQ \SOH(\ENQR\asustain\"*\n\
    \\SOSetRGBLedReply\DC2\CAN\n\
    \\asuccess\CAN\SOH \SOH(\bR\asuccess\"h\n\
    \\DLESetRGBAllRequest\DC2\DLE\n\
    \\ETXred\CAN\SOH \SOH(\ENQR\ETXred\DC2\DC4\n\
    \\ENQgreen\CAN\STX \SOH(\ENQR\ENQgreen\DC2\DC2\n\
    \\EOTblue\CAN\ETX \SOH(\ENQR\EOTblue\DC2\CAN\n\
    \\asustain\CAN\EOT \SOH(\ENQR\asustain\"*\n\
    \\SOSetRGBAllReply\DC2\CAN\n\
    \\asuccess\CAN\SOH \SOH(\bR\asuccess\"Q\n\
    \\DC3SetStatusLedRequest\DC2\DLE\n\
    \\ETXled\CAN\SOH \SOH(\ENQR\ETXled\DC2\SO\n\
    \\STXon\CAN\STX \SOH(\bR\STXon\DC2\CAN\n\
    \\asustain\CAN\ETX \SOH(\ENQR\asustain\"-\n\
    \\DC1SetStatusLedReply\DC2\CAN\n\
    \\asuccess\CAN\SOH \SOH(\bR\asuccess\"\ESC\n\
    \\EMIncreaseBrightnessRequest\"\ESC\n\
    \\EMDecreaseBrightnessRequest\"1\n\
    \\NAKBrightnessUpdateReply\DC2\CAN\n\
    \\asuccess\CAN\SOH \SOH(\bR\asuccess2\218\ACK\n\
    \\SIKeyboardService\DC29\n\
    \\tGetStatus\DC2\NAK.api.GetStatusRequest\SUB\DC3.api.GetStatusReply\"\NUL\DC2B\n\
    \\fGetKeyboards\DC2\CAN.api.GetKeyboardsRequest\SUB\SYN.api.GetKeyboardsReply\"\NUL\DC2K\n\
    \\SIConnectKeyboard\DC2\ESC.api.ConnectKeyboardRequest\SUB\EM.api.ConnectKeyboardReply\"\NUL\DC2Q\n\
    \\DC2ConnectAnyKeyboard\DC2\RS.api.ConnectAnyKeyboardRequest\SUB\EM.api.ConnectKeyboardReply\"\NUL\DC2T\n\
    \\DC2DisconnectKeyboard\DC2\RS.api.DisconnectKeyboardRequest\SUB\FS.api.DisconnectKeyboardReply\"\NUL\DC26\n\
    \\bSetLayer\DC2\DC4.api.SetLayerRequest\SUB\DC2.api.SetLayerReply\"\NUL\DC28\n\
    \\n\
    \UnsetLayer\DC2\DC4.api.SetLayerRequest\SUB\DC2.api.SetLayerReply\"\NUL\DC29\n\
    \\tSetRGBLed\DC2\NAK.api.SetRGBLedRequest\SUB\DC3.api.SetRGBLedReply\"\NUL\DC29\n\
    \\tSetRGBAll\DC2\NAK.api.SetRGBAllRequest\SUB\DC3.api.SetRGBAllReply\"\NUL\DC2B\n\
    \\fSetStatusLed\DC2\CAN.api.SetStatusLedRequest\SUB\SYN.api.SetStatusLedReply\"\NUL\DC2R\n\
    \\DC2IncreaseBrightness\DC2\RS.api.IncreaseBrightnessRequest\SUB\SUB.api.BrightnessUpdateReply\"\NUL\DC2R\n\
    \\DC2DecreaseBrightness\DC2\RS.api.DecreaseBrightnessRequest\SUB\SUB.api.BrightnessUpdateReply\"\NULB\FSZ\SUBgithub.com/zsa/keymapp/apiJ\147\ESC\n\
    \\ACK\DC2\EOT\NUL\NULu\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\b\DC2\ETX\STX\NUL1\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\STX\NUL1\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ETX\NUL\f\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\ENQ\NUL\t\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\ENQ\b\DLE\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\ACK\EOT\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX\ACK\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\ACK\n\
    \\f\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\ACK\SI\DLE\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\a\EOT\GS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX\a\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\a\v\CAN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\a\ESC\FS\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX\b\EOT\SUB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ENQ\DC2\ETX\b\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX\b\t\NAK\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX\b\CAN\EM\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\v\NUL\SI\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\v\b\EM\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\f\EOT\GS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\f\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\f\v\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\f\ESC\FS\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\r\EOT \n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX\r\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\r\v\ESC\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\r\RS\US\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\SO\EOT\FS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX\SO\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\SO\n\
    \\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\SO\SUB\ESC\n\
    \\t\n\
    \\STX\EOT\STX\DC2\ETX\DC1\NUL\ESC\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX\DC1\b\CAN\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOT\DC2\NUL\NAK\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX\DC2\b\SYN\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETX\DC3\EOT\US\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\ETX\DC3\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETX\DC3\v\SUB\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETX\DC3\GS\RS\n\
    \\v\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\ETX\DC4\EOT-\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ACK\DC2\ETX\DC4\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\ETX\DC4\SYN(\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\ETX\DC4+,\n\
    \\t\n\
    \\STX\EOT\EOT\DC2\ETX\ETB\NUL\RS\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETX\ETB\b\ESC\n\
    \\n\
    \\n\
    \\STX\EOT\ENQ\DC2\EOT\CAN\NUL\SUB\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETX\CAN\b\EM\n\
    \\v\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETX\EM\EOT$\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\EOT\DC2\ETX\EM\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ACK\DC2\ETX\EM\r\NAK\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETX\EM\SYN\US\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETX\EM\"#\n\
    \\t\n\
    \\STX\EOT\ACK\DC2\ETX\FS\NUL$\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\SOH\DC2\ETX\FS\b!\n\
    \\n\
    \\n\
    \\STX\EOT\a\DC2\EOT\RS\NUL \SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\a\SOH\DC2\ETX\RS\b\RS\n\
    \\v\n\
    \\EOT\EOT\a\STX\NUL\DC2\ETX\US\EOT\DC1\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\ETX\US\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\ETX\US\n\
    \\f\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\ETX\US\SI\DLE\n\
    \\n\
    \\n\
    \\STX\EOT\b\DC2\EOT!\NUL#\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\b\SOH\DC2\ETX!\b\FS\n\
    \\v\n\
    \\EOT\EOT\b\STX\NUL\DC2\ETX\"\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\ETX\"\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\ETX\"\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\ETX\"\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\t\DC2\EOT%\NUL&\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\t\SOH\DC2\ETX%\b!\n\
    \\n\
    \\n\
    \\STX\EOT\n\
    \\DC2\EOT(\NUL*\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\n\
    \\SOH\DC2\ETX(\b\US\n\
    \\v\n\
    \\EOT\EOT\n\
    \\STX\NUL\DC2\ETX)\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ENQ\DC2\ETX)\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\n\
    \\STX\NUL\SOH\DC2\ETX)\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ETX\DC2\ETX)\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\v\DC2\EOT,\NUL.\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\v\SOH\DC2\ETX,\b\ETB\n\
    \\v\n\
    \\EOT\EOT\v\STX\NUL\DC2\ETX-\EOT\DC4\n\
    \\f\n\
    \\ENQ\EOT\v\STX\NUL\ENQ\DC2\ETX-\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\v\STX\NUL\SOH\DC2\ETX-\n\
    \\SI\n\
    \\f\n\
    \\ENQ\EOT\v\STX\NUL\ETX\DC2\ETX-\DC2\DC3\n\
    \\n\
    \\n\
    \\STX\EOT\f\DC2\EOT/\NUL1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\f\SOH\DC2\ETX/\b\NAK\n\
    \\v\n\
    \\EOT\EOT\f\STX\NUL\DC2\ETX0\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\f\STX\NUL\ENQ\DC2\ETX0\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\f\STX\NUL\SOH\DC2\ETX0\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\f\STX\NUL\ETX\DC2\ETX0\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\r\DC2\EOT3\NUL9\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\r\SOH\DC2\ETX3\b\CAN\n\
    \\v\n\
    \\EOT\EOT\r\STX\NUL\DC2\ETX4\EOT\DC2\n\
    \\f\n\
    \\ENQ\EOT\r\STX\NUL\ENQ\DC2\ETX4\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\r\STX\NUL\SOH\DC2\ETX4\n\
    \\r\n\
    \\f\n\
    \\ENQ\EOT\r\STX\NUL\ETX\DC2\ETX4\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\r\STX\SOH\DC2\ETX5\EOT\DC2\n\
    \\f\n\
    \\ENQ\EOT\r\STX\SOH\ENQ\DC2\ETX5\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\r\STX\SOH\SOH\DC2\ETX5\n\
    \\r\n\
    \\f\n\
    \\ENQ\EOT\r\STX\SOH\ETX\DC2\ETX5\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\r\STX\STX\DC2\ETX6\EOT\DC4\n\
    \\f\n\
    \\ENQ\EOT\r\STX\STX\ENQ\DC2\ETX6\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\r\STX\STX\SOH\DC2\ETX6\n\
    \\SI\n\
    \\f\n\
    \\ENQ\EOT\r\STX\STX\ETX\DC2\ETX6\DC2\DC3\n\
    \\v\n\
    \\EOT\EOT\r\STX\ETX\DC2\ETX7\EOT\DC3\n\
    \\f\n\
    \\ENQ\EOT\r\STX\ETX\ENQ\DC2\ETX7\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\r\STX\ETX\SOH\DC2\ETX7\n\
    \\SO\n\
    \\f\n\
    \\ENQ\EOT\r\STX\ETX\ETX\DC2\ETX7\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\r\STX\EOT\DC2\ETX8\EOT\SYN\n\
    \\f\n\
    \\ENQ\EOT\r\STX\EOT\ENQ\DC2\ETX8\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\r\STX\EOT\SOH\DC2\ETX8\n\
    \\DC1\n\
    \\f\n\
    \\ENQ\EOT\r\STX\EOT\ETX\DC2\ETX8\DC4\NAK\n\
    \\n\
    \\n\
    \\STX\EOT\SO\DC2\EOT:\NUL<\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SO\SOH\DC2\ETX:\b\SYN\n\
    \\v\n\
    \\EOT\EOT\SO\STX\NUL\DC2\ETX;\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\SO\STX\NUL\ENQ\DC2\ETX;\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\SO\STX\NUL\SOH\DC2\ETX;\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\SO\STX\NUL\ETX\DC2\ETX;\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\SI\DC2\EOT>\NULC\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SI\SOH\DC2\ETX>\b\CAN\n\
    \\v\n\
    \\EOT\EOT\SI\STX\NUL\DC2\ETX?\EOT\DC2\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\NUL\ENQ\DC2\ETX?\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\NUL\SOH\DC2\ETX?\n\
    \\r\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\NUL\ETX\DC2\ETX?\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\SI\STX\SOH\DC2\ETX@\EOT\DC4\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\SOH\ENQ\DC2\ETX@\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\SOH\SOH\DC2\ETX@\n\
    \\SI\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\SOH\ETX\DC2\ETX@\DC2\DC3\n\
    \\v\n\
    \\EOT\EOT\SI\STX\STX\DC2\ETXA\EOT\DC3\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\STX\ENQ\DC2\ETXA\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\STX\SOH\DC2\ETXA\n\
    \\SO\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\STX\ETX\DC2\ETXA\DC1\DC2\n\
    \\v\n\
    \\EOT\EOT\SI\STX\ETX\DC2\ETXB\EOT\SYN\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\ETX\ENQ\DC2\ETXB\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\ETX\SOH\DC2\ETXB\n\
    \\DC1\n\
    \\f\n\
    \\ENQ\EOT\SI\STX\ETX\ETX\DC2\ETXB\DC4\NAK\n\
    \\n\
    \\n\
    \\STX\EOT\DLE\DC2\EOTE\NULG\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\DLE\SOH\DC2\ETXE\b\SYN\n\
    \\v\n\
    \\EOT\EOT\DLE\STX\NUL\DC2\ETXF\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\DLE\STX\NUL\ENQ\DC2\ETXF\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\DLE\STX\NUL\SOH\DC2\ETXF\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\DLE\STX\NUL\ETX\DC2\ETXF\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\DC1\DC2\EOTI\NULM\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\DC1\SOH\DC2\ETXI\b\ESC\n\
    \\v\n\
    \\EOT\EOT\DC1\STX\NUL\DC2\ETXJ\EOT\DC2\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\NUL\ENQ\DC2\ETXJ\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\NUL\SOH\DC2\ETXJ\n\
    \\r\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\NUL\ETX\DC2\ETXJ\DLE\DC1\n\
    \\v\n\
    \\EOT\EOT\DC1\STX\SOH\DC2\ETXK\EOT\DLE\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\SOH\ENQ\DC2\ETXK\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\SOH\SOH\DC2\ETXK\t\v\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\SOH\ETX\DC2\ETXK\SO\SI\n\
    \\v\n\
    \\EOT\EOT\DC1\STX\STX\DC2\ETXL\EOT\SYN\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\STX\ENQ\DC2\ETXL\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\STX\SOH\DC2\ETXL\n\
    \\DC1\n\
    \\f\n\
    \\ENQ\EOT\DC1\STX\STX\ETX\DC2\ETXL\DC4\NAK\n\
    \\n\
    \\n\
    \\STX\EOT\DC2\DC2\EOTO\NULQ\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\DC2\SOH\DC2\ETXO\b\EM\n\
    \\v\n\
    \\EOT\EOT\DC2\STX\NUL\DC2\ETXP\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\DC2\STX\NUL\ENQ\DC2\ETXP\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\DC2\STX\NUL\SOH\DC2\ETXP\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\DC2\STX\NUL\ETX\DC2\ETXP\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\EOT\DC3\DC2\EOTS\NULT\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\DC3\SOH\DC2\ETXS\b!\n\
    \\n\
    \\n\
    \\STX\EOT\DC4\DC2\EOTV\NULW\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\DC4\SOH\DC2\ETXV\b!\n\
    \\n\
    \\n\
    \\STX\EOT\NAK\DC2\EOTY\NUL[\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NAK\SOH\DC2\ETXY\b\GS\n\
    \\v\n\
    \\EOT\EOT\NAK\STX\NUL\DC2\ETXZ\EOT\NAK\n\
    \\f\n\
    \\ENQ\EOT\NAK\STX\NUL\ENQ\DC2\ETXZ\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\NAK\STX\NUL\SOH\DC2\ETXZ\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\NAK\STX\NUL\ETX\DC2\ETXZ\DC3\DC4\n\
    \\n\
    \\n\
    \\STX\ACK\NUL\DC2\EOT]\NULu\SOH\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX]\b\ETB\n\
    \\v\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX^\EOT@\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX^\b\DC1\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX^\DC3#\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX^.<\n\
    \8\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX`\EOTI\SUB+ Returns a list of all detected keyboards.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX`\b\DC4\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX`\SYN)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX`4E\n\
    \T\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETXb\EOTR\SUBG Connects to a keyboard using given an id retrieved from GetKeyboards.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETXb\b\ETB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETXb\EM/\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETXb:N\n\
    \8\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETXd\EOTX\SUB+ Connects to the first available keyboard.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETXd\b\SUB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETXd\FS5\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETXd@T\n\
    \W\n\
    \\EOT\ACK\NUL\STX\EOT\DC2\ETXf\EOT[\SUBJ Disconnects to a keyboard using given an id retrieved from GetKeyboards.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\SOH\DC2\ETXf\b\SUB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\STX\DC2\ETXf\FS5\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\ETX\DC2\ETXf@W\n\
    \=\n\
    \\EOT\ACK\NUL\STX\ENQ\DC2\ETXh\EOT=\SUB0 Sets the active layer of a connected keyboard.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\SOH\DC2\ETXh\b\DLE\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\STX\DC2\ETXh\DC2!\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\ETX\DC2\ETXh,9\n\
    \-\n\
    \\EOT\ACK\NUL\STX\ACK\DC2\ETXj\EOT?\SUB  Unsets a previously set layer.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ACK\SOH\DC2\ETXj\b\DC2\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ACK\STX\DC2\ETXj\DC4#\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ACK\ETX\DC2\ETXj.;\n\
    \@\n\
    \\EOT\ACK\NUL\STX\a\DC2\ETXl\EOT@\SUB3 Sets the color of a specific LED on the keyboard.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\a\SOH\DC2\ETXl\b\DC1\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\a\STX\DC2\ETXl\DC3#\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\a\ETX\DC2\ETXl.<\n\
    \:\n\
    \\EOT\ACK\NUL\STX\b\DC2\ETXn\EOT@\SUB- Sets the color of all LEDs on the keyboard.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\b\SOH\DC2\ETXn\b\DC1\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\b\STX\DC2\ETXn\DC3#\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\b\ETX\DC2\ETXn.<\n\
    \3\n\
    \\EOT\ACK\NUL\STX\t\DC2\ETXp\EOTI\SUB& Sets the status LED on the keyboard.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\t\SOH\DC2\ETXp\b\DC4\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\t\STX\DC2\ETXp\SYN)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\t\ETX\DC2\ETXp4E\n\
    \8\n\
    \\EOT\ACK\NUL\STX\n\
    \\DC2\ETXr\EOTY\SUB+ Increases the brightness of the keyboard.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\n\
    \\SOH\DC2\ETXr\b\SUB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\n\
    \\STX\DC2\ETXr\FS5\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\n\
    \\ETX\DC2\ETXr@U\n\
    \8\n\
    \\EOT\ACK\NUL\STX\v\DC2\ETXt\EOTY\SUB+ Decreases the brightness of the keyboard.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\v\SOH\DC2\ETXt\b\SUB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\v\STX\DC2\ETXt\FS5\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\v\ETX\DC2\ETXt@Ub\ACKproto3"