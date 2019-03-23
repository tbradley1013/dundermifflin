
#' Get a "That's what she said" joke from the office
#'
#' @export
she_said <- function(){
  quotes <- dundermifflin::office_quotes

  quotes$idx <- as.numeric(rownames(quotes))

  shesaid_idx <- quotes$idx[grepl("that\\'s what she said", tolower(quotes$quote))]

  rand_idx <- sample(shesaid_idx, 1)
  quote_df <- quotes[c(rand_idx-1, rand_idx),]

  quote <- paste(quote_df$character, quote_df$quote, sep = ": ")

  cat(
    paste(quote, collapse = "\n"),
    "\n",
    "Season ", unique(quote_df$season),
    ", Epsiode ", unique(quote_df$episode),
    " - ", unique(quote_df$name),
    "\n",
    sep = ""
  )

  invisible(quote)
}
