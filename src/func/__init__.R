# Get the configuration settings.
box::use(src / config[app])

# Get the application configuration.
config <- app()
dir_root <- config["ROOT_DIR"]

# Get the module directory.
dir_modules <- file.path(dir_root, "src", "func")

# Export subsequent functions.
box::export(dir_root, dir_modules)
