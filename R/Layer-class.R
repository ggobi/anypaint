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
              .geometry = "matrix",
              geometry = function(value) {
                ## the extents in world coordinates
                ## as just a 2x2 matrix?
                #notImplemented("geometry")
                if(!missing(value))
                  .geometry <<- value
                else
                  .geometry
              },
              .geometryBounds = "ANY",
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
              .handlers = "LayerHandlers",
              handlers = function(value)
              {
                if(!missing(value))
                  {
                    .handlers = value
                    sapply(slotNames(.handlers),
                           function(nm)
                           {
                             if(!is.null(slot(value, nm)))
                               print(nm)
                           })
                  }


              },
              #.paint = "function",
              #paint = function(value) {
              #  if(!missing(value))
              #    .paint <<- value
              #  else
              #    .paint
             #}
              #this should be "Layer" but it seems you can't have recursive class definitions like that?
              .parent = "ANY",
              parent = function(value)
              {
                if(!missing(value))
                  {
                    if( class(value) == "Layer"|| is.null(value) )
                      .parent <<- value
                    else
                      stop("parent field must be a Layer object or NULL")
                  }
                else
                  .parent
              }
              ),
            methods = list(
             
              locate = function(region) {
                notImplemented("locate")
              },
              ## factories

## NOTE: the Layer is the factory of the Views, because Layer and
## View are assumed to always come from the same underlying
## implementation. We could do this at the Engine, but this is
## simpler and less error-prone then having a newView(layer, ...).
              newView = function(...) {
                notImplemented("newView")
              },

### Q: What is the best API for constructing new Layers?  We could
### just create the layer with the generator and then add it later.
              
## layer <- Layer$new(handlers, ...)
## parent[1:2,2] <- layer
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
                child$parent = .self
                child
              },
              initialize = function(...) {
                args <- list(...)
                args$handlers <-
                  if (!is.null(args$handlers))
                    args$handlers
                  else new("LayerHandlers")
                handlerArgs <- names(args) %in% slotNames("LayerHandlers")
                argnms = names(args)[handlerArgs]
                for (i in argnms)
                  slot(args$handlers , argnms) = args[[argnms]]
                
                #.self$handlers <- .handlers
                
                #args$handlers <- initialize(.handlers, args[handlerArgs])
                #args <- args[!handlerArgs]
                #csup = callSuper
                #do.call(csup, args)
                callSuper(...)
              },
              paint = function(painter)
              {
                pfun = .self$handlers@paint
                if (is.null(pfun))
                  stop("No paint handler assigned to this layer. Unable to paint.")
                else
                  pfun(painter)
              }
              ), contains = "VIRTUAL")
