#' Conduct a complete statistical test
#'
#' @param data the data input; must be of class "data.frame"
#' @param question the question number; must be an integer between 1 and 3 inclusive
#'
#' @return a complete statistical test
#' @export
#'
#' @examples
#' mytest(pro, 1)
mytest <- function(data, question) {
  x <- list(
    hypothesis = hypothesis(data, question, output = "R"),
    assumptions = assumptions(data, question, output = "R"),
    fit = fit(data, question, output = "R"),
    decision = decision(data, question, output = "R"),
    conclusion = conclusion(data, question, output = "R")
  )
  class(x) <- c("mytest", "list")
  attr(x, "question") <- question
  x
}
