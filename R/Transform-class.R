### =========================================================================
### Transform objects
### -------------------------------------------------------------------------
###
### Formal representation of a transformation matrix. Supports
### translation, scaling and rotation.
###

setRefClass("Transform", fields = list(m = "matrix"),
            methods = list(
              initialize = function(m = matrix(c(1, 0, 0, 0, 1, 0), ncol = 2),
                ...)
              {
                callSuper(m, ...)
              },
              scale = function(s = c(x, y), x = 1, y = 1) {
                s <- rep(s, length = 2)
                m * matrix(c(rep(s, each = 2), 1, 1), ncol = 3, byrow=TRUE)
              },
              translate = function(t = c(x, y), x = 0, y = 0) {
                s <- rep(t, length = 2)
                m + matrix(c(rep(0, 4), colSums(t * m[1:2,])), ncol = 3,
                           byrow=TRUE)
              },
              rotate = function(r = 0) {
                cs <- c(cos(r), sin(r))
                smat <- m[1:2,]
                matrix(c(colSums(cs * smat), colSums(c(-cs[2], cs[1]) * smat),
                         m[3,]),
                       ncol = 3, byrow=TRUE)
              }
              ))

setAs("Transform", "matrix", function(from) from$m)
