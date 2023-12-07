# Activate the environment.
source("renv/activate.R")

# Attach packages using box::use().
#' @example box::use(core = r/core[...])

# Add to the box path.
options(box.path = c(
    file.path(Sys.getenv("PROJECT_DIR"))
))


# Attach commonly used functions for interactivity.
box::use(
    targets[...],
    tarchetypes[...],
    magrittr[...],
    dplyr[...],
)

# Define helper run function.
run <- function(load = FALSE) {
    .env <- globalenv()
    tar_make(callr_function = NULL, envir = .env)
    if (load == TRUE) {
        tar_load_everything(envir = .env)
    }
}
