### =========================================================================
### View objects
### -------------------------------------------------------------------------
###
### A (possibly transformed) view of a Layer. A separate layer can
### provide an overlay that is constant across transformations. If a
### layer is too large to display in the viewport, the View should
### support scrolling. If the viewport is resizable, the View should
### offer some way to control its reaction to resizing.
###

### A View is a widget and so needs to be integrated with a toolkit
### interface. Implementations should provide for coercion to the
### underlying widget, which could then be used as usual.

setRefClass("View",
            fields = list(
              layer = function(value) {
                notImplemented("layer")
              },
              overlay = function(value) {
                notImplemented("overlay")
              },
              transform = function(value) {
                notImplemented("transform")
              },
              rescaleMode = function(value) {
                notImplemented("rescaleMode")
              },
              viewportRect = function(value) {
                notImplemented("viewportRect")
              },
              declareSignal(viewportRectChanged()),
              hasScrollBars = function(value) {
                notImplemented("hasScrollBars")
              }
              ),
            contains = "VIRTUAL")

