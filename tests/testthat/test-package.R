# File: test_package.R

# Source any dependencies.

# Execute the test.
test_that("The required packages are installed.", {
  expect_true(require("testthat", quietly = TRUE))
  expect_true(requireNamespace("targets", quietly = TRUE))
})
