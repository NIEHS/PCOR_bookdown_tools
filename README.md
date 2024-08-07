# The CHORDS Toolkit for Health and Geospatial Exposures Research <img align="right" width="250" src="images/chords-icon-web.jpg">

[![Super-Lint](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/check-super-linter.yml/badge.svg)](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/check-super-linter.yml)
[![Render-Bookdown](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/check-render-bookdown.yml/badge.svg)](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/check-render-bookdown.yml)

This repository provides the underlying code and data for the [Climate and Health Outcomes Research Data Systems (CHORDS)](https://www.niehs.nih.gov/research/programs/chords) Toolkit for Health and Geospatial Exposures Research.
The CHORDS Toolkit seeks to aid researchers in accessing, processing, and integrating geospatial data-based exposures into their health research by providing guides, tools, and example code. The CHORDS Toolkit is available at <https://niehs.github.io/PCOR_bookdown_tools/>.

The CHORDS Toolkit chapters are written using [R Markdown](https://rmarkdown.rstudio.com/) files and the book is created using the [`bookdown`](https://bookdown.org/) `R` package.

Please note that the CHORDS Toolkit is a work in progress. The following chapters are currently in development:

|Title             |Unit    |Description                                     |
|------------------|--------|------------------------------------------------|
|Calculating Geographic Covariates |Geospatial Data Foundations |A tutorial introducing concepts and methods used to calculate common geographic covariates with public environmental data in R. |
|Comparison of Spatial Regression Methods |Advanced Methods |A comparison of spatial regression methods used to develop exposure models for geospatial exposure assessment. |
|Linkage to Exposures |Health Data Integration |A tutorial with code in R for linking geocoded addresses to environmental exposure data. |

_This is a BETA Release. Please let us know of any improvements we can make._

## Contact Us

Please open an [issue](https://github.com/NIEHS/PCOR_bookdown_tools/issues) to suggest edits or to ask questions.

## Set Up

The following code installs the `R` packages used in the example code:

```{r}
install.packages(
  c(
    "bookdown", "plotly", "shiny", "tidycensus", "tidyverse", "viridis",
    "ggmap", "ggplot2", "maps", "dplyr", "knitr", "latticeExtra", "pals",
    "classInt", "sf", "udunits2", "tmap", "lubridate", "gifski",
    "magick", "cowplot", "BiocManager"
  ),
  dependencies = TRUE
)
BiocManager::install("Biobase")
```

The following code creates a local HTML version of the book:

```{r}
bookdown::render_book("chapters/index.Rmd", "bookdown::gitbook")
```

## Contributing Guide

### Workflow

The following workflow rules and branch protections facilitate development, revision, review, and publication of the CHORDS Toolkit.

<img align="center" src="images/workflow_staging_2.png">

#### Development Branches

Contributors create, edit, and revise new and existing chapters in development branches. Development branches should be named according to contributor initials, a one to two word description, and four digit month/day code (MMDD) based on the date of branch creation. For example, a development branch created by Mitchell Manware on April 5, 2024 to develop a unit testing chapter would be named `mm-unittests-0405`.

A pull request must be opened to merge a development branch into the `staging-internal` branch. The pull request must pass all [status checks](#status-checks) and be reviewed by at least one other contributor.

#### Branch `staging-internal` [protected]

The first review branch is named `staging-internal`. This branch is used for the CHORDS team's internal review of the incoming additions and changes. The `staging-internal` branch must be rendered locally to review as it is not hosted on a URL.

Contributors can make significant edits directly to the `staging-internal` branch based on reviewer feedback.

A pull request must be opened to merge the `staging-internal` branch into the `staging-public` branch. **Pull requests into the `staging-public` branch are only accepted from the `staging-internal` branch.** Pull requests attempting to merge development branches into `staging-public` will fail. This branch protection is enforced by the "Protect Branch \`staging public\`" status check.

When a pull request passes all [status checks](#status-checks), is reviewed, and is merged into the `staging-public` branch, a new version of `staging-internal` will automatically be created (see .github/workflows/update-staging-internal.yml). Do not manually create a new `staging-internal` branch.

#### Branch `staging-public` [protected]

The second review branch is named `staging-public`. This branch is also used for the CHORDS team's internal review of the incoming additions and changes. The `staging-public` branch will be available on the R Studio Connect Posit Server (link incoming) to facilitate web version review and feedback.

Contributors **should not** make significant edits directly to the `staging-public` branch. Minor revisions (i.e., punctuation, word choice) are acceptable. Substantial changes to code, images, datasets, or style files should be addressed in the `staging-internal` review process or implemented on a new development branch.

A pull request must be opened to merge the `staging-public` branch into the `main` branch. **Pull requests into the `main` branch are only accepted from the `staging-public` branch.** Pull requests attempting to merge development branches or the `staging-internal` branch into `main` will fail. This branch protection is enforced by the "Protect Branch \`main\`" status check.

When a pull request passes all [status checks](#status-checks), is reviewed, and is merged into the `main` branch, a new version of `staging-public` will automatically be created (see .github/workflows/update-staging-public.yml). Do not manually create a new `staging-public` branch.

#### Branch `main` [protected]

A push (closed and merged pull request) to the `main` branch will automatically build and deploy the public facing version of the toolkit web page.

The `main` branch can not be edited directly. All file edits must follow the outlined workflow to ensure the quality and reliability of the final web page.

### Templates and File Organization

Please use the chapter template file in the `templates` folder to create a new chapter `RMD` file in the `chapters` folder of your development branch. You can then add any images, datasets, and bibliography entries in the `images`, `dataset`, and `bibliography` folders, respectively.

### Status Checks

**Check Super Linter**<br>
Checks that `.Rmd` chapters and style files have valid source code and adhere to consistent formatting (see .github/workflows/check-super-linter.yml). Utilizes [super-linter/super-linter](https://github.com/super-linter/super-linter).

**Check Render Bookdown**<br>
Checks that new chapters, file edits, and images and data do not cause errors in rendering the book (see .github/workflows/check-render-bookdown.yml).

**Protect Branch `staging-public`**<br>
Checks that a pull request into the `staging-public` branch is from `staging-internal` (see .github/workflows/protect-staging-public.yml).

**Protect Branch `main`**<br>
Checks that a pull request into the `main` branch is from `staging-public` (see .github/workflows/protect-main.yml).
