## code to prepare `proj` dataset goes here

proj <- read.csv("data-raw/project.csv")

usethis::use_data(proj, overwrite = TRUE)
