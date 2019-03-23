#' Get office quotes
#'
#' Randomly pull quotes from the office_quotes data frame
#'
#' @param ... arguments to pass to \link[dundermifflin]{filter_quotes}
#' @param output a character speicfying whether you want a character string
#' or a tibble output of the quote information
#'
#' @export
get_quote <- function(..., output = c("character", "tbl")){
  quotes <- filter_quotes(...)

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
    "\nword count = ", quote$nwords,
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




#' Filter office_quotes
#'
#' @param season an integer specifyng the season for which to get quotes from
#' Currently, all seasons are included except season 5
#' @param episode an integer specifying the episode number to get quote from
#' @param name a character string with the episode name to get quote from
#' @param scene an integer specifying the scene number
#' @param character a character specifying the character to get quote from.
#' Defaults to 'main', see details
#' @param min_nword the minimum number of words a quote must have to be
#' included, defaults to 4
#' @param max_nword the maximum number of words a quote can have to be included,
#' defaults to 20
#'
#' @details
#' Main Character List - Michael, Dwight, Jim, Pam, Andy, Kevin, Angela,
#' Erin, Oscar, Ryan, Darryl, Phyllis, Toby, Kelly, Stanley, Meredith,
#' and Creed
#'
#' @export
filter_quotes <- function(season = NULL, episode = NULL, name = NULL,
                          scene = NULL, character = "main",
                          min_nword = 4, max_nword = 20){
  quotes <- dundermifflin::office_quotes

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
    if (character == "main"){
      character <- c("Michael", "Dwight", "Jim", "Pam", "Andy", "Kevin",
                     "Angela", "Erin", "Oscar", "Ryan", "Darryl",
                     "Phyllis", "Toby", "Kelly", "Stanley",
                     "Meredith", "Creed")
      quotes <- quotes[tolower(quotes$character) %in% tolower(character),]
    } else {
      quotes <- quotes[tolower(quotes$character) == tolower(character),]
    }
  }

  quotes$nwords <- stringi::stri_count(trimws(quotes$quote), regex = "\\s") + 1
  # quotes$nwords <- sapply(strsplit(quotes$quote, " "), length)

  if (!is.null(min_nword)){
    quotes <- quotes[quotes$nwords >= min_nword,]
  }

  if (!is.null(max_nword)){
    quotes <- quotes[quotes$nwords <= max_nword,]
  }

}
