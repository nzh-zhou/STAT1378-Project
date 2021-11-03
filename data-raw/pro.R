## code to prepare `pro` dataset goes here

pro <- read.csv("data-raw/project.csv")

usethis::use_data(pro, overwrite = TRUE)
