
#' For the testing, I will use the pivoted data frame
#' "pivoted_flow_sample" from the existing data set "flow_sample".

pivoted_flow_sample <- datateachr::flow_sample %>%
  tidyr::pivot_wider("year", names_from = "extreme_type", values_from = "flow") %>%
  dplyr::group_by(year) %>%
  dplyr::mutate(maximum = as.numeric(maximum)) %>%
  dplyr::mutate(minimum = as.numeric(minimum))


test_that("Column name is col_delta", {
  expect_named(delta(data = pivoted_flow_sample, x = "maximum", y = "minimum"), c("year", "col_delta"))
})

test_that("Has a error due to non-numeric values", {
  expect_error(delta(flow_sample, x = "sym", y = "flow"))
})

test_that("Vector of length 2", {
  expect_length(delta(data = pivoted_flow_sample, x = "maximum", y = "minimum"), 2)
})
