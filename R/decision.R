#' Report test decision
#'
#' @param question the question number; an integer between 1 and 3 inclusive
#' @param data the data input; must be of class "data.frame"
#'
#' @return the decision of the statistical test
#' @export
#' @import stats
decision <- function(question, data) {
  c("H$_0$ is retained at a 5\\% significance level", 
    "H$_0$ is rejected at a 5\\% significance level")[
      (c(summary(lm(data$weight ~ data$height))$coefficients[2, 4],
        t.test(height ~ gender, var.equal = TRUE, data = data)$p.value,
        chisq.test(data$gender, data$phys, correct = FALSE)$p.value)[question]
      < 0.05) + 1]
}
