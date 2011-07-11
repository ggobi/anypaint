### =========================================================================
### Painter objects
### -------------------------------------------------------------------------
###
### Draws graphical primitives on a device, via a transform
###

setRefClass("Painter",
            fields = list(
              transform = function(value) {
                notImplemented("transform")
              },
              strokeColor = function(value) {
                notImplemented("strokeColor")
              },
              fillColor = function(value) {
                notImplemented("fillColor")
              },
              font = function(value) {
                notImplemented("font")
              },
              lineWidth = function(value) {
                notImplemented("lineWidth")
              },
              dash = function(value) {
                notImplemented("dash")
              },
              glyphExpansion = function(value) {
                notImplemented("glyphExpansion")
              },
              antialias = function(value) {
                notImplemented("antialias")
              },
              fontMetrics = function(value) {
                notImplemented("fontMetrics")
              }
              ),
            methods = list(
              drawLine = function(x, y, stroke = NULL) {
                notImplemented("drawLine")
              },
              drawSegment = function(x0, y0, x1, y1, stroke = NULL) {
                notImplemented("drawSegment")
              },
              drawPoint = function(x, y, stroke = NULL) {
                notImplemented("drawPoint")
              },
              drawRect = function(xleft, ybottom, xright, ytop,
                stroke = NULL, fill = NULL)
              {
                notImplemented("drawRect")
              },
              drawCircle = function(x, y, r, stroke = NULL, fill = NULL) {
                notImplemented("drawCircle")
              },
              drawPolygon = function(x, y, stroke = NULL, fill = NULL) {
                notImplemented("drawPolygon")
              },
              newPath = function() {
                notImplemented("newPath")
              },
              drawPath = function(path, stroke = NULL, fill = NULL) {
                notImplemented("drawPath")
              },
              drawText = function(text, x, y,
                halign = c("center", "left", "right"),
                valign = c("center", "basecenter", "baseline", "bottom", "top"),
                rot = 0, color = NULL, cex = 1.0, hcex = cex, vcex = cex)
              {
                notImplemented("drawText")
              },
              drawImage = function(image, x, y) {
                notImplemented("drawImage")
              },
              drawGlyph = function(glyph, x, y, cex = NULL, stroke = NULL,
                fill = NULL)
              {
                notImplemented("drawGlyph")
              },
              textExtents = function(text) {
                notImplemented("textExtents")
              },
              strWidth = function(text) {
                notImplemented("strWidth")
              },
              strHeight = function(text) {
                notImplemented("strHeight")
              }
              ),
            contains = "VIRTUAL")
