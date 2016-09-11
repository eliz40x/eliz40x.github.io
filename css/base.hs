{-# LANGUAGE OverloadedStrings #-}

import Prelude hiding (div, rem, (**))
import Clay hiding (table, minWidth, fontColor)
import Clay.Display (table)
import Clay.Media (screen, minWidth)
import Data.Monoid ((<>))

main :: IO ()
main = putCss css

fontColor, firstColor, secondColor, backGroundColor :: Color
fontColor       = "#2B2B2B"
firstColor      = "#585858"
secondColor     = "#B4B4B4"
backGroundColor = "#FFFFFF"

css :: Css
css = do
  containerCss
  baseCss
  typoGraphyCss
  teaserCss
  listCss
  headerCss
  pagenateCss
  aboutCss

containerCss :: Css
containerCss = do
  ".container" ? do
    position relative
    width $ pct 100
    maxWidth $ px 960
    margin nil auto nil auto
    padding nil (px 20) nil (px 20)
    boxSizing borderBox
  ".container" # after ? do
    content $ stringContent ""
    display table
    clear both
  query screen [minWidth $ px 400] $
    ".container" ? do
      width $ pct 90
      padding nil nil nil nil
  query screen [minWidth $ px 650] $
    ".container" ? width (pct 75)

baseCss :: Css
baseCss = do
  html ? fontSize (pct 62.5)
  body ? do
    backgroundColor backGroundColor
    fontSize $ em 1.7
    lineHeight $ rem 2.7
    fontWeight $ weight 400
    fontFamily ["Open Sans"] [sansSerif]
    color fontColor
  blockquote ? do
    borderLeft solid (px 2) secondColor
    marginLeft  $ px 10
    paddingLeft $ px 20

typoGraphyCss :: Css
typoGraphyCss = do
  mapM_ headCss
    [ ( h1, rem 4.0, rem $ 4.0 + 1.2,  rem (-0.1) )
    , ( h2, rem 3.6, rem $ 3.6 + 1.25, rem (-0.1)  )
    , ( h3, rem 3.0, rem $ 3.0 + 1.3,  rem (-0.1)  )
    , ( h4, rem 2.4, rem $ 2.4 + 1.35, rem (-0.08) )
    , ( h5, rem 1.8, rem $ 1.8 + 1.5,  rem (-0.05) )
    , ( h6, rem 1.5, rem $ 1.5 + 1.6,  nil )]

  query screen [minWidth $ px 550] $ do
    h1 ? fontSize (rem 5.0)
    h2 ? fontSize (rem 4.2)
    h3 ? fontSize (rem 3.6)
    h4 ? fontSize (rem 3.0)
    h5 ? fontSize (rem 2.4)
    h6 ? fontSize (rem 1.5)

  p ? do
    marginTop nil
    marginBottom (rem 2.0)
  a ? do
    color firstColor
    textDecoration none
  a # hover ? color secondColor
  where
    headCss :: (Selector, Size a, Size b, Size c) -> Css
    headCss (selector, fsize, lheight, lspacing) = selector ? do
      marginTop        nil
      marginBottom   $ rem    2
      fontWeight     $ weight 300
      fontSize         fsize
      lineHeight       lheight
      letterSpacing    lspacing

listCss :: Css
listCss = do
  ul <> ol ? do
    paddingLeft $ px 0
    marginTop   $ px 0
  ul ? listStyle circleListStyle inside none
  ol ? listStyle decimal inside none
  li ? marginBottom (rem 0.5)

teaserCss :: Css
teaserCss = do
  ".teaser" ** h1 ? fontSize (rem 3.6)
  ".teaser" ** h2 ? fontSize (rem 3.0)
  ".teaser" ** h3 ? fontSize (rem 2.4)
  ".teaser" ** h4 ? fontSize (rem 1.8)
  ".teaser" ** h5 ? fontSize (rem 1.5)
  ".teaser" ** h6 ? fontSize (rem 1.5)
  ".more" ? do
    margin (px 10) (px 20) (px 10) auto
    border solid (px 1) firstColor
    background transparent
    width $ px 120
    textAlign $ alignSide sideCenter
  ".more" ** a ? do
    padding (px 7) (px 10) (px 7) (px 10)
    display block
  ".teaser" ? do
    marginBottom $ rem 1
    paddingBottom $ rem 1
    marginLeft $ px 15
    marginRight $ px 15
    listStyle none inside none
  ".teaser" # nthChild "n+2" ? do
    borderTop solid (px 1) firstColor
    marginTop $ rem 1
    paddingTop $ rem 1

headerCss :: Css
headerCss = do
  ".title" ? do
    marginTop    $ rem 2
    marginBottom $ rem 2
    fontSize     $ rem 6.0
    color fontColor
  ".navigation" ? do
    borderTop    solid (px 1) firstColor
    borderBottom solid (px 1) firstColor
    listStyleType none
    overflow hidden
    margin (px 20) nil (px 20) nil
    padding nil nil nil nil
  ".navigation" ** li ? do
    textDecoration none
    margin  nil nil nil nil
    padding nil nil nil nil 
  ".navigation" ** li ** a ? do
    display block
    padding (px 10) nil (px 10) nil
    margin  nil nil nil nil 
  ".navigation" # after ?
    clear both
  query screen [minWidth $ px 500] $ do
    ".navigation" ** li ?
      float floatLeft
    ".navigation" ** li ** a ?
      padding (px 10) (px 15) (px 10) (px 15) 

pagenateCss :: Css
pagenateCss = do
  ".pagination" ? do
    padding nil (px 20) nil (px 20)
    textAlign $ alignSide sideCenter
  ".pagination" ** a ? do
    border solid (px 1) firstColor
    padding (px 5) (px 10) (px 5) (px 10) 
    margin (px 0) (px 10) (px 0) (px 10) 
    
aboutCss :: Css
aboutCss = do
  footer ? do
    borderTop solid (px 1) firstColor
    textAlign $ alignSide sideCenter
    position static
    paddingBottom $ px 15
    paddingTop $ px 15
    margin (px 15) (px 0) (px 15) (px 0) 
  ".archives" ? do
    textAlign $ alignSide sideRight
    marginRight $ px 30
  ".figure" ** img ? width (pct 100)
  query screen [minWidth $ px 600] $
    ".figure" ?
      width (pct 75)
  query screen [minWidth $ px 960] $
    ".figure" ?
      width (pct 50)
  ".footnotes" ? do
    marginTop $ px 20
    marginBottom $ px 10
  ".footnotes" |> hr ?
    border solid (px 1) firstColor