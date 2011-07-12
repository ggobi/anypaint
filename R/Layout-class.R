### =========================================================================
### Layout objects
### -------------------------------------------------------------------------
###
### Abstraction of a grid layout of Layers. Layout is a tricky thing
### to get right, but we try to support both absolute and
### proportional policies for the rows and columns.
###

### An alternative approach would be to not have a Layout but instead
### set geometry bounds on the Layer and have everything
### auto-computed. We support both.

setRefClass("Layout",
            fields = list(
              maxColumnWidth = function(value) {
                notImplemented("maxColumnWidth")
              },
              minColumnWidth = function(value) {
                notImplemented("minColumnWidth")
              },
              preferredColumnWidth = function(value) {
                notImplemented("preferredColumnWidth")
              },
              maxRowHeight = function(value) {
                notImplemented("maxRowHeight")
              },
              minRowHeight = function(value) {
                notImplemented("minRowHeight")
              },
              preferredRowHeight = function(value) {
                notImplemented("preferredRowHeight")
              },
              columnProportion = function(value) {
                notImplemented("columnProportion")
              },
              rowProportion = function(value) {
                notImplemented("rowProportion")
              },
              columnSpacing = function(value) {
                notImplemented("columnSpacing")
              },
              rowSpacing = function(value) {
                notImplemented("rowSpacing")
              }),
            contains = "VIRTUAL")

setMethod("dim", "Layout",
          function(x) c(length(x$maxRowWidth), length(x$maxColumnWidth)))
