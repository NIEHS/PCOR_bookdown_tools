# The CHORDS Toolkit for Health and Geospatial Exposures Research

[![Super-Lint](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/superlint.yml/badge.svg)](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/superlint.yml/badge.svg)
[![Render-Bookdown](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/test-render.yml/badge.svg)](https://github.com/NIEHS/PCOR_bookdown_tools/actions/workflows/test-render.yml/badge.svg)

This is a data analysis examples book based on R Markdown and bookdown (<https://github.com/rstudio/bookdown>). The dataset and large files are under ddn: <smb://wine/pcor_climate/Bookdown_tool/>

The following packages are required to run all of the code within the bookdown.

```{r}
install.packages(
  c(
    "testthat",
    "rsconnect",
    "bookdown",
    "rmarkdown",
    "plotly",
    "shiny",
    "tidycensus",
    "tidyverse",
    "viridis",
    "ggmap",
    "ggplot2",
    "maps",
    "dplyr",
    "knitr",
    "latticeExtra",
    "pals",
    "classInt",
    "sf",
    "udunits2",
    "tmap",
    "lubridate",
    "gifski",
    "magick",
    "cowplot",
    "BiocManager",
    "styler"
  ),
  dependencies = TRUE
)
```
