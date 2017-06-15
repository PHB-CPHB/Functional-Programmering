module Main where

factorial :: Integer -> Integer
factorial 0 = 1
factorial a = a * factorial(a - 1)

revLength :: String -> Int
revLength = length . reverse

--import Lib
main :: IO()
main = do
  putStrLn "factorial of 5: "
  putStrLn $ show $ factorial 5
  putStrLn $ show $ revLength "hello"

-- f (g x) = (f . g) x
