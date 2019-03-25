
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dundermifflin

An R package to get The Office quotes whenever you want\!

![](https://media.giphy.com/media/Is1O1TWV0LEJi/giphy.gif)

## Installation

``` r
remotes::install_github("tbradley1013/dundermifflin")
```

``` r
library(dundermifflin)
```

## Usage

![](https://media.giphy.com/media/5wWf7H89PisM6An8UAU/source.gif)

### `get_quote`

The main function of the package is `get_quote`. This function by
default returns one random quote from all of the main office cast. See
`?filter_quotes` to see who is included in the main office option.

``` r
get_quote()
#> Thanks to Toby, I have a very strong prejudice against Human Resources. I believe that the department is a breeding ground for monsters. What I failed to consider though, is that not all monsters are bad. Like E.T. Is Holly our extraterrestrial? Maybe. Or maybe she's just an awesome woman from this planet.
#> ~ Michael
#> Season 4, Epsiode 14 - Goodbye Toby
```

### Character Quotes

You can also get quotes for individual characters for all of the main
cast using their individual functions.

``` r
michael()
#> Yeah, well I'm calling the Ungrateful Bi-atch Hotline!  Did you get all that?
#> ~ Michael
#> Season 3, Epsiode 20 - Product Recall

pam()
#> Oh, can we stop by that pie stand on the way?
#> ~ Pam
#> Season 9, Epsiode 4 - Work Bus

dwight()
#> Thank you very much.  Okay, secretary says Wallace is away for the day and won't be coming back into the office.
#> ~ Dwight
#> Season 3, Epsiode 7 - Branch Closing
```

### Quotes by Department

You can also get quotes for specific departments\!

``` r
sales()
#> You can buy new stuff but you can't buy a new party.
#> ~ Pam
#> Season 4, Epsiode 9 - Dinner Party

accounting()
#> Our office has an unusually large number of… unusually large people.
#> ~ Oscar
#> Season 9, Epsiode 19 - Stairmageddon

hr()
#> I don't think Pam's gonna want to come into the men's room.
#> ~ Toby
#> Season 2, Epsiode 12 - The Injury
```

## Curated dataset

Over the next few months, I plan to work on creating a list of the
funnier quotes I come across while using the `dundermifflin` package to
create a curated data set of funny quotes that users can use as their
source for random quotes\! You can help with this\! I have opened an
issue named [Funny Quote
Indices](https://github.com/tbradley1013/dundermifflin/issues/1) where
you can paste the quote and the indices of the quote. In order to get
the indices of the quotes you are seeing, be sure to set `idx = TRUE`

``` r
get_quote(idx = TRUE)
#> Um, you don't, I don't think, come all the way back, you know.  Especially working together.
#> ~ Jim
#> Season 2, Epsiode 8 - Performance Review
#> Quote Index: 3792
```

## Data

This package also comes with a tibble, `office_quotes`, that has all of
the lines from the Office, with the exception of season 5.

All of the data in this dataset was obtained from
[theOffice-api](https://github.com/anGie44/theOffice-api).

![](https://media.giphy.com/media/dsKnRuALlWsZG/giphy.gif)
