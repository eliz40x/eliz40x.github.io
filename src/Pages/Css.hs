{-# LANGUAGE OverloadedStrings
           , QuasiQuotes
           , TemplateHaskell #-}

module Pages.Css(cssR) where

import qualified Hakyll as H

cssR :: H.Rules ()
cssR =
  H.match "css/*" $ do
    H.route   H.idRoute
    H.compile H.compressCssCompiler