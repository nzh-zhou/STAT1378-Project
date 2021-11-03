test_that("function fit works", {
  expect_error(fit(pro, c(1, 2)), "input length must be one")
  expect_error(fit(pro, "foo_overrated"), "input must be an integer in 1:3")
  expect_error(fit(pro, 4), "input must be an integer in 1:3")
  expect_error(fit(1 + 1 == "window", 3), "data input must be a data.frame")
  expect_error(fit(pro, 1, c(23, 9)), "argument `output` have length 1")
  expect_error(fit(pro, 2, 42), "argument `output` must be a character vector")
  expect_error(fit(pro, 3, "C++"), 'argument `output` must be either "LaTeX" or "R"')
  
  for (i in 1:3) {
    expect_s3_class(fit(pro, i), c("tbl_df", "tbl", "data.frame"))
    expect_s3_class(fit(pro, i, "R"), c("tbl_df", "tbl", "data.frame"))
  }
})
