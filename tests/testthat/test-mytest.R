test_that("functions mytest and print.mytest work", {
  expect_error(mytest(pro, c(1, 2)), "input length must be one")
  expect_error(mytest(pro, "foo_overrated"), "input must be an integer in 1:3")
  expect_error(mytest(pro, 4), "input must be an integer in 1:3")
  expect_error(mytest(1 + 1 == "window", 3), "data input must be a data.frame")
  
  for (i in 1:3) {
    expect_identical(length(mytest(pro, i)), 5L)
    expect_s3_class(mytest(pro, i), c("mytest", "list"))
    expect_identical(attributes(mytest(pro, i))$question, i)
    
    for (txt in c("Testing", "Assumption Testing", "Summary of Values", "Decision: ", "Conclusion: "))
    expect_output(print(mytest(pro, i)), txt)
  }
})
