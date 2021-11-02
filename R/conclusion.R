#' Report test conclusion
#'
#' @param data the data input; must be of class "data.frame"
#' @param question the question number; must be an integer between 1 and 3 inclusive
#' @param output unnecessary argument used for consistency; must be either "LaTeX" or "R"
#'
#' @return the conclusion of the statistical test
#' @export
#' @import stats
#' 
#' @examples 
#' conclusion(proj, 1, output = "R")
conclusion <- function(data, question, output = "LaTeX") {
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
  
  statement <- c(c("there is no linear relationship between height and weight", 
                   "there is a linear relationship between height and weight")[subs],
                 c("the mean height of males and females is the same",
                   "the mean height of males and females is different")[subs],
                 c("gender and physical activity are independent",
                   "gender and physical activity are dependent")[subs])[question]
  
## output
  paste0("there is ", c("insufficient", "sufficient")[subs], 
         " evidence to reject the null hypothesis in favor of the alternative, and we conclude that ",
         statement)
}
