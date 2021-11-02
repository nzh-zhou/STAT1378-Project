mytest <- function(question, data) {
  x <- list(
    hypothesis = hypothesis(question),
    assumptions = assumptions(question, data),
    fit = fit(question, data),
    decision = decision(question, data),
    conclusion = conclusion(question, data)
  )
  class(x) <- c("mytest", "list")
  x
}
