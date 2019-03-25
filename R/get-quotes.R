#' Get office quotes
#'
#' Randomly pull quotes from the office_quotes data frame
#'
#' @param ... arguments to pass to \link[dundermifflin]{filter_quotes}
#' @param force_print a logical speicfying whether you want the quote to print
#' even if it is assigned to a variable name
#'
#' @export
get_quote <- function(..., force_print = FALSE){

  quotes <- filter_quotes(...)

  row_n <- nrow(quotes)

  row_pick <- sample(1:row_n, 1)

  quote <- quotes[row_pick, ]

  class(quote) <- c("dunder", "tbl_df", "tbl", "data.frame")

  if (!force_print) print(quote)

  return(quote)


}


#' @export
print.dunder <- function(x, ...){
  cat(
    x$quote,
    "\n~ ",
    crayon::green(x$character),
    "\n",
    "Season ", x$season,
    ", Epsiode ", x$episode, " - ",
    crayon::blue(x$name),
    "\n",
    ifelse("idx" %in% colnames(x), paste0("Quote Index: ", x$idx, "\n"), ""),
    sep = ""
  )
}

#' @export
as.character.dunder <- function(x, ...){
    paste(
      x$quote,
      "\n~ ",
      x$character,
      "\n",
      "Season ", x$season,
      ", Epsiode ", x$episode, " - ",
      x$name,
      sep = ""
    )
}


#' Filter office_quotes
#'
#' @param season an integer specifyng the season for which to get quotes from
#' Currently, all seasons are included except season 5
#' @param episode an integer specifying the episode number to get quote from
#' @param name a character string with the episode name to get quote from
#' @param scene an integer specifying the scene number
#' @param character a character specifying the character or department to get quote from.
#' Defaults to 'main', see details
#' @param min_nword the minimum number of words a quote must have to be
#' included, defaults to 4
#' @param max_nword the maximum number of words a quote can have to be included,
#' defaults to 20
#' @param include_actions should non spoken actions be included in the output?
#' Defaults to FALSE (i.e. actions will not be included)
#' @param idx logical specifying whether the quote index should be printed
#' with the quote
#'
#' @details
#' Main Character List - Michael, Dwight, Jim, Pam, Andy, Kevin, Angela,
#' Erin, Oscar, Ryan, Darryl, Phyllis, Toby, Kelly, Stanley, Meredith,
#' and Creed
#'
#' Other Departments - Sales, Accounting, HR, Customer Service, Reception,
#' and Corporate
#'
#' @export
filter_quotes <- function(season = NULL, episode = NULL, name = NULL,
                          scene = NULL, character = "main",
                          min_nword = 10, max_nword = 100,
                          include_actions = FALSE,
                          idx = FALSE){
  quotes <- dundermifflin::office_quotes

  if (idx){
   quotes$idx <- as.numeric(rownames(quotes))
  }

  quotes <- na.omit(quotes)

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

    character <- departments(character)
    # if (character == "main"){
    #   character <- c("Michael", "Dwight", "Jim", "Pam", "Andy", "Kevin",
    #                  "Angela", "Erin", "Oscar", "Ryan", "Darryl",
    #                  "Phyllis", "Toby", "Kelly", "Stanley",
    #                  "Meredith", "Creed")
    # }
    quotes <- quotes[tolower(quotes$character) %in% tolower(character),]
  }

  if (!include_actions){
    quotes$quote <- stringi::stri_replace_all(quotes$quote, "", regex = "\\[.*\\]")
    quotes$quote <- trimws(quotes$quote)
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
