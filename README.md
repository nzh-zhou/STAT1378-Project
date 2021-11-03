
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Conduct a Statistical Test on the Human Population

<!-- badges: start -->

[![R-CMD-check](https://github.com/MQ-STAT1378/project-nzh-zhou/workflows/R-CMD-check/badge.svg)](https://github.com/MQ-STAT1378/project-nzh-zhou/actions)
<!-- badges: end -->

This package contains a set of functions to test one of three questions
about the human population. Read section 1 of the following document for
more information about the three questions.

``` r
file.edit('vignettes/articles/report.Rmd')
```

## Installation

You can install this package via github. Run the following command.

``` r
# install.packages("devtools")
devtools::install_github("https://github.com/MQ-STAT1378/project-nzh-zhou", 
                         auth_token = "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")
```

## Functions and Data

This package contains the data set, `pro`, which can be used as an
example for the functions included in this package.

There are 5 helper functions, wherein each one outputs part of the
statistical test for a specific question, and they all take the same
three inputs.

-   `data`: the data input; must be of class “data.frame”
-   `question`: the question number; must be an integer between 1 and 3
    inclusive
-   `output`: the desired type of output; must be either “LaTeX” or “R”

The wrapper function, `mytest`, outputs the whole statistical test for a
specific question in R format, but only takes in inputs `data` and
`question`.

## Examples

``` r
hypothesis(pro, 1, "R")
#> [1] "H_0: beta = 0 against H_1: beta != 0"
assumptions(pro, 1, "R")
```

<img src="man/figures/README-examples-1.png" width="100%" />

``` r
fit(pro, 1, "R")
#> # A tibble: 5 × 2
#>   summary                          value      
#>   <chr>                            <glue>     
#> 1 beta_hat                         0.81       
#> 2 95% confidence interval for beta [0.72, 0.9]
#> 3 t-value                          17.6       
#> 4 degrees of freedom               998        
#> 5 p-value                          1.6e-60
decision(pro, 1, "R")
#> [1] "H_0 is rejected at a 5% significance level"
conclusion(pro, 1, "R")
#> [1] "there is sufficient evidence to reject the null hypothesis in favor of the alternative, and we conclude that there is a linear relationship between height and weight"

mytest(pro, 1)
#> Testing H_0: beta = 0 against H_1: beta != 0 at a 5% significance level
#> 
#> Assumption Testing
```

<img src="man/figures/README-examples-2.png" width="100%" />

    #> 
    #> Summary of Values
    #>                            summary       value
    #> 1                         beta_hat        0.81
    #> 2 95% confidence interval for beta [0.72, 0.9]
    #> 3                          t-value        17.6
    #> 4               degrees of freedom         998
    #> 5                          p-value     1.6e-60
    #> 
    #> Decision: H_0 is rejected at a 5% significance level
    #> 
    #> Conclusion: there is sufficient evidence to reject the null hypothesis in favor of the alternative, and we conclude that there is a linear relationship between height and weight
