
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
#> Today is Ryan's first sales call and I am bringing this boy home a full-grown man.
#> ~ Dwight
#> Season 3, Epsiode 5 - Initiation
```

## `character_quotes`

You can also get quotes for individual characters for all of the main
cast using their individual functions.

``` r
michael()
#> I would've been chief of surgery... Or a cowboy.
#> ~ Michael
#> Season 4, Epsiode 4 - Money
```

``` r
pam()
#> I can't tell if she's getting anything.  It just doesn't really feel right.
#> ~ Pam
#> Season 6, Epsiode 16 - The Delivery
```

``` r
dwight()
#> Quick Oscar update. I have conducted interviews with everyone in the office.
#> ~ Dwight
#> Season 2, Epsiode 13 - The Secret
```

## Data

This package also comes with a tibble, `office_quotes`, that has all of
the lines from the Office, with the exception of season 5.

All of the data in this dataset was obtained from
[theOffice-api](https://github.com/anGie44/theOffice-api).
