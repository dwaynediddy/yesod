{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Home where

import Handler.CommentsWidget
import Handler.Welcome
import Import

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
  setTitle "Home page"
  $(widgetFile "hello")
  Handler.Welcome.headerWidget
  [whamlet|
      <nav class="nav-container">
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
      
      <div class="content-container">
            <div><p>Look at the cute animals
                <img src=@{StaticR img_kot_png} alt="cute animal">

        <div class="output-container">
            <label>What do you Think of this cute kitten?
            <textarea name="post" row="5" cols="40">

        <div btn-container>
            <button class="submit-btn" type="submit">Submit
-- find out how to map through all commetns
        <div class="comments-container">
            <div class="comments">
                ^{getCommentsOneR}
                    <p class="comment-time">sent at some time o clock
            <div class="comments">
                ^{getCommentsTwoR}
                    <p class="comment-time">sent at a different oclock

  |]