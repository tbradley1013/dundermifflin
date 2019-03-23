#' Get office quotes
#'
#' Randomly pull quotes from the office_quotes data frame
#'
#'
get_quote <- function(season = NULL, episode = NULL, name = NULL,
                      scene = NULL, character = NULL,
                      output = c("character", "tbl"),
                      min_nword = 4, max_nword = 20){
  quotes <- dundermifflin::office_quotes

  quotes$nwords <- stringi::stri_count(quotes$quote, regex = "[[:alpha:]]")



  if (!is.null(season)){
    season <- suppressWarnings(as.integer(season))
    if (is.na(season)){
      warning("season must be an integer, argument will be ignored",
              call. = FALSE)
    } else {
      quotes <- quotes[quotes$season == season,]
    }

  }


  if (!is.null(episode)){
    episode <- suppressWarnings(as.integer(episode))
    if (is.na(episode)){
      warning("episode must be an integer, argument will be ignored",
              call. = FALSE)
    } else {
      quotes <- quotes[quotes$episode == episode,]
    }
  }


  if (!is.null(episode)){
    quotes <- quotes[quotes$name == name,]
  }


  if (!is.null(scene)){
    scene <- suppressWarnings(as.integer(scene))
    if (is.na(scene)){
      warning("scene must be an integer, argument will be ignored")
    } else {
      quotes <- quotes[quotes$scene == scene,]
    }
  }

  if (!is.null(character)){
    quotes <- quotes[tolower(quotes$character) == tolower(character),]
  }

  row_n <- nrow(quotes)

  row_pick <- sample(1:row_n, 1)

  quote <- quotes[row_pick, ]
  # return(quote)

  output <- match.arg(output, choices = c("character", "tbl"))


  cat(
    quote$quote,
    "\n~ ",
    quote$character,
    "\n",
    "Season ", quote$season,
    ", Epsiode ", quote$episode, " - ",
    quote$name,
    sep = ""
  )

  if (output == "character"){
    out <- paste(
      quote$quote,
      "\n~ ",
      quote$character,
      "\n",
      "Season ", quote$season,
      ", Epsiode ", quote$episode, " - ",
      quote$name,
      sep = ""
    )
    invisible(out)
  } else {
    invisible(quote)
  }


}
