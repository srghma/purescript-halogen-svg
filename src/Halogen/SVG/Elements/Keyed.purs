module Halogen.SVG.Elements.Keyed where

import Halogen.SVG.Core as Core

import Data.Tuple (Tuple)
import Halogen.HTML.Core (HTML, Prop, ElemName(ElemName))
import Halogen.HTML.Properties (IProp)
import Unsafe.Coerce (unsafeCoerce)
import DOM.SVG.Indexed as I

-- Not exported by Halogen.HTML.Elements.Keyed
type KeyedNode r w i
   = Array (IProp r i)
     -> Array (Tuple String (HTML w i))
     -> HTML w i

keyedElement :: forall r p i. ElemName -> Array (IProp r i) -> Array (Tuple String (HTML p i)) -> HTML p i
keyedElement = coe Core.keyedElement
  where
    coe :: (ElemName -> Array (Prop i) -> Array (Tuple String (HTML p i)) -> HTML p i)
        -> ElemName -> Array (IProp r i) -> Array (Tuple String (HTML p i)) -> HTML p i
    coe = unsafeCoerce

-- | Nodes

svg :: forall p i. KeyedNode I.SVGsvg p i
svg = keyedElement (ElemName "svg")

g :: forall p i. KeyedNode I.SVGg p i
g = keyedElement (ElemName "g")

circle :: forall p i. KeyedNode I.SVGcircle p i
circle = keyedElement (ElemName "circle")

text :: forall p i. KeyedNode I.SVGtext p i
text = keyedElement (ElemName "text")

foreignObject :: forall p i . KeyedNode I.SVGforeignObject p i
foreignObject = keyedElement (ElemName "foreignObject")

marker :: forall p i. KeyedNode I.SVGmarker p i
marker = keyedElement (ElemName "marker")

defs :: forall p i. KeyedNode I.SVGdefs p i
defs = keyedElement (ElemName "defs")
