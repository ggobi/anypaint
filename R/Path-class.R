### =========================================================================
### Path objects
### -------------------------------------------------------------------------
###
### Vector paths
###

setRefClass("Path",
            methods = list(
              lineTo = function( ) {
                notImplemented("lineTo")
              },
              arcTo = function ( ) {
                notImplemented("arcTo")
              },
              moveTo = function ( ) {
                notImplemented("moveTo")
              },
              text = function ( ) {
                notImplemented("text")
              },
              ## convenience glyph factories
              ## could implement against above, but usually easier with backend
              circleGlyph = function(r = 5) {
                notImplemented("circleGlyph")
              },
              squareGlyph = function(x = 5) {
                notImplemented("squareGlyph")
              },
              triangleGlyph = function(x = 5, direction = c("up", "down")) {
                notImplemented("triangleGlyph")
              },
              textGlyph = function(text = "X", size = 12) {
                notImplemented("textGlyph")
              },
              segmentGlyph = function(x = 5, b = 0) {
                notImplemented("segmentGlyph")
              }
              ), contains = "VIRTUAL")
