#' print.mytest
#'
#' @param x an object of class "mytest"
#' @param ... further arguments passed to or from other methods
#'
#' @return a nicely formatted print
#' @export
#' 
#' @examples 
#' print(mytest(pro, 1))
print.mytest <- function(x, ...) {
## tests
  if (length(attributes(x)$question) != 1) stop("did you hit your head on a wall?")
  if (!is.numeric(attributes(x)$question)) stop("Thomas will curse you with longer assignments")
  if (!(attributes(x)$question %in% 1:3)) stop("Lyndal will curse you with acne breakouts")
  
## output
  cat("Testing ", x$hypothesis, " at a 5% significance level\n\n", "Assumption Testing", "\n", sep = "")
  print(x$assumptions)
  cat("\n", "Summary of Values", "\n", sep = "")
  print(as.data.frame(x$fit))
  cat("\nDecision: ", x$decision, "\n\n", "Conclusion: ", x$conclusion, sep = "")
  invisible(x)
}
