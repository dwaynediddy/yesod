{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.Welcome where

import Import

getWelcomeR :: Handler Html
getWelcomeR = defaultLayout $ do
  setTitle "Hello & Welcome!"
  $(widgetFile "welcome")

welcomeWidget :: Widget

welcomeWidget =
  [whamlet|
    <h2>Welcome to Diddyville!
    <p>tasking your life to fit right in
    |]

mainWidget :: Widget

mainWidget =
  [whamlet|
    <p>lorem ipsum dolor sit amet, consectetur adip ex ea commodo sit am
    |]

getAuthWidget :: Widget

getAuthWidget =
  [whamlet|
  -- link buttons to different pages
    <button>sign up!
    <p>already a mamber?
    <button>log in!
    |]