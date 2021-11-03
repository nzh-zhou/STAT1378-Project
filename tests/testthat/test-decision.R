test_that("function decision works", {
  expect_error(decision(pro, c(1, 2)), "input length must be one")
  expect_error(decision(pro, "foo_overrated"), "input must be an integer in 1:3")
  expect_error(decision(pro, 4), "input must be an integer in 1:3")
  expect_error(decision(1 + 1 == "window", 3), "data input must be a data.frame")
  expect_error(decision(pro, 1, c(23, 9)), "argument `output` have length 1")
  expect_error(decision(pro, 2, 42), "argument `output` must be a character vector")
  expect_error(decision(pro, 3, "C++"), 'argument `output` must be either "LaTeX" or "R"')
  
  for (i in 1:3) {
    expect_identical(decision(pro, i) %in% 
                       c("H$_0$ is retained at a 5\\% significance level", 
                         "H$_0$ is rejected at a 5\\% significance level"), TRUE)
    expect_identical(decision(pro, i, "R") %in% 
                       c("H_0 is retained at a 5% significance level", 
                         "H_0 is rejected at a 5% significance level"), TRUE)
  }
})
