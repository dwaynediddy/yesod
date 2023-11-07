{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.CommentsWidget where

import Import

-- yessss ok so instead of passing Handler Html use
-- to use it somehwere else

getCommentsOneR :: Widget
getCommentsOneR = do
  [whamlet|
        <div class="comment1">
            <p>monday legs & shoulders, tuesday chest & arms, wednesday rest, 
                thursday legs, friday back and shoulders saturday rest?
        

    |]

getCommentsTwoR :: Widget
getCommentsTwoR = do
  [whamlet|
        <div class="comment1">
            <p>high weight high intensity have until february could do 4 weeks of 3 different variations
    |]
