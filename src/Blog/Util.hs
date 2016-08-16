{-# LANGUAGE OverloadedStrings
           , QuasiQuotes
           , TemplateHaskell #-}

module Blog.Util(postCtx) where

import qualified Hakyll as H

postCtx :: H.Context String
postCtx =
  H.dateField "date" "%B %e, %Y" `mappend`
  H.defaultContext