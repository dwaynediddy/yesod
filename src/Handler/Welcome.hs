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

getSignUpR = defaultLayout [whamlet|<a href=@{SignUpR}>go to sign up|]
getLoginR = defaultLayout [whamlet|<a href=@{LoginR}>gpo to login|]
getWelcomeR = defaultLayout [whamlet|<a href=@{WelcomeR}>go to welcome|]

main = warp 3000 Links