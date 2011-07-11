### =========================================================================
### LayerHandlers objects
### -------------------------------------------------------------------------
###
### Grouping all of the instance-level R handlers for Layer in one class. 
###

setClassUnion("functionORNULL", c("function", "NULL"))


## These handlers should return TRUE if they have consumed the event

setClass("LayerHandlers",
         representation(## function(layer, painter)
                        paint = "functionORNULL",
                        ## function(layer, key, modifiers)
                        keyPress = "functionORNULL",
                        keyRelease = "functionORNULL",
                        ## function(layer, pos, buttons, modifiers)
                        mouseDoubleClick = "functionORNULL",
                        mouseMove = "functionORNULL",
                        mousePress = "functionORNULL",
                        mouseRelease = "functionORNULL",
### Replaced with mouseMove/Enter/Leave
                        ## hoverMove = "functionORNULL",
                        ## hoverEnter = "functionORNULL",
                        ## hoverLeave = "functionORNULL",
                        mouseEnter = "functionORNULL",
                        mouseLeave = "functionORNULL",
                        ## function(layer, direction, pos, buttons, modifiers)
                        wheel = "functionORNULL",
### Q: Is this really necessary? contextMenu seems pretty high-level
                        ##contextMenu = "functionORNULL",
                        ## function(layer, data, pos, buttons, modifiers)
                        dragEnter = "functionORNULL",
                        dragLeave = "functionORNULL",
                        dragMove = "functionORNULL",
                        drop = "functionORNULL",
                        ## function(layer)
                        focusIn = "functionORNULL",
                        focusOut = "functionORNULL",
                        ## function(layer, size)
                        sizeHint = "functionORNULL" # controlling aspect-ratio
                        ))
