# nolint start: line_length_linter.
#' @family src/func
#' @name func/use_extdata[use_extdata]
#' @title copy_extdata()
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
copy_extdata <- function(extdata_file = NULL,
                         extdata_target = NULL,
                         output_dir = "data/raw",
                         output_basename = basename(extdata_file),
                         options = list(
                             overwrite = TRUE,
                             copy.mode = TRUE
                         )) {
    # Import dependencies.
    box::use(
        tibble[...],
        tools[...],
        src / utils / check_errors[...],
        src / config[lang]
    )

    # Get the language constants.
    .err <- lang()["ERRORS"]

    # nolint start line_length_linter object_usage_linter
    # Compute the error messages.
    e1 <- if (is.null(extdata_file)) gettextf(.err["ARG_NOT_FOUND"], "extdata_file") else NULL
    e2 <- if (is.null(output_dir)) gettextf(.err["ARG_NOT_FOUND"], "output_dir") else NULL
    check_errors(c(e1, e2), "use_extdata")
    # nolint end

    # Get the input file path.
    input_path <- file_path_as_absolute(extdata_file) # nolint: object_usage_linter line_length_linter

    # Get the output file path.
    output_path <- file.path(output_dir, output_basename)

    # Perform the copy.
    file.copy(input_path, output_path)

    # Get the absolute file path to the copied file.
    output_file <- file_path_as_absolute(output_path) # nolint: object_usage_linter line_length_linter

    # Get the file extension.
    output_ext <- file_ext(output_file)

    # Create the target row.
    output_info <- tibble(
        id = extdata_target,
        filename = basename(output_file),
        filetype = file_ext(output_file),
        raw_path = output_file
    )

    # Return the name.
    return(output_info)
}
