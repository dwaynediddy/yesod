{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.CommentsWidget where

import Import

-- difine the ocmmnt data type
data PostComment = PostComment
  { commentText :: Text
  , commentTime :: Text
  }

  --i need to make a list of comments to map through
commentList :: [PostComment]
commentList = 
    [ PostComment "Comment 1" "12:00 PM"
    , PostComment "Comment 2" "1:30 PM"
    , PostComment "Comment 3" "3:15 PM"
    ]

generateCommentWidgets :: [PostComment] -> Handler Widget
generateCommentWidgets comments = do
    return [whamlet|
        $forall comment <- comments
            <div .comments>
                <p>#{commentText comment}
                <p .comment-time>sent at #{commentTime comment}
    |]
