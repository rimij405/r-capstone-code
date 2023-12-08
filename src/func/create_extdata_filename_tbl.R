# Import needed modules.
box::use(
    tibble[enframe],
    magrittr[...],
    tools[file_ext],
    dplyr[mutate, select, filter]
)

#' Convert to tibble glossary.
#'
#' @param paths_list Dictionary of relative paths to external dataset files.
#'
#' @return `tibble` containing the id and filename.
#' @export
create_extdata_filename_tbl <- function(paths_list) {
    # Create 2-column tibble from the input dictionary.
    paths_tbl <- enframe(unlist(paths_list), name = "id", value = "filepath")

    # Insert a new column with basenames.
    filename_tbl <- paths_tbl %>%
        mutate(filename = basename(filepath)) %>%
        mutate(filetype = file_ext(filename)) %>%
        select(id, filename, filetype, filepath)

    # Return the adjusted tibble.
    return(filename_tbl)
}

#' Find the filename given a glossary and a path.
#'
#' @param tbl  `tibble` containing glossary information.
#' @param path Path to match against.
#'
#' @return 1-row `tibble` containing the matched name.
#' @export
find_extdata_id_by_path <- function(tbl, path) {
    # Get the basename candidate.
    basename <- basename(path)

    # Match against the filename.
    tbl_matched <- tbl %>%
        filter(filename == basename) %>%
        select(id)

    # Return the id.
    return(tbl_matched$id[1])
}
