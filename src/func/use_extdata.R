# nolint start: line_length_linter.
#' @family src/func
#' @name func/use_extdata[use_extdata]
#' @title use_extdata()
#'
#' @description
#' Place a copy of the external dataset into another directory.
#'
#' @param extdata_file      Relative or absolute path pointing to the external dataset file being copied.
#' @param output_dir        Relative or absolute path pointing to the destination directory.
#' @param output_basename   Filename (with extension) applied to the output file. Defaults to the original file's basename.
#'
#' @importFrom tools file_path_as_absolute
#'
#' @return      Returns zero invisibly when no errors are found.
# nolint end
use_extdata <- function(extdata_file = NULL,
                        output_dir = "data/raw",
                        output_basename = basename(extdata_file),
                        options = list(
                            overwrite = TRUE,
                            copy.mode = TRUE
                        )) {
    # Assert no errors.
    e1 <- ifelse(is.null(extdata_file), "Missing source file reference.", NULL)
    e2 <- ifelse(is.null(output_dir), "Missing output directory.", NULL)
    utils$check_errs(c(e1, e2)) # nolint: object_usage_linter.

    # Get the input file path.
    input_path <- tools$file_path_as_absolute(extdata_file)

    # Get the output file path.
    output_path <- file.path(output_dir, output_basename)

    # Perform the copy.
    file.copy(
        input_path,
        output_path,
        options
    )

    # Get the absolute file path to the copied file.
    output_file <- tools$file_path_as_absolute(output_path)

    # Return the name.
    return(output_file)
}
