module ComplexNumbers
(Complex,
 conjugate,
 abs,
 exp,
 real,
 imaginary,
 mul,
 add,
 sub,
 div,
 complex) where

import Prelude hiding (div, abs, exp)
import qualified Prelude as P

-- Data definition -------------------------------------------------------------
data Complex a = Data a a deriving(Eq, Show)

complex :: (a, a) -> Complex a
complex (a,b) = Data a b

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate (Data a b) = Data a (-b)

abs :: Floating a => Complex a -> a
abs (Data a b) = sqrt (a*a + b*b)

real :: Num a => Complex a -> a
real (Data a _) = a

imaginary :: Num a => Complex a -> a
imaginary (Data _ a) = a

exp :: Floating a => Complex a -> Complex a
exp (Data r i) = Data (P.exp r*cos i) (P.exp r*sin i)

-- binary operators ------------------------------------------------------------
mul :: Num a => Complex a -> Complex a -> Complex a
mul (Data a b) (Data c d) = Data (a * c - b * d)  (b * c + a * d)

add :: Num a => Complex a -> Complex a -> Complex a
add (Data a b) (Data c d)= Data (a + c) (b + d)

sub :: Num a => Complex a -> Complex a -> Complex a
sub (Data a b) (Data c d)= Data (a - c) (b - d)

div :: Fractional a => Complex a -> Complex a -> Complex a
div (Data a b) (Data c d) = Data ((a * c + b * d)/(c*c + d*d))  ((b * c - a * d)/(c*c + d*d))
