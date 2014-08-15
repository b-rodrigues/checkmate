#' Check if an argument is a count
#'
#' A count is a non-negative integerish value.
#'
#' @templateVar fn Count
#' @template na-handling
#' @template checker
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @param positive [\code{logical(1)}]\cr
#'  Must \code{x} be positive (>= 1)?
#'  Default is \code{FALSE}, allowing 0.
#' @template tol
#' @family scalars
#' @useDynLib checkmate c_check_count
#' @export
#' @examples
#' testCount(1)
#' testCount(-1)
checkCount = function(x, na.ok = FALSE, positive = FALSE, tol = sqrt(.Machine$double.eps)) {
  .Call("c_check_count", x, na.ok, positive, tol, PACKAGE = "checkmate")
}

#' @rdname checkCount
#' @export
assertCount = function(x, na.ok = FALSE, positive = FALSE, tol = sqrt(.Machine$double.eps), .var.name) {
  res = .Call("c_check_count", x, na.ok, positive, tol, PACKAGE = "checkmate")
  makeAssertion(res, vname(x, .var.name))
}

#' @rdname checkCount
#' @export
testCount = function(x, na.ok = FALSE, positive = FALSE, tol = sqrt(.Machine$double.eps)) {
  isTRUE(.Call("c_check_count", x, na.ok, positive, tol, PACKAGE = "checkmate"))
}
