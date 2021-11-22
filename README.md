
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Stat545B2

<!-- badges: start -->
<!-- badges: end -->

This package is developed as an assignment B-2 for the STAT 545B course.
Give ‘delta()’ function to find the differences between maximum and
minimum values.

## Installation

Stat545B2 is not yet on CRAN. But, you can download it from this
repository using the following R command:

``` r
devtools::install_github("SereniT33/packageSereniT33")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Stat545B2)
library(datateachr)
library(tidyverse)
#> -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.5     v purrr   0.3.4
#> v tibble  3.1.5     v dplyr   1.0.7
#> v tidyr   1.1.3     v stringr 1.4.0
#> v readr   2.0.2     v forcats 0.5.1
#> -- Conflicts ------------------------------------------ tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
pivoted_flow_sample <- flow_sample %>%
  pivot_wider("year", names_from = "extreme_type", values_from = "flow") %>%
  group_by(year) %>%
  mutate(maximum = as.numeric(maximum)) %>%
  mutate(minimum = as.numeric(minimum)) 

delta(pivoted_flow_sample, "maximum", "minimum")
#> # A tibble: 11,663 x 2
#> # Groups:   year [109]
#>     year col_delta
#>    <dbl>     <dbl>
#>  1  1909      258.
#>  2  1909      168.
#>  3  1909      226.
#>  4  1909      207.
#>  5  1909      229.
#>  6  1909      302.
#>  7  1909      168.
#>  8  1909      339.
#>  9  1909      180.
#> 10  1909      242.
#> # ... with 11,653 more rows
```

Note that this package requires the data set that has columns for
maximum and minimum values for each observation, in this case, year.
