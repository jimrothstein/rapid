
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rapid

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/rapid)](https://CRAN.R-project.org/package=rapid)
[![Codecov test
coverage](https://codecov.io/gh/jonthegeek/rapid/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jonthegeek/rapid?branch=main)
[![R-CMD-check](https://github.com/jonthegeek/rapid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jonthegeek/rapid/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Convert an API document (APID), such as one that follows the [OpenAPI
Specification](https://spec.openapis.org/oas/v3.0.0), to an R object.
The R object enforces is a new S3 class, “apid”, which enforces a
strict, opinionated schema.

## Installation

You can install the development version of rapid from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("jonthegeek/rapid")
```

## Usage

This package will be used by
[{beekeeper}](https://jonthegeek.github.io/beekeeper/) and
[{mockplumber}](https://jonthegeek.github.io/mockplumber/).

## Code of Conduct

Please note that the rapid project is released with a [Contributor Code
of Conduct](https://jonthegeek.github.io/rapid/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
