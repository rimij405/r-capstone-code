# Import needed modules.
box::use(
    tibble[...],
    magrittr[...],
    tools[file_ext],
    dplyr[mutate, select, filter],
    . / src / config[...]
)

#' Processes each raw file according to its file type to get a staged index.
#'
#' @param rawdata_index  `tibble` containing rawdata_index information.
#'
#' @return List of staged data filepaths.
#' @export
create_staged_index <- function(rawdata_index) {
    # Get the config.
    .app <- app()

    # Known data types.
    datatypes <- c("xlsx", "zip", "csv", "geojson")

    # Track a new tibble for staged files.
    staged_tbl <- tibble(
        id = character(0),
        seq = integer(0),
        filename = character(0),
        filetype = character(0),
        filepath = character(0),
    )

    # Loop through the index.
    apply(rowdata_index, 1, function(rawdata_item) {
        # Get the basename.
        filename <- basename(rawdata_item$filename)


        # Handle processing the rawdata_item.
        results <- switch(rawdata_item$filetype[1],
            "csv" = {

            },
            "geojson" = {

            },
            "zip" = {

            },
            "xlsx" = {

            }
        )
    })
}
