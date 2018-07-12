Haskell High Performance Programming
=======

Errata of the book
---------

-   [Chapter 1](#chapter-1)
    -   [Writing sum correctly](#writing-sum-correctly)
        -   [Page 4](#page-4)

Chapter 1
=========

Writing sum correctly
---------------------

### Page 4

Chapter 1, section "Writing sum correctly" introduces the function:

``` {.sourceCode .literate .haskell}
mySum :: [Int] -> Int
mySum     [] = 0
mySum (x:xs) = x + mySum xs
```

The explanation code snippet isn't correct

    mySum [1..100]
        = 1 + mySum [2..100]
        = 1 + (2 + mySum [2..100])
        = 1 + (2 + (3 + mySum [2..100]))
        = ...
        = 1 + (2 + (... + mySum [100]))
     = 1 + (2 + (... + (100 + 0)))

Convention section, page xiii contains the same code snippet.

In both cases it should be replaced by:

    mySum [1..100]
        = 1 + mySum [2..100]
        = 1 + (2 + mySum [3..100])
        = 1 + (2 + (3 + mySum [4..100]))
        = ...
        = 1 + (2 + (... + mySum [100]))
     = 1 + (2 + (... + (100 + 0)))

Y
