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
  commentWidgets <- handlerToWidget $ generateCommentWidgets commentList
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
            <textarea name="post" row="5" cols="40" maxlength="100" id="commentTextarea">

        <div btn-container>
            <button class="submit-btn" type="submit">Submit

        <div class="comments-container">
                ^{commentWidgets}
  |]
