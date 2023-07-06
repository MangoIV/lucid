------------------------------------------------------------------------------
-- |
-- Module:      Blaze.ByteString.Builder.Char.Utf8
-- Copyright:   (c) 2013 Leon P Smith
-- License:     BSD3
-- Maintainer:  https://github.com/blaze-builder
-- Stability:   stable
--
-- 'Write's and 'Builder's for serializing Unicode characters using the UTF-8
-- encoding.
--
------------------------------------------------------------------------------

module Blaze.ByteString.Builder.Char.Utf8
    (
      -- * Creating Builders from UTF-8 encoded characters
      fromChar
    , fromString
    , fromShow
    , fromText
    , fromLazyText
    ) where

import           Data.ByteString.Builder ( Builder )
import qualified Data.ByteString.Builder as B
import qualified Data.Text      as TS
import qualified Data.Text.Lazy as TL

-- | /O(1)/. Serialize a Unicode character using the UTF-8 encoding.
--
fromChar :: Char -> Builder
fromChar = B.charUtf8
{-# INLINE fromChar #-}

-- | /O(n)/. Serialize a Unicode 'String' using the UTF-8 encoding.
--
fromString :: String -> Builder
fromString = B.stringUtf8
{-# INLINE fromString #-}

-- | /O(n)/. Serialize a value by 'Show'ing it and UTF-8 encoding the resulting
-- 'String'.
--
fromShow :: Show a => a -> Builder
fromShow = fromString . show
{-# INLINE fromShow #-}

-- | /O(n)/. Serialize a strict Unicode 'TS.Text' value using the UTF-8 encoding.
--
fromText :: TS.Text -> Builder
fromText = fromString . TS.unpack
{-# INLINE fromText #-}

-- | /O(n)/. Serialize a lazy Unicode 'TL.Text' value using the UTF-8 encoding.
--
fromLazyText :: TL.Text -> Builder
fromLazyText = fromString . TL.unpack
{-# INLINE fromLazyText #-}
