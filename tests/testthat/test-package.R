# File: test_package.R

# Select modules.
box::use(
    tt = testthat[test_that, expect_true],
)

# Execute the test.
tt$test_that("The required packages are installed.", {
    tt$expect_true(require("testthat", quietly = TRUE))
    tt$expect_true(requireNamespace("targets", quietly = TRUE))
})
