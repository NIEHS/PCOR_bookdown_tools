# The CHORDS Toolkit for Health and Geospatial Exposures Research <img align="right" width="250" src="images/chords-icon-web.jpg">

[![Super-Lint](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/superlint.yml/badge.svg)](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/superlint.yml/badge.svg)
[![Render-Bookdown](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/test-render.yml/badge.svg)](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/test-render.yml/badge.svg)

This repository provides the underlying code and data for the [Climate and Health Outcomes Research Data Systems (CHORDS)](https://www.niehs.nih.gov/research/programs/chords) Toolkit for Health and Geospatial Exposures Research.
The CHORDS Toolkit seeks to aid researchers in accessing, processing, and integrating geospatial data-based exposures into their health research by providing guides, tools, and example code. The CHORDS Toolkit is available at <https://niehs.github.io/PCOR_bookdown_tools/>.

The CHORDS Toolkit chapters are written using [R Markdown](https://rmarkdown.rstudio.com/) files and the book is created using the [`bookdown`](https://bookdown.org/) `R` package.

Please note that the CHORDS Toolkit is a work in progress. The following chapters are in development:

|Unit              |Chapter Topic                     |Status          |
|------------------|----------------------------------|----------------|  
|Foundations       |Calculating Geographic Covariates |In Development  |
|Foundations       |Comparison of Spatial Regression Methods | In Development  |

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

### Templates and File Organization

Please use the chapter template file in the `templates` folder to create a new chapter `RMD` file in the `chapters` folder. You can then add any images, datasets, and bibliography entries in the `images`, `dataset`, and `bibliography` folders, respectively.
