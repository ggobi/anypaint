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

availableGraphicsEngines <- function() {
  names(getClass("GraphicsEnginer")@subclasses)
}

defaultGraphicsEngine <- function() {
  ## check options()
  ## if no option set, use first available, if any
  ## if none available, return NULL
}
