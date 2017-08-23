{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import           Yesod

data Links = Links

mkYesod "Links" [parseRoutes|
/ HomeR GET
/tools ToolsR GET
/contact ContactR GET
|]

instance Yesod Links

getHomeR :: Handler Html
getHomeR  = return $ object ["msg" .= "Hello World"]
getToolsR = defaultLayout [whamlet|<a href=@{HomeR}>Go home!|]
getContactR = defaultLayout [whamlet|<a href=@{HomeR}>Go home!|]

main :: IO ()
main = warp 3000 Links
