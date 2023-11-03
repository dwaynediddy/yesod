{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Welcome where

import Yesod

data Links = Links

mkYesod
  "Links"
  [parseRoutes|
/ WelcomeR GET
/signup SignUpR GET
/login LoginR GET
|]

instance Yesod Links

getSignUpR :: Handler Html
getSignUpR = defaultLayout $ do
  setTitle("Sign Up")
  [whamlet|
    <div>
      <button>
        <a href=@{LoginR}>gpo to login

    <div>
      <p>already have an accoutn? log in ehre
  |]

getLoginR :: Handler Html
getLoginR = defaultLayout $ do
  setTitle("Log in")
  [whamlet|
  <h2>Login Here
  <div>
    <p>an input for username/email will go here
    <p> input for password
  <div>
    <p>dont have an account sign up here
      <button><a href=@{SignUpR}>sign up
  |]

getWelcomeR :: Handler Html
getWelcomeR = defaultLayout $ do
  setTitle("Welcome")
  [whamlet|
  <h2>welcome to my page
  <div>
    <button>
      <a href=@{SignUpR}>sign up here
  <div>
    <p> this is the login page
      <button>
        <a href=@{LoginR}>gpo to login
  <div>
  
|]

main = warp 3000 Links