---
title: Haskell High Performance Programming
subtitle: Errata of the book
author: Alexei Pastuchov
date: 2018-07-12
lang: en
---

= Chapter 1
== Writing sum correctly
=== mySum

Chapter 1, section "Writing sum correctly" introduces the function:

> mySum :: [Int] -> Int
> mySum     [] = 0
> mySum (x:xs) = x + mySum xs

The explanation code snippet isn't correct
```
mySum [1..100]
    = 1 + mySum [2..100]
    = 1 + (2 + mySum [2..100])
    = 1 + (2 + (3 + mySum [2..100]))
    = ...
    = 1 + (2 + (... + mySum [100]))
 = 1 + (2 + (... + (100 + 0)))
```
Convention section, page xiii contains the same code snippet.

In both cases it should be replaced by:
```
mySum [1..100]
    = 1 + mySum [2..100]
    = 1 + (2 + mySum [3..100])
    = 1 + (2 + (3 + mySum [4..100]))
    = ...
    = 1 + (2 + (... + mySum [100]))
 = 1 + (2 + (... + (100 + 0)))
```
=== mySum2

Chapter 1, page 4 in section "Writing sum correctly" introduces the function:

> mySum2 :: Int -> [Int] -> Int
> mySum2 s []     = s
> mySum2 s (x:xs) = let s' = s + x in mySum2 s' xs

The code snippet used for explanation isn't correct
```
mySum2 0 [1..100]
    = let s1 = 0 + 1 in mySum2 s1 [2..100]
    = let s1 = 0 + 1
          s2 = s1 + 2
          in mySum2 s2 [2..100]
    ...
    = let s1 = 0 + 1
          ...
          s100 = s99 + 100
          in mySum2 s100 []
    = s100
    = s99 + 100
    = (s89 + 99) + 100
    ...
    = ((1 + 2) + ... ) + 100
```
It should be replaced by:
```
mySum2 0 [1..100]
    = let s1 = 0 + 1 in mySum2 s1 [2..100]
    = let s1 = 0 + 1
          s2 = s1 + 2
          in mySum2 s2 [3..100]
    ...
    = let s1 = 0 + 1
          ...
          s100 = s99 + 100
          in mySum2 s100 []
    = s100
    = s99 + 100
    = (s89 + 99) + 100
    ...
    = ((1 + 2) + ... ) + 100
```
