module Wrench.Picture where

import Data.Monoid
import Wrench.Point
import Wrench.SpriteIdentifier
import Wrench.RenderPositionMode
import Wrench.Color
import Wrench.Angular
import qualified Data.Text as T
import ClassyPrelude

data Picture = Line Point Point
             | Text T.Text
             | Sprite SpriteIdentifier RenderPositionMode
             | Blank
             | InColor Color Picture
             | Translate Point Picture
             | Rotate Radians Picture
             | Scale Point Picture
             | Pictures [Picture]
             deriving(Show,Eq)

instance Monoid Picture where
  mempty = Blank
  mappend a b = Pictures [a,b]
