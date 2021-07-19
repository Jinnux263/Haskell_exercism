module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data  LinkedList a = Dummy | Node a (LinkedList a) deriving (Eq, Show)

datum ::  LinkedList a -> a
datum (Node a _) = a
datum _ = error "Not supported"

fromList ::  [a] -> LinkedList a
fromList [] = Dummy
fromList [x] = Node x Dummy
fromList (x:xs) = (Node x) (fromList xs)

isNil ::  LinkedList a -> Bool
isNil Dummy = True
isNil _ = False

new ::  a -> LinkedList a -> LinkedList a
new x linkedList = Node x linkedList

next ::  LinkedList a -> LinkedList a
next Dummy = Dummy
next (Node _ linkedList) = linkedList


nil ::  LinkedList a
nil = Dummy

reverseLinkedList ::  LinkedList a -> LinkedList a
reverseLinkedList linkedList = fromList (reverseList (toList linkedList))

toList ::  LinkedList a -> [a]
toList Dummy = []
toList (Node a linkedList) = a : toList linkedList

reverseList ::  [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]
