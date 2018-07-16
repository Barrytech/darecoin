module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Welcome to New lab!"
  log $ showAge 17

showAge :: Int -> String
showAge age = "My age is " <> (show age)

showTwoThings :: Int -> Int -> String
showTwoThings a b = "The two things are: " <> show a <> " and " <> show b
