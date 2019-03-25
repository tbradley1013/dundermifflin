#' Get quotes from different departments of the office
#'
#' @param ... arguments to be passed to \link[dundermifflin]{get_quote}
#' @export
#' @name department_quotes
NULL

#' @rdname department_quotes
#' @export
sales <- function(...){
  get_quote(character = "sales", ...)
}

#' @rdname department_quotes
#' @export
accounting <- function(...){
  get_quote(character = "accounting", ...)
}

#' @rdname department_quotes
#' @export
customer_service <- function(...){
  get_quote(character = "customer service", ...)
}

#' @rdname department_quotes
#' @export
hr <- function(...){
  get_quote(character = "hr", ...)
}

#' @rdname department_quotes
#' @export
reception <- function(...){
  get_quote(character = "reception", ...)
}

#' @rdname department_quotes
#' @export
corporate <- function(...){
  get_quote(character = "corporate", ...)
}





departments <- function(department){
  if (!tolower(department) %in% c("main", "sales", "accounting",
                                  "customer service", "hr",
                                  "reception", "corporate")) {
    return(department)
  }

  output <- switch(
    department,
    main = c("Michael", "Dwight", "Jim", "Pam", "Andy", "Kevin",
             "Angela", "Erin", "Oscar", "Ryan", "Darryl",
             "Phyllis", "Toby", "Kelly", "Stanley",
             "Meredith", "Creed"),
    sales = c("Dwight", "Jim", "Phyllis", "Stanley", "Andy", "Pam"),
    accounting = c("Angela", "Oscar", "Kevin"),
    "customer service" = c("Kelly"),
    hr = c("Toby", "Holly"),
    reception = c("Erin", "Pam"),
    corporate = c("Jan", "Gabe", "David")
  )

  return(output)
}
