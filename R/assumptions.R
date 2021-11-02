#' Test Assumptions
#'
#' @param question the question number; an integer between 1 and 3 inclusive
#' @param data the data input; must be of class "data.frame"
#'
#' @return the correct plots or graph to test assumptions
#' @export
#' @import ggplot2
#' @import stats
#' @import patchwork
assumptions <- function(question, data) {
  if (length(question) != 1) stop("question input length must be one")
  if (!(question %in% 1:3)) stop("question input must be an integer in 1:3")
  if (!is.data.frame(data)) stop("data input must be a data.frame")
  if (question == 1) {
    lm1 <- lm(data$weight ~ data$height)
    #y vs. x
    ((ggplot(data, aes(height, weight)) + geom_point(size = 0.5) + 
      geom_smooth(method = lm, formula = y ~ x) + ggtitle("Weight vs. Height") +
      theme_bw(base_size = 12)) +
    #e_i vs y_hat
      (ggplot(data.frame(x = lm1$fitted.values, y = lm1$residuals), 
             aes(x, y)) + geom_point(size = 0.5) + 
        geom_smooth(method = lm, se = FALSE, formula = y ~ x) + 
        labs(title = "Regression Residuals vs. \nFitted Values", 
             x = "fitted values", y = "residuals") +
         theme_bw(base_size = 12))) /
      #histogram of e_i
      (ggplot(data.frame(x = lm1$residuals), aes(x)) +
        geom_histogram(bins = 30) + 
        labs(title = "Histogram of Regression Residuals", 
             x = "residual bins") + 
        theme_bw(base_size = 12))
  } else if (question == 2) {
    # Normal QQ Plots of Height for different Genders
    (ggplot(data, aes(sample = height, colour = gender)) +
      geom_qq(size = 0.5) + geom_qq_line() + 
      labs(title = "Normal QQ Plots for Height for different Genders",
           x = "normal value", y = "height") +
      theme_bw(base_size = 12)) /
    # Gender vs. Height
      (ggplot(data) + geom_boxplot(aes(x = gender, y = height)) + coord_flip() + 
        ggtitle("Gender vs. Height") +
        theme_bw(base_size = 12))
  } else {
    # Expected value contingency table
    q3a <- chisq.test(data$gender, data$phys)$expected
    names(attributes(q3a)$dimnames) <- NULL
    q3a <- q3a[, c(3, 2, 1)]
    q3a
  }
}
