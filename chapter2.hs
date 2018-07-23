{-# LANGUAGE GADTs #-}
-----
  -- title: Haskell High Performance Programming
-- subtitle: Errata of the book
-- author: Alexei Pastuchov
-- date: 2018-07-21
-- lang: en
-----

-- = Chapter 2
-- == Choosing the Correct Data Structures
-- ===

-- https://github.com/PacktPublishing/Haskell-High-Performance-Programming/blob/master/Chapter02/gadts.hs

-- Chapter 2, section "Performance of GADTs and branching"

data Object a where
  Number :: Int -> Object Int
  Character :: Char -> Object Char

data ObjectE where
  NumberE :: Integral a => a -> ObjectE

main :: IO ()
main = do

  -- print $ foldl (\a (NumberE b) -> a + fromIntegral b) 0 [ NumberE x | x <- [1..1000000 :: Int] ]
  print $ foldl (\a (Number b) -> a + b) 0 [ Number x  | x <- [1..1000000 :: Int] ]
