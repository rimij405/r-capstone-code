# Inspired by use_targets(). Follow the comments below to fill in this target
# script. Then follow the manual to check and run the pipeline:
# https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# nolint start: commented_code_linter, trailing_whitespace_linter.

# Import required {targets} workflow API:
box::use(
    tools,
    targets[tar_option_set, tar_target],
    tarchetypes[tar_plan],
)

# Import custom utilties:
box::use(
    src / config[config.app = app],
    src / func / use_extdata[...],
    src / utils / check_errors[...]
)

# Set target options:
tar_option_set(
    packages = c("here", "tibble"), # packages that your targets need to run
    format = "qs", # Optionally set the default storage format. qs is fast.
    #
    # For distributed computing in tar_make(), supply a {crew} controller as
    # discussed at https://books.ropensci.org/targets/crew.html. Choose a
    # controller that suits your needs. For example, the following sets a
    # controller with 2 workers which will run as local R processes:
    #
    #   controller = crew::crew_controller_local(workers = 2)
    #
    # Alternatively, if you want workers to run on a high-performance computing
    # cluster, select a controller from the {crew.cluster} package. The
    # following example is a controller for Sun Grid Engine (SGE).
    #
    #   controller = crew.cluster::crew_controller_sge( workers = 50, # Many
    #     clusters install R as an environment module, and you can load it #
    #     with the script_lines argument. To select a specific verison of R, #
    #     you may need to include a version string, e.g. "module load R/4.3.0".
    #     # Check with your system administrator if you are unsure. script_lines
    #     = "module load R" )
    #
    # Set other options as needed.
)

# Create the pipeline.
tar_plan(
    # External Data Inputs
    uri_regents = "inst/extdata/2014-15-to-2021-22-nyc-regents-overall-and-by-category.xlsx", # nolint: line_length_linter.
    uri_streeteasy_rents = "inst/extdata/medianAskingRent_All.zip",
    uri_zillow_index = "inst/extdata/Zip_zori_uc_sfrcondomfr_sm_month.csv",
    uri_modzcta = "inst/extdata/MODZCTA_20231206.geojson",
    uri_nycha_developments = "inst/extdata/NYCHA_developments_20231206.geojson",
    uri_nycha_address = "inst/extdata/NYCHA_Residential_Addresses_20231206.csv",
    uri_schma = "inst/extdata/schma.zip",
    uri_vacany = "inst/extdata/vacant_puf_21.csv",

    # # Raw Data Preparation
    # list(
    #     tar_target(
    #         name = "rawdata_regents",
    #         command = use_extdata(uri_regents),
    #         format = "file"
    #     )
    # ),
)

# # Replace the target list below with your own:
# list(
#     tar_target(
#     ),
#     # tar_target(
#     #     name = raw_regents_xlsx,
#     #     command = copy_file("2014-15-to-2021-22-nyc-regents-overall-and-by-category.xlsx"), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = raw_modzcta_geojson,
#     #     command = copy_file("MODZCTA_20231206.geojson"), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = raw_nycha_developments_geojson,
#     #     command = copy_file("NYCHA_developments_20231206.geojson"), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = raw_,
#     #     command = copy_file("NYCHA_Residential_Addresses_20231206.csv"), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = data_,
#     #     command = copy_file(""), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = data_,
#     #     command = copy_file(""), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = data_,
#     #     command = copy_file(""), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = data_,
#     #     command = copy_file(""), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = data_,
#     #     command = copy_file(""), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
#     # tar_target(
#     #     name = data_regents,
#     #     command = copy_file("2014-15-to-2021-22-nyc-regents-overall-and-by-category.xlsx"), # nolint: line_length_linter.
#     #     format = "file"
#     # ),
# )
# nolint end
