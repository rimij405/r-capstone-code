#' @family src/utils
#' @name utils[check_errors]
#' @title check_errors()
#'
#' @description
#' Check if the specified error list contains non-NULL messages.
#'
#' @param e
#' Collection of error messages or values. Can be empty.
#' @param ctx
#' Context of the errors being checked. Defaults to the calling function name.
#'
#' @return Returns zero invisibly when no errors are found.
#' @export
check_errors <- function(e = c(), ctx = NULL) {
    # Get the context.
    name <- ifelse(is.null(ctx), deparse(sys.call(-1)[[1]]), ctx)

    # If errors list is non-empty, fail validation check.
    if (length(e) > 0) {
        stop(paste("\n >", name, "-", unlist(e)), call. = FALSE)
    }

    # Return zero.
    invisible(0)
}
