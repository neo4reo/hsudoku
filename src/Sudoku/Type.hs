{-|
Module: Sudoku.Type
Description :  Data types and constructors regarding sudokus
Copyright: (c) Marcel Moosbrugger, 2017
License     : MIT

Defines the data types and constructors regarding sudokus.
-}
module Sudoku.Type(
      Sudoku
    , Difficulty(..)
    , boardsize
    , boxsize
    , cellvals
    , blankval
    , fromString
    , toString
) where

-- Data types
-- ----------

-- |The data type representing a single sudoku board.
newtype Sudoku = Sudoku String deriving (Show)

-- |Representing the difficulty level of a sudoku
data Difficulty = Easy | Medium | Hard | Evil deriving (Eq)

-- Parameters
-- ----------

-- |The side-length of the sudoku
boardsize :: Int
boardsize = 9

-- |The side-length of boxes in the sudokus
boxsize :: Int
boxsize = 3

-- |The symbols which can be inserted into sudokus
cellvals :: [Char]
cellvals = "123456789"

-- |The symbol representing an empty field
blankval :: Char
blankval = '.'

-- Constructors
-- ------------

-- |True iff from a given string a sudoku can be created
valid :: String -> Bool
valid s = (length s == (boardsize * boardsize)) &&
          (all (`elem` blankval:cellvals) s)

-- |Creates a sudoku from a valid string
fromString :: String -> Maybe Sudoku
fromString s
    | valid s   = Just $ Sudoku s
    | otherwise = Nothing

-- |Returns the string representation of a sudoku
toString :: Sudoku -> String
toString (Sudoku s) = s
