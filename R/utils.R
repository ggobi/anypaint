notImplemented <- function(name) {
  eval(substitute({
    stop("'", .refClassDef@className, "::", name, "' is not implemented",
         call. = FALSE)
  }, list(name = name)), parent.frame())
}

readOnly <- function(name) {
  eval(substitute({
    if (!missing(value)) {
      stop("'", .refClassDef@className, "::", name, "' is read only",
           call. = FALSE)
    }
  }, list(name = name)), parent.frame())
}
