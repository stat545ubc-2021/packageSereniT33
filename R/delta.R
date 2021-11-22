#' Find the difference (delta)
#'
#' This function is to create a table of delta values, which is the difference
#' between the annual maximum value and minimum value.
#'
#' @param data is a data set that was filtered by observations
#'  and have each column for maximum and minimum values.
#' @param x is the column of maximum values.
#' @param y is the column of minimum values.
#' @return  Returns a table of outputs that are the difference between maximum and minimum values for each observation.
#' @examples
#' #I will create a data set that has maximum and minimum values for each year.
#'
#' library(tidyverse)
#' library(datateachr)
#' pivoted_flow_sample <- flow_sample %>%
#' pivot_wider("year", names_from = "extreme_type", values_from = "flow") %>%
#' group_by(year) %>%
#' mutate(maximum = as.numeric(maximum)) %>%
#' mutate(minimum = as.numeric(minimum))
#'
#' #Using the created data set, "pivoted_flow_sample", I will create a table of outputs,
#' #that are annual differences between the maximum and minimum values.
#'
#' delta(pivoted_flow_sample, "maximum", "minimum")
#'
#' @importFrom dplyr %>%
#' @export
delta <- function (data, x, y) {
  delta_table <- data %>% dplyr::summarise(col_delta = data[[{{x}}]] - data[[{{y}}]], .groups = "keep")   %>%
    tidyr::drop_na()
  return(delta_table)
}



