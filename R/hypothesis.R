#' Hypothesis
#'
#' @param question the question number; an integer between 1 and 3 inclusive
#'
#' @return a character string with the correct hypothesis for LaTeX to read
#' @export
hypothesis <- function(question) {
  if (length(question) != 1) stop("input length must be one")
  if (!(question %in% 1:3)) stop("input must be an integer in 1:3")
  c("H$_0$: $\\beta = 0$ against H$_1$: $\\beta \\neq 0$",
    "H$_0$: $\\mu_F - \\mu_M = 0$ against H$_1$: $\\mu_F - \\mu_M \\neq 0$",
    "H$_0$: variables gender and physical activity are independent against H$_1$: variables gender and physical activity are dependent")[question]
}
