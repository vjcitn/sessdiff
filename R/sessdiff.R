#' use sessioninfo package to identify differences between session configurations
#' @import sessioninfo
#' @param x instance of session_info from sessioninfo package
#' @param y instance of session_info from sessioninfo package
#' @param \dots not used.  Could be passed to `session_info` but then there
#' would need to be code to extract information on, e.g., external components.
#' This enhancement should be done but probably not in this function.
#' @examples
#' if (requireNamespace("sessioninfo")) {
#'   si = sessioninfo::session_info()
#'   print(sessdiff( si, si ))
#'   if (requireNamespace("parody")) { # unlikely to be loaded in any session
#'     si2 = sessioninfo::session_info()
#'     sessdiff(si, si2)
#'     }
#'   }
#' @export    
sessdiff = function(x,y,...) {
 stopifnot(inherits(x, "session_info"))
 stopifnot(inherits(y, "session_info"))
 thediff = sessioninfo::session_diff(x,y) #complicated
#
# gather names and versions
#
 xp = thediff$old$si$packages$package
 xv = thediff$old$si$packages$loadedversion
 yp = thediff$new$si$packages$package
 yv = thediff$new$si$packages$loadedversion
#
# combine ... could use attribute or a new class for a versioned package
#
 xp = paste(xp,xv)
 yp = paste(yp,yv)
#
# find differences
#
 xonly = setdiff(xp,yp)
 yonly = setdiff(yp,xp)
 list(xonly=xonly, yonly=yonly)
}

