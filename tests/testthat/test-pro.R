test_that("data set pro works", {
  expect_identical(colnames(pro), c("ID", "gender", "height", "weight", "phys"))
})
