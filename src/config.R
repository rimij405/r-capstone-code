#' @family src/config
#' @name config[app]
#' @title app()
#'
#' @description
#' Get the application configuration as a list.
#'
#' @return List containing specific configuration details.
#' @export
app <- function() {
    return(list(
        ROOT_DIR = Sys.getenv("PROJECT_DIR", getwd()),
        MY_ORCID = Sys.getenv("ORCID", "XXXX-XXXX-XXXX-XXXX"),
        GRAPH_TITLE = Sys.getenv("VISNETWORK_GRAPH_TITLE", "graph")
    ))
}

#' @family src/config
#' @name config[lang]
#' @title lang()
#'
#' @description
#' Get the language constants as a list.
#'
#' @return List containing specific configuration details.
#' @export
lang <- function() {
    # Define errors.
    errors <- list(
        ARG_NOT_FOUND = "Missing argument: %s",
        ARG_INVALID = "Argument %s received an invalid value."
    )

    # Create the langauge config set.
    return(list(
        ERRORS = errors
    ))
}
