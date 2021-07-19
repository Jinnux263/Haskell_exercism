module Deque (Deque, mkDeque, pop, push, shift, unshift) where

data Deque a = Dummy | Node a (Deque a) (Deque a) deriving (Show)

mkDeque :: IO (Deque a)
mkDeque = Dummy

pop :: Deque a -> IO (Maybe a)
pop Dummy = Nothing
pop _
pop deque = error "You need to implement this function."

push :: Deque a -> a -> IO ()
push deque x = error "You need to implement this function."

unshift :: Deque a -> a -> IO ()
unshift deque x = error "You need to implement this function."

shift :: Deque a -> IO (Maybe a)
shift deque = error "You need to implement this function."
