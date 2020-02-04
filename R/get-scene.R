# Get Scene

#' Get a random scene dialog from the Office
#'
#' @export
random_scene <- function(){
  season <- sample(c(1:4, 6:9), 1)
  episode <- sample(ep_n_scene$episode[ep_n_scene$season == season], 1)
  scene <- sample(ep_n_scene$scene[ep_n_scene$season == season & ep_n_scene$episode == episode], 1)

  scene_quotes <- office_quotes[office_quotes$season == season & office_quotes$episode == episode & office_quotes$scene == scene,]
  class(scene_quotes) <- c("dunder_scene", class(scene_quotes))
  return(scene_quotes)
}

#' @export
print.dunder_scene <- function(x, ...){
  screen_width <- options()$width
  max_char_length <- max(nchar(x$character))

  if (length(unique(x$character)) <= 7){
    cols <- c("red", "green", "yellow", "blue", "magenta", "cyan", "silver")
    cols <- sample(cols, length(unique(x$character)), replace = FALSE)
    names(cols) <- unique(x$character)
  } else {
    cols <- c("red", "green", "yellow", "blue", "magenta", "cyan", "silver")
    cols <- sample(cols, length(unique(x$character)), replace = TRUE)
    names(cols) <- unique(x$character)
  }

  header <- paste0("THE OFFICE - ", unique(x$name), " (Season ", unique(x$season), ", Episode ", unique(x$episode), ", Scene ", unique(x$scene), ")\n")
  header_len <- nchar(header)
  cat(rep("=", min(c(header_len, screen_width))), "\n", sep = "")
  cat("THE OFFICE - ", crayon::red(unique(x$name)), " (Season ", unique(x$season), ", Episode ", unique(x$episode), ", Scene ", unique(x$scene), ")\n", sep = "")
  cat(rep("=", min(c(header_len, screen_width))), "\n", sep = "")
  for (i in 1:nrow(x)){
    qt <- x[i,]
    cat(
      char_color(qt$character, cols),
      ": ", rep(" ", (max_char_length - nchar(qt$character))),
      qt$quote,
      "\n",
      sep = ""
    )
  }
}


char_color <- function(character, cols){
  color <- cols[names(cols) == character]
  crayon::style(character, crayon::make_style(color))
}
