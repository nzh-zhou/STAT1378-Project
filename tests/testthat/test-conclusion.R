test_that("function conclusion works", {
  expect_error(conclusion(pro, c(1, 2)), "input length must be one")
  expect_error(conclusion(pro, "foo_overrated"), "input must be an integer in 1:3")
  expect_error(conclusion(pro, 4), "input must be an integer in 1:3")
  expect_error(conclusion(1 + 1 == "window", 3), "data input must be a data.frame")
  expect_error(conclusion(pro, 1, c(23, 9)), "argument `output` have length 1")
  expect_error(conclusion(pro, 2, 42), "argument `output` must be a character vector")
  expect_error(conclusion(pro, 3, "C++"), 'argument `output` must be either "LaTeX" or "R"')
  
  for (i in 1:3) {
  expect_output(print(conclusion(pro, i)), "there is ")
  expect_output(print(conclusion(pro, i)), " evidence to reject the null hypothesis in favor of the alternative, and we conclude that ")
  expect_output(print(conclusion(pro, i, "R")), "there is ")
  expect_output(print(conclusion(pro, i, "R")), " evidence to reject the null hypothesis in favor of the alternative, and we conclude that ")
  }
})
