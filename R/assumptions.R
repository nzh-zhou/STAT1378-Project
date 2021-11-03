#' Test Assumptions
#'
#' @param data the data input; must be of class "data.frame"
#' @param question the question number; must be an integer between 1 and 3 inclusive
#' @param output unnecessary argument used for consistency; must be either "LaTeX" or "R"
#'
#' @return the correct plots or graph to test assumptions
#' @export
#' @import ggplot2
#' @import stats
#' @import patchwork
#' 
#' @examples 
#' assumptions(pro, 1, output = "R")
assumptions <- function(data, question, output = "LaTeX") {
## tests
  if (length(question) != 1) stop("input length must be one")
  if (if (is.numeric(question)) {!(question %in% 1:3)} else {TRUE}) stop("input must be an integer in 1:3")
  if (!is.data.frame(data)) stop("data input must be a data.frame")
  if (length(output) != 1) stop("argument `output` have length 1")
  if (!is.character(output)) stop("argument `output` must be a character vector")
  if (!(output %in% c("LaTeX", "R"))) stop('argument `output` must be either "LaTeX" or "R"')
  
## output
  # question 1
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
    
  # question 2
  } else if (question == 2) {
    # normal QQ plots of height for different genders
    (ggplot(data, aes(sample = height, colour = gender)) +
      geom_qq(size = 0.5) + geom_qq_line() + 
      labs(title = "Normal QQ Plots for Height for different Genders",
           x = "normal value", y = "height") +
      theme_bw(base_size = 12)) /
    # gender vs. height
      (ggplot(data) + geom_boxplot(aes(x = gender, y = height)) + coord_flip() + 
        ggtitle("Gender vs. Height") +
        theme_bw(base_size = 12))
    
  # question 3
  } else {
    # expected value contingency table
    q3a <- chisq.test(data$gender, data$phys)$expected
    names(attributes(q3a)$dimnames) <- NULL
    q3a <- q3a[, c(3, 2, 1)]
    q3a
  }
}
