### =========================================================================
### Layer objects
### -------------------------------------------------------------------------
###
### A layer draws itself and listens to events. It can have children
### and control their layout. Each layer has a transform from data
### space to world space, defined by its limits and geometry.
###

### There are three reasonable levels of abstraction for an
### interactive graphics API, from low to high:
### 1) R draws everything from primitives and handles every event
### 2) R composes plots from elements like geoms and imodes
### 3) R creates plots with completely hidden implementation

### From these three choices, we choose the first, because we desire
### maximal flexibility in the types of graphics we can produce.

setRefClass("Layer",
            fields = list(
              geometry = function(value) {
                ## the extents in world coordinates
                ## as just a 2x2 matrix?
                notImplemented("geometry")
              },
              geometryBounds = function(value) {
                notImplemented("geometryBounds")
              },
              limits = function(value) {
                ## the extents in data/layer coordinates
                notImplemented("limits")
              },
              children = function(value) {
                ## a list of child Layers
                notImplemented("children")
              },
              parent = function(value) {
                notImplemented("parent")
              },
              layout = function(value) {
                notImplemented("layout")
              },
              isCached = function(value) {
                notImplemented("isCached")
              },
              isClipped = function(value) {
                notImplemented("isClipped")
              },
              hasFocus = function(value) {
                notImplemented("hasFocus")
              },
              handlers = function(value) {
                notImplemented("handlers")
              }
              ),
            methods = list(
              paint = function(painter) {
                notImplemented("paint")
              },
              locate = function(region) {
                notImplemented("locate")
              },
              ## factories
### Q: do we really want the Layer to be the View factory? They
### seem somewhat ortogonal, but what is the alternative? A separate
### factory, like an Engine, would just have a method that takes the
### Layer as the argument. That is just more complicated. Of course,
### one could provide alternative Engines to allow for different
### views. To some extent, this is possible already by passing
### arguments to newView(). But really, how often are there
### alternative Views? A view is just a widget that contains the
### Layers. The View, Layer and Painter, combined, form the "view" in
### the MVC sense.
              newView = function(...) {
                notImplemented("newView")
              },
### Q: What is the best API for constructing new Layers?  We could
### just create the layer with the generator and then add it later.
              
### layer <- Layer$new(handlers, ...)
### parent[1:2,2] <- layer
### vs:
### parent$newChild(handlers, ..., rows = 1:2, cols = 2)
              
### The first choice would be best if there were multiple types of
### layers, all compatible with each other. The second approach might
### work best though in this case, when the type of child needs to be
### the same as the type of the parent. But the syntax for adding the
### layer is not quite as nice. We could support both.
              newChild = function(..., i = 1, j = 1)
              {
                child <- getRefClass()$new(...)
                .self[i, j] <- child
                child
              },
              initialize = function(...) {
                args <- list(...)
                handlers <-
                  if (!is.null(args$handlers))
                    args$handlers
                  else new("LayerHandlers")
                handlerArgs <- names(args) %in% slotNames("LayerHandlers")
                args$handlers <- initialize(handlers, args[handlerArgs])
                args <- args[!handlerArgs]  
                do.call(callSuper, args)
              }
              ), contains = "VIRTUAL")
