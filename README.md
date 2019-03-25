
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dundermifflin

An R package to get The Office quotes whenever you
want\!

<iframe src="https://giphy.com/embed/Is1O1TWV0LEJi" width="480" height="272" frameBorder="0" class="giphy-embed" allowFullScreen>

</iframe>

<p>

<a href="https://giphy.com/gifs/excited-the-office-celebrate-Is1O1TWV0LEJi">via
GIPHY</a>

</p>

## Installation

``` r
remotes::install_github("tbradley1013/dundermifflin")
```

``` r
library(dundermifflin)
```

## Usage

<iframe src="https://giphy.com/embed/5wWf7H89PisM6An8UAU" width="480" height="271" frameBorder="0" class="giphy-embed" allowFullScreen>

</iframe>

<p>

<a href="https://giphy.com/gifs/editingandlayout-the-office-michael-scott-5wWf7H89PisM6An8UAU">via
GIPHY</a>

</p>

### `get_quote`

The main function of the package is `get_quote`. This function by
default returns one random quote from all of the main office cast. See
`?filter_quotes` to see who is included in the main office option.

``` r
get_quote()
#> What if he dies in the fire?  And that's the last thing you ever said to him.
#> ~ Kevin
#> Season 2, Epsiode 4 - The Fire
```

### Character Quotes

You can also get quotes for individual characters for all of the main
cast using their individual functions.

``` r
michael()
#> Yeah, I know, I know. I'm just saying if they did throw their hats I've got a great line for that: "May your hats fly as high as your dreams." ... That was a pretty good line.
#> ~ Michael
#> Season 3, Epsiode 16 - Business School

pam()
#> I'm gonna to miss Toby. He has a nice, calming presence in the office.
#> ~ Pam
#> Season 4, Epsiode 14 - Goodbye Toby

dwight()
#> Pam and Karen. I am ordering you to cease and desist all party planning. Immediately.
#> ~ Dwight
#> Season 3, Epsiode 10 - A Benihana Christmas
```

### Quotes by Department

You can also get quotes for specific departments\!

``` r
sales()
#> I wrote that. Michael, you shouldn't have to settle. This is my pledge to you. I will find her and I will bring her to you and as God as my witness, she shall bear your fruit.
#> ~ Dwight
#> Season 4, Epsiode 10 - Chair Model

accounting()
#> Okay. I have a lot of work to do anyway.
#> ~ Kevin
#> Season 2, Epsiode 2 - Sexual Harassment

hr()
#> It just wasn't fair of me to give him an ultimatum in the first place. The whole thing is totally my fault. But we're going to be just fine. Just fine.
#> ~ Holly
#> Season 7, Epsiode 12 - Ultimatum
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
#> Stop it! Stop, stop. We're thinking. We're thinking about it.
#> ~ Michael
#> Season 7, Epsiode 6 - Costume Contest
#> Quote Index: 30157
```

## Data

This package also comes with a tibble, `office_quotes`, that has all of
the lines from the Office, with the exception of season 5.

All of the data in this dataset was obtained from
[theOffice-api](https://github.com/anGie44/theOffice-api).

<iframe src="https://giphy.com/embed/dsKnRuALlWsZG" width="480" height="271" frameBorder="0" class="giphy-embed" allowFullScreen>

</iframe>

<p>

<a href="https://giphy.com/gifs/the-office-steve-carell-michael-scott-dsKnRuALlWsZG">via
GIPHY</a>

</p>
