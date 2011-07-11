### =========================================================================
### Font objects
### -------------------------------------------------------------------------
###

setRefClass("Font",
            fields = list(
              family = function(value) {
              },
              pointsize = function(value) {
              },
              weight = function(value) {
              },
              italic = function(value) {
              }
              ),
            contains = "VIRTUAL")
