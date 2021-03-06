module Halogen.SVG.Elements where
-- Like Halogen.HTML.Elements

import Halogen.SVG.Core as Core

import Halogen.HTML.Core (HTML, Prop, ElemName(ElemName))
import Halogen.HTML.Elements (Node, Leaf)
import Halogen.HTML.Properties (IProp)
import Unsafe.Coerce (unsafeCoerce)
import DOM.SVG.Indexed as I

element :: forall r p i. ElemName -> Array (IProp r i) -> Array (HTML p i) -> HTML p i
element = coe Core.element
  where
    coe :: (ElemName -> Array (Prop i) -> Array (HTML p i) -> HTML p i)
        -> ElemName -> Array (IProp r i) -> Array (HTML p i) -> HTML p i
    coe = unsafeCoerce

-- | Nodes

svg :: forall p i. Node I.SVGsvg p i
svg = element (ElemName "svg")

svg_ :: forall w i. Array (HTML w i) -> HTML w i
svg_ = svg []

g :: forall p i. Node I.SVGg p i
g = element (ElemName "g")

g_ :: forall w i. Array (HTML w i) -> HTML w i
g_ = g []

circle :: forall p i. Node I.SVGcircle p i
circle = element (ElemName "circle")

circle_ :: forall w i. Array (HTML w i) -> HTML w i
circle_ = circle []

text :: forall p i. Node I.SVGtext p i
text = element (ElemName "text")

text_ :: forall w i. Array (HTML w i) -> HTML w i
text_ = text []

foreignObject :: forall p i . Node I.SVGforeignObject p i
foreignObject = element (ElemName "foreignObject")

foreignObject_ :: forall w i. Array (HTML w i) -> HTML w i
foreignObject_ = foreignObject []

marker :: forall p i. Node I.SVGmarker p i
marker = element (ElemName "marker")

marker_ :: forall w i. Array (HTML w i) -> HTML w i
marker_ = marker []

defs :: forall p i. Node I.SVGdefs p i
defs = element (ElemName "defs")

defs_ :: forall p i. Array (HTML p i) -> HTML p i
defs_ = defs []

-- | Leafs

ellipse :: forall p i. Leaf I.SVGellipse p i
ellipse props = element (ElemName "ellipse") props []

rect :: forall p i. Leaf I.SVGrect p i
rect props = element (ElemName "rect") props []

path :: forall p i. Leaf I.SVGpath p i
path props = element (ElemName "path") props []

line :: forall p i. Leaf I.SVGline p i
line props = element (ElemName "line") props []
