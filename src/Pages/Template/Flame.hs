{-# LANGUAGE OverloadedStrings
           , QuasiQuotes
           , TemplateHaskell #-}

module Pages.Template.Flame(flame) where

import qualified Hakyll as H
import Text.Hamlet (shamlet, Html)
import Text.Blaze.Html.Renderer.String (renderHtml)

flame :: H.Template
flame =
  let html = renderHtml template :: String
  in  H.readTemplate html

template :: Html
template = [shamlet|
  <!DOCTYPE html>
  <html lang="ja">
    <head>
      <!-- Basic Page Needs
      –––––––––––––––––––––––––––––––––––––––––––––––––– -->
      <meta charset="utf-8">
      <title>eliza.link | $title$
      <meta name="author" content="@Eliza_0x">
      <!-- Google analytics
      –––––––––––––––––––––––––––––––––––––––––––––––––– -->
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-77388062-1', 'auto');
        ga('send', 'pageview');
      <!-- Mobile Specific Metas
      –––––––––––––––––––––––––––––––––––––––––––––––––– -->
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <!-- CSS
      –––––––––––––––––––––––––––––––––––––––––––––––––– -->
      <link rel="stylesheet" href="/css/normalize.css" />
      <link rel="stylesheet" href="/css/milligram.css" />
      <link rel="stylesheet" href="/css/style.css" />
      <link href="https://fonts.googleapis.com/css?family=Open+Sans&subset=latin-ext" rel="stylesheet" />
    <!-- Primary Page Layout
    –––––––––––––––––––––––––––––––––––––––––––––––––– -->
    <body class="container">
      <header>
        <h1 class="header title">
          <a class="title" href="/">eliza.link
        <nav class="navigation">
          <ul class="navigation">
            <li>
              <a href="/about.html">About
            <li>
              <a href="/archive.html">Archive
            <li>
              <a href="/products.html">Products
            <li>
              <a href="/contact.html">Contact
        <div class="clear">
      <!-- Contents
          –––––––––––––––––––––––––––––––––––––––––––––––––– -->
      <main>
        \$body$
      <!-- End Document
          –––––––––––––––––––––––––––––––––––––––––––––––––– -->
      <footer class="footer">Site proudly generated by
        <a href="http://jaspervdj.be/hakyll">Hakyll<br />
        hosted on
        <a href="https://github.io">Github
|]
