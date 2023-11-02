{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.Hello where

import Import

getHelloR :: Handler Html
getHelloR = defaultLayout $ do
  setTitle "Hello, World!"
  $(widgetFile "hello")

helloWidget :: Widget
helloWidget =

    -- this is quasiquites
  [whamlet|
        <h1>Hello, World via wigeet!
        <p>This is quasi-quoted Hamlet.
        |]