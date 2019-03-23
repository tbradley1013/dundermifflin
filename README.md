
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dundermifflin

An R package to get The Office quotes whenever you want\!

## Installation

``` r
remotes::install_github("tbradley1013/dundermifflin")
```

``` r
library(dundermifflin)
```

## `get_quote`

The main function of the package is `get_quote`. This function by
default returns one random quote from all of the main office cast. See
`?filter_quotes` to see who is included in the main office option.

``` r
get_quote()
#> You should've sent me a WUPHF.
#> ~ Ryan
#> Season 7, Epsiode 9 - WUPHF.com
```

## `character_quotes`

You can also get quotes for individual characters for all of the main
cast using their individual functions
