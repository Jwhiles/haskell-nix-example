{-# Language DataKinds #-}
{-# Language DeriveAnyClass #-}
{-# Language DeriveGeneric #-}
{-# Language TypeOperators #-}
{-# Language OverloadedStrings #-}


module Main where

import Data.Text
import Data.Aeson (FromJSON, ToJSON)
import Data.Time (UTCTime)
import GHC.Generics (Generic)
import Servant
import Servant.Server
import Network.Wai (Application)

import qualified Network.Wai.Handler.Warp

data Cutie = Amelie | Waluigi
  deriving (Generic, ToJSON)


-- /cutie/{cutieId}
-- /allCuties
type CutieFinder = 
  "cutie" :> Capture "cutieId" Integer :> Get '[JSON] Cutie
  :<|> 
  "allCuties" :> Get '[JSON] [Cutie]

server :: Server CutieFinder
server = 
  handleGetCutie :<|>
  handleGetAllCuties


handleGetCutie :: Integer -> Handler Cutie
handleGetCutie cutieId = 
  case cutieId of 1 -> return Amelie
                  2 -> return Waluigi
                  _ -> fail "not a cutie"

handleGetAllCuties :: Handler [Cutie]
handleGetAllCuties = return [Amelie, Waluigi]

main :: IO ()
main = Network.Wai.Handler.Warp.run 8080 application

application :: Application
application = serve (Proxy :: Proxy CutieFinder) server
