#' Report test conclusion
#'
#' @param question the question number; an integer between 1 and 3 inclusive
#' @param data the data input; must be of class "data.frame"
#'
#' @return the conclusion of the statistical test
#' @export
#' @import stats
conclusion <- function(question, data) {
  decision <- (c(summary(lm(data$weight ~ data$height))$coefficients[2, 4],
                 t.test(height ~ gender, var.equal = TRUE, data = data)$p.value,
                 chisq.test(data$gender, data$phys, correct = FALSE)$p.value)[question]
               < 0.05) + 1
  statement <- c(c("there is no linear relationship between height and weight", 
                   "there is a linear relationship between height and weight")[decision],
                 c("the mean height of males and females is the same",
                   "the mean height of males and females is different")[decision],
                 c("gender and physical activity are independent",
                   "gender and physical activity are dependent")[decision])[question]
  paste0("there is ", c("insufficient", "sufficient")[decision], 
         " evidence to reject the null hypothesis in favor of the alternative and conclude that ",
         statement)
}
