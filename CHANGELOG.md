# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog],
and this project adheres to [Semantic Versioning].

## [Unreleased]

- /

## [0.0.2] - 2023-12-04

### Added

- Add Zenodo DOI and ORCID support.
- Add `CITATION.cff` for rich citation support in GitHub and Zenodo.
- Add `CITATION` file in the [BibTeX] format.
  - Generated using: `cffconvert -o CITATION -f bibtex`.
- Add .gitignore with common rules for [R], [python], and [Visual Studio Code] contexts.
- Add python development dependencies: [`pip-tools`], [`cffconvert`], [`pre-commit`].
- Add `requirements.in` for declaring python development dependencies.
- Add `requirements.txt` using `pip-sync`.
- Add `make-venv` script for automating virtual environment setup with the `venv` module.
- Add `make-requirements` script for automating dependency installation.
- Add `.pre-commit-config.yaml` configuration file for handling pre-commit hook checks.
- Add pre-commit validation of `CITATION.cff` files.

### Changed

- Updated [README.md].

<!-- ### Deprecated -->

<!-- ### Removed -->

<!-- ### Fixed -->

<!-- ### Security -->

## [0.0.1] - 2023-12-04

- Initial release.

<!-- Internal Links -->
[README.md]: ./README.md

<!-- External Links -->
[keep a changelog]: https://keepachangelog.com/en/1.0.0/
[semantic versioning]: https://semver.org/spec/v2.0.0.html
[BibTeX]: https://www.bibtex.org/
[R]: https://cran.r-project.org/
[Python]: https://www.python.org/
[Visual Studio Code]: https://code.visualstudio.com/

<!-- Packages -->
[`pip-tools`]: https://pypi.org/project/pip-tools/
[`cffconvert`]: https://pypi.org/project/cffconvert/
[`pre-commit`]: https://pypi.org/project/pre-commit/

<!-- Versions -->
[unreleased]: https://github.com/rimij405/r-capstone-code/compare/v0.0.2...HEAD
[0.0.2]: https://github.com/rimij405/r-capstone-code/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/rimij405/r-capstone-code/releases/tag/v0.0.1
