# Inspired by use_targets(). Follow the comments below to fill in this target
# script. Then follow the manual to check and run the pipeline:
# https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# nolint start: commented_code_linter, trailing_whitespace_linter.

# Import required {targets} workflow API:
box::use(
    tools,
    targets[tar_option_set, tar_target],
    tarchetypes[...],
    tibble[...]
)

# Import custom utilties:
box::use(
    src / config[config.app = app],
    src / func / copy_extdata[...],
    src / func / create_extdata_filename_tbl[...],
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
    # debug = "rawdata_regents"
)

#' Dictionary of relative paths to external dataset files.
extdata_paths_list <- list(
    schma = "data/external/schma.zip",
    regents_scores = "data/external/2014-15-to-2021-22-nyc-regents-overall-and-by-category.xlsx", # nolint: line_length_linter.
    streeteasy_rents = "data/external/medianAskingRent_All.zip",
    zillow_index = "data/external/Zip_zori_uc_sfrcondomfr_sm_month.csv",
    modzcta = "data/external/MODZCTA_20231206.geojson",
    nycha_developments = "data/external/NYCHA_developments_20231206.geojson",
    nycha_addresses = "data/external/NYCHA_Residential_Addresses_20231206.csv",
    vacancies = "data/external/vacant_puf_21.csv"
)



# nolint start: line_length_linter
## prepare ---
tar_plan(

    # Input file paths as their own target.
    extdata_filename_tbl = create_extdata_filename_tbl(
        extdata_paths_list
    ),

    # Create upstream/downstream targets when iterating over filepaths.
    tar_files_input(
        extdata_index,
        unlist(extdata_paths_list),
        format = "file_fast",
        repository = "local",
        error = "stop"
    ),

    # Clone each extdata_index item into the `data/raw` directory.
    tar_target(
        name = rawdata_index,
        command = copy_extdata(
            unlist(extdata_index[1]),
            find_extdata_id_by_path(extdata_filename_tbl, extdata_index[1])
        ),
        pattern = map(extdata_index)
    )

    # # 3. Map each raw data item into a 'staged' format ready for analysis.
    # tar_target(
    #     name = staged_index,
    #     command =


    # )


    # Populate data/raw

    # # Raw Data Preparation
    # list(
    #     tar_target(
    #         name = "rawdata_regents",
    #         command = use_extdata(uri_regents),
    #         format = "file"
    #     )
    # ),
)
# nolint end

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
