#' Report test summary
#'
#' @param question the question number; an integer between 1 and 3 inclusive
#' @param data the data input; must be of class "data.frame"
#'
#' @return important values for the statistical test to answer the question
#' @export
#' @importFrom glue glue
#' @import stats
#' @importFrom tibble tribble
fit <- function(question, data) {
  if (length(question) != 1) stop("question input length must be one")
  if (!(question %in% 1:3)) stop("question input must be an integer in 1:3")
  if (!is.data.frame(data)) stop("data input must be a data.frame")
  
  # Test summary
  if (question == 1){
    q1 <- lm(data$weight ~ data$height)
    sq1 <- summary(q1)
    # Question 1
    tribble(
      ~ summary, ~value,
      "$\\hat\\beta$", glue(signif(sq1$coefficients[2, 1], 2)),
      "95\\% confidence interval for $\\beta$", glue("[{signif(confint(q1)[2, 1], 2)}, {signif(confint(q1)[2, 2], 2)}]"),
      "t-value", glue(signif(sq1$coefficients[2, 3], 3)),
      "degrees of freedom", glue(sq1$df[2]),
      "p-value", glue(signif(sq1$coefficients[2, 4], 2))
    )
  } else if (question == 2) {
    q2 <- t.test(height ~ gender, var.equal = TRUE, data = data)
    # Question 2
    tribble(
      ~ summary, ~value,
      "$\\tau_{obs}$", glue(signif(q2$statistic[['t']], 3)),
      "95\\% confidence interval for $\\mu_F - \\mu_M$", glue("[{signif(q2$conf.int[1], 3)}, {signif(q2$conf.int[2], 3)}]"),
      "degrees of freedom", glue(q2$parameter[['df']]),
      "p-value", glue(signif(q2$p.value, 2))
    )
  } else {
    q3 <- chisq.test(data$gender, data$phys, correct = FALSE)
    # Question 3
    tribble(
      ~ summary, ~value,
      "$X^2$", glue(signif(q3$statistic[["X-squared"]], 3)),
      "degrees of freedom", glue(q3$parameter[['df']]),
      "p-value", glue(signif(q3$p.value, 2))
    )
  }
}
