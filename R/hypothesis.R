#' Report test hypothesis
#'
#' @param data unnecessary argument used for consistency; must be of class "data.frame"
#' @param question the question number; must be an integer between 1 and 3 inclusive
#' @param output the desired type of output; must be either "LaTeX" or "R"
#'
#' @return a character string with the correct hypothesis
#' @export
#' 
#' @examples 
#' hypothesis(pro, 1, output = "R")
hypothesis <- function(data, question, output = "LaTeX") {
## tests
  if (length(question) != 1) stop("input length must be one")
  if (if (is.numeric(question)) {!(question %in% 1:3)} else {TRUE}) stop("input must be an integer in 1:3")
  if (!is.data.frame(data)) stop("data input must be a data.frame")
  if (length(output) != 1) stop("argument `output` have length 1")
  if (!is.character(output)) stop("argument `output` must be a character vector")
  if (!(output %in% c("LaTeX", "R"))) stop('argument `output` must be either "LaTeX" or "R"')
  
## output
  # LaTeX
  if (output == "LaTeX") {
    c("H$_0$: $\\beta = 0$ against H$_1$: $\\beta \\neq 0$",
      "H$_0$: $\\mu_F - \\mu_M = 0$ against H$_1$: $\\mu_F - \\mu_M \\neq 0$",
      "H$_0$: variables gender and physical activity are independent against H$_1$: variables gender and physical activity are dependent")[question]
    
  # R
  } else {
    c("H_0: beta = 0 against H_1: beta != 0",
      "H_0: mu_F - mu_M = 0 against H_1: mu_F - mu_M != 0",
      "H_0: variables gender and physical activity are independent against H_1: variables gender and physical activity are dependent")[question]
  }
}
