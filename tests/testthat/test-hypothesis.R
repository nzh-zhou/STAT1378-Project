test_that("function hypothesis works", {
  expect_error(hypothesis(pro, c(1, 2)), "input length must be one")
  expect_error(hypothesis(pro, "foo_overrated"), "input must be an integer in 1:3")
  expect_error(hypothesis(pro, 4), "input must be an integer in 1:3")
  expect_error(hypothesis(1 + 1 == "window", 3), "data input must be a data.frame")
  expect_error(hypothesis(pro, 1, c(23, 9)), "argument `output` have length 1")
  expect_error(hypothesis(pro, 2, 42), "argument `output` must be a character vector")
  expect_error(hypothesis(pro, 3, "C++"), 'argument `output` must be either "LaTeX" or "R"')
  
  for (i in 1:3) {
    expect_identical(hypothesis(pro, i), 
                     c("H$_0$: $\\beta = 0$ against H$_1$: $\\beta \\neq 0$",
                       "H$_0$: $\\mu_F - \\mu_M = 0$ against H$_1$: $\\mu_F - \\mu_M \\neq 0$",
                       "H$_0$: variables gender and physical activity are independent against H$_1$: variables gender and physical activity are dependent")[i])
    expect_identical(hypothesis(pro, i, "R"),
                     c("H_0: beta = 0 against H_1: beta != 0",
                       "H_0: mu_F - mu_M = 0 against H_1: mu_F - mu_M != 0",
                       "H_0: variables gender and physical activity are independent against H_1: variables gender and physical activity are dependent")[i])
  }
})
