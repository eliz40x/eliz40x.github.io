{-# LANGUAGE OverloadedStrings
           , QuasiQuotes
           , TemplateHaskell #-}

module Pages.Template.Post(post) where

import qualified Hakyll as H
import Text.Hamlet (shamlet, Html)
import Text.Blaze.Html.Renderer.String (renderHtml)

post :: H.Template
post = let html = renderHtml template
        in  H.readTemplate html
    
template :: Html
template = [shamlet|
  <aside>
    <h2>$title$
    <p>Posted on $date$
    \$if(author)$
      <p>by $author$
    \$endif$
  <article>
    \$body$
  <div id="disqus_thread">
  <script type="text/javascript">
    /* * * CONFIGURATION VARIABLES * * */
    var disqus_shortname = 'eliza0x';
    var disqus_identifier = "$url$";
    var disqus_title = "$title$";
    var disqus_url = "https://eliza.link$url$";

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
      var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
      dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
  <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a>
|]
