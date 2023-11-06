{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Welcome where

import Control.Applicative ((<$>), (<*>))
import Data.Text (Text)
import Yesod

data App = App

mkYesod
  "App"
  [parseRoutes|
/ WelcomeR GET
/signup SignUpR GET
/login LoginR GET
/home HomeR GET
|]

instance Yesod App

getSignUpR :: Handler Html
getSignUpR = defaultLayout $ do
  setTitle ("Sign Up")
  [whamlet|
  <h2> Sign up
  <form method=post action=@{LoginR}>
  <div>
    <label for="username">Add A Username:
    <input type="text" id="username" name="username" required>
    <label for="password">enter a password:
    <input type="password" id="password" name="password" required>
    <input type=submit value="sign up">
  <div>
    <p>already have an account? log in here
      <button><a href=@{LoginR}>go to login
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
        <label for="password">Password:
        <input type="text" id="password" name="password" required>
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

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
  setTitle ("Home page")

[whamlet|
    <nav>
        <ul>
            <li>
                <a href=@{HomeR}>Home
            <li>
                <a href=@{HomeR}>About
            <li>
                <a href=@{HomeR}>Products
            <li>
                <a href=@{HomeR}>Contacts
    <h2>Welcome to my page
    <div>
        <h3>Main Section
            <p>Look at the cute animals
            <img src=@{StaticR kot.png} alt="cute animal">
|]

main = warp 3000 App