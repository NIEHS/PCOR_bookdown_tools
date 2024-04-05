# The CHORDS Toolkit for Health and Geospatial Exposures Research <img align="right" width="150" src="images/chords-icon-web.jpg">

## Users

This repository hosts data analysis tools and examples from the CHORDS Toolkit for Health and Geospatial Exposures Research. The toolkit was created with [R Markdown](https://rmarkdown.rstudio.com/) and [`bookdown`](https://bookdown.org/).

The following packages are required to run all of the code examples within the book.

```{r}
install.packages(
  c(
    "plotly", "shiny", "tidycensus", "tidyverse", "viridis", "ggmap",
    "ggplot2", "maps", "dplyr", "knitr", "latticeExtra", "pals",
    "classInt", "sf", "udunits2", "tmap", "lubridate", "gifski",
    "magick", "cowplot", "BiocManager"
    ),
  dependencies = TRUE
  )
BiocManager::install("Biobase")
```

## Contributors

For NIEHS and external contributors, the repository consists of several workflow rules and branch protections to ensure proper development, revision, review, and publication.

### Development

Authors create, edit, and revise new and existing chapters in development branches. Development branches should be named based on author initials, a one/two word description, and four digit month/day date according to the date of branch creation. For example, a development branch created by "Mitchell Manware" on April 5, 2024 to develop a unit testing chapter would be named `mm-unittests-0405`.

A pull request must be opened to merge a development branch into the `staging-internal` branch. For the merge to be approved, the pull request must pass all of the status checks, most importantly the "Render Bookdown" and the "Super Linter" checks. A pull request into the `staging-internal` branch must be approved by at least one other author.

### "staging-internal"

The first review branch is titled `staging-internal`. This branch is used for internal review of the new/edited chapters. Reviewers must clone/pull the branch and render the book locally to view (or it can be available on R Posit Connect server).

Authors can make edits directly to the `staging-internal` branch based on feedback, but the branch cannot be created manually.

A pull request must be opened to merge the `staging-internal` branch into the `staging-public` branch. Additionally, **the `staging-public` branch will only accept merges from the `staging-internal` branch**. Authors are not permitted to merge a development branch directly into the `staging-public` branch. This branch protection is enforced by the "Protect Branch `staging-public`" status check. This status check, along with the "Render Bookdown" and "Super Linter" checks, must pass for the pull request to be approved. A pull request into the `staging-public` branch must be approved by at least two other authors.

After the `staging-internal` branch is merged with the `staging-public` branch, a new version of the `staging-internal` branch will automatically be created. This will ensure that the workflow contains consistent versioning.

### "staging-public""

The second review branch is titled `staging-public`. This branch is also used for internal review, but it is a final review step after group feedback has been incorporated into the chapters. Reviewers must clone/pull the branch and render the book locally to view (or it can be available on R Posit Connect server).

Authors **should not** make substantial edits directly to the `staging-public` branch. Minor revisions are acceptable, but significant changes should be addressed in the `staging-internal` review process, or by creating a new development branch.

A pull request must be opened to merge the `staging-public` branch into the `main` branch. Additionally, **the `main` branch will only accept merges from the `staging-internal` branch**. Authors are not permitted to merge a development branch or the `staging-internal` branch directly into the `main` branch. This branch protection is enforced by the "Protect Branch `main`" status check. This status check, along with the "Render Bookdown" and "Super Linter" checks, must pass for the pull request to be approved. A pull request into the `main` branch must be approved by at least two other authors and by Charles Schmitt.

The `staging-public` branch is recreated automatically after it has been merged into the `main` branch. This will ensure that the workflow contains consistent versioning.

### "main"

The `main` branch hosts the code used to build the public facing version of the bookdown webpage. A new version of the webpage is deployed upon a push from `staging-public` to the `main` branch.

Authors are not allowed to edit the `main` branch direclty. Edits to the `main` branch must pass the outlined workflow.

## Status Checks

Render Bookdown
- Checks that new chapters, style files, and figures/data do not cause errors when deploying the new book.

Super Linter
- Checks that `.Rmd` and style files conform to code style, and that there is no broken code

Protect Branch `staging-public`
- Checks that a pull request into the `staging-public` branch is from `staging-internal`

Protect Branch `main`
- Checks that a pull request into the `main` branch is from `staging-public`

## Questions

Utilize [Issues](https://github.com/NIEHS/PCOR_bookdown_tools/issues) to ask questions regarding workflow.
