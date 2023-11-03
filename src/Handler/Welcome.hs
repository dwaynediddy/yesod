{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Welcome where

import Data.Text (Text)
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
  setTitle ("Sign Up")
  [whamlet|
  <form method=post action=@{LoginR}>
  <div>
    <label for="username">Add A Username:
    <input type="text" id="username" name="username" required>
    <label for="password">enter a password:
    <input type="password" id="password" name="password" required>
    <input type=submit value="sign up">
    <div>
      <button>
        <a href=@{LoginR}>go to login
    <div>
      <p>already have an accoutn? log in ehre
  |]

getLoginR :: Handler Html
getLoginR = defaultLayout $ do
  setTitle ("Log in")
  [whamlet|
    <h2>Login Here
    <form method=post action=@{LoginR}>
      <div>
        <label for="username">Username:
        <input type="text" id="username" name="username" required>
        <input type=submit value="Log in">
    <div>
      <p>dont have an account sign up here
        <button><a href=@{SignUpR}>sign up
    |]

getWelcomeR :: Handler Html
getWelcomeR = defaultLayout $ do
  setTitle ("Welcome")
  [whamlet|
  <h2>welcome to my page
  <div>
    <button>
      <a href=@{SignUpR}>sign up here
  <div>
    <p> this is the login page
      <button>
        <a href=@{LoginR}>go to login
  <div>
  
|]

main = warp 3000 Links