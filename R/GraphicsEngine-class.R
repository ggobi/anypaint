### =========================================================================
### GraphicsEngine objects
### -------------------------------------------------------------------------
###
### Top-level factory representing an anypaint
### implementation. Currently, main purpose is creating a root layer.
###

setRefClass("GraphicsEngine",
            methods = list(
              newLayer = function(...) {
                notImplemented("newLayer")
              }),
            contains = "VIRTUAL")

