.quote_store <- function(){
  .last_quote <- NULL

  list(
    get = function() .last_quote,
    set = function(value) .last_quote <<- value
  )
}

.store_idx <- .quote_store()


set_last_quote <- function(value) .store_idx$set(value)


#' Get the last quote index
#'
#' @export
last_quote <- function() .store_idx$get()
