# Get the configuration settings.
box::use(src / config[app])

# Get the application configuration.
config <- app()
dir_root <- config["ROOT_DIR"]

# Get the module directory.
dir_modules <- list(
    func = file.path(dir_root, "src", "func"),
    utils = file.path(dir_root, "src", "utils")
)

# Export subsequent functions.
box::export(dir_root, dir_modules)
