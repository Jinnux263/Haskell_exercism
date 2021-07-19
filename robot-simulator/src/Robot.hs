module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = RB Bearing (Integer, Integer)

bearing :: Robot -> Bearing
bearing (RB direction _) = direction

coordinates :: Robot -> (Integer, Integer)
coordinates (RB _ coord) = coord

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coord = RB direction coord

move :: Robot -> String -> Robot
move robot [] = robot
move robot (x:xs) = move (exec x robot) xs

exec :: Char -> Robot -> Robot
exec 'R' robot = RB b c
    where
        b = case (bearing robot) of 
            North -> East
            East -> South
            South -> West
            West -> North
        c = coordinates robot
exec 'L' robot = RB b c
    where
        b = case (bearing robot) of 
            North -> West
            East -> North
            South -> East
            West -> South
        c = coordinates robot
exec 'A' (RB direction (x,y)) = RB direction coord
    where
        coord = case direction of 
            North -> (x,y + 1)
            East -> (x + 1,y)
            South -> (x,y - 1)
            West -> (x - 1,y)
exec _  _= error "Not implement!!!"

