### =========================================================================
### Event objects
### -------------------------------------------------------------------------
###

## Each handler should receive a single event object. This simplifies
## the API and keeps it more stable. Since each event is an interface
## that can be implemented against a low-level event, it also becomes
## possible to conditionally leverage additional functionality in a
## certain toolkit. Is there really that much underlying functionality
## in an event though? There is a lot overhead to creating these
## reference class objects -- do we really want something so heavy?
## For example, GTK+ just uses simple structs for events -- could we
## just use a simple list?

## An alternative would be to force the user to follow a particular
## signature in the event handler, down to the argument names. This is
## not unreasonable, since the code will depend on the list fields
## anyway. The code that invokes the handler would only send arguments
## named in the signature, so that '...' is not necessary. This does
## make it more difficult to pass events around, but is there a
## use-case? Taking event parameters as arguments is convenient for
## simple handlers and consistent with getGraphicsEvent().

## setRefClass("Event", contains = "VIRTUAL")

## setRefClass("KeyEvent",
##             fields = list(
##               key = function(value) {
##                 notImplemented("key")
##               },
##               modifiers = function(value) {
##                 notImplemented("modifiers")
##               }),
##             contains = c("Event", "VIRTUAL"))

## setRefClass("MouseEvent",
##             fields = list(
##               pos = function(value) {
##                 notImplemented("pos")
##               },
##               button = function(value) {
##                 notImplemented("button")
##               },
##               modifiers = function(value) {
##                 notImplemented("modifiers")
##               }),
##             contains = c("Event", "VIRTUAL"))

## setRefClass("WheelEvent",
##             fields = list(
##               direction = function(value) {
##                 ## up/down/left/right like GdkEventScroll
##                 notImplemented("direction")
##               }
##               ),
##             contains = c("MouseEvent", "VIRTUAL"))

## setRefClass("DragAndDropEvent",
##             fields = list(
##               data = function(value) {
##                 notImplemented("data")
##               }),
##             contains = c("MouseEvent", "VIRTUAL"))
