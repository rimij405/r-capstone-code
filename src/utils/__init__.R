#' @name src/utils
#' @title Utilities
#'
#' @description
#' Module containing utility functions.
#'
#' @export
box::use(
  # Third-party package imports, as shims.
  here[resolve = here],
  # Sub-module imports.
  . / check_errors[check_errors]
)
