testVector = function(x, na.ok = TRUE, len, min.len, max.len) {
  if (!missing(len) && assertCount(len) && length(x) != len)
    return(sprintf("'%%s' must have length %i", len))
  if (!missing(min.len) && assertCount(min.len) && length(x) < min.len)
    return(sprintf("'%%s' must have length >= %i", min.len))
  if (!missing(max.len) && assertCount(max.len) && length(x) > max.len)
    return(sprintf("'%%s' must have length <= %i", max.len))
  if (assertFlag(na.ok) && !na.ok && anyMissing(x))
    return("'%s' contains missing values")
  return(TRUE)
}

#' Checks vector properties
#'
#' @param x [\code{ANY}]\cr
#'  Vector to check.
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{TRUE}.
#' @param len [\code{integer(1)}]\cr
#'  Exact expected length of \code{x}.
#' @param min.len [\code{integer(1)}]\cr
#'  Minimal length of \code{x}.
#' @param max.len [\code{integer(1)}]\cr
#'  Maximal length of \code{x}.
#' @return [\code{logical(1)}] Returns \code{TRUE} on success.
#'  Throws an exception on failure for assertion.
#' @export
checkVector = function(x, na.ok = TRUE, len, min.len, max.len) {
  isTRUE(testVector(x, na.ok, len, min.len, max.len))
}

#' @rdname checkVector
#' @export
assertVector = function(x, na.ok = TRUE, len, min.len, max.len) {
  amsg(testVector(x, na.ok, len, min.len, max.len), dps(x))
}