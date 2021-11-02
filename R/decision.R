#' Report test decision
#'
#' @param data the data input; must be of class "data.frame"
#' @param question the question number; must be an integer between 1 and 3 inclusive
#' @param output the desired type of output; must be either "LaTeX" or "R"
#'
#' @return the decision of the statistical test
#' @export
#' @import stats
#' 
#' @examples 
#' decision(proj, 1, output = "R")
decision <- function(data, question, output = "LaTeX") {
## tests
  if (length(question) != 1) stop("input length must be one")
  if (if (is.numeric(question)) {!(question %in% 1:3)} else {TRUE}) stop("input must be an integer in 1:3")
  if (!is.data.frame(data)) stop("data input must be a data.frame")
  if (length(output) != 1) stop("argument `output` have length 1")
  if (!is.character(output)) stop("argument `output` must be a character vector")
  if (!(output %in% c("LaTeX", "R"))) stop('argument `output` must be either "LaTeX" or "R"')
  
## subset number
  subs <- (c(summary(lm(data$weight ~ data$height))$coefficients[2, 4],
             t.test(height ~ gender, var.equal = TRUE, data = data)$p.value,
             chisq.test(data$gender, data$phys, correct = FALSE)$p.value)[question] < 0.05) + 1
  
## output
  # LaTeX
  if (output == "LaTeX") {
    c("H$_0$ is retained at a 5\\% significance level", 
      "H$_0$ is rejected at a 5\\% significance level")[subs]
    
  # R
  } else {
    c("H_0 is retained at a 5% significance level", 
      "H_0 is rejected at a 5% significance level")[subs]
  }
}
