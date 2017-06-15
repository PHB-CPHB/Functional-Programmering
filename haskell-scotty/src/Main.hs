{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Rendererß.Text

import qualified Views.List as L
blaze = html . renderHtml

main = scotty 3000 $ do
  get "/" $ do
    html "Hello there!"

  delete "/" $ do
    text "deleted!"

  post "/" $ do
    text "posted!"

  put "/" $ do
    text "put was called!"

  get "/hello" $ do
    name <- param "name"
    text name

  get "/beam/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up</h1>"]

  get "/list" $ do
      blaze L.render
