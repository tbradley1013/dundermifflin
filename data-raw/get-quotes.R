library(httr)
library(tidyverse)

# getting the data out of the api. Currently, there are no quotes for season
# 5 so it is just querying all of the other seasons. After the JSON is read
# for each season, it will parse the data
office_quotes <- map_dfr(c(1:4,6:9), ~{
  url <- glue::glue("https://the-office-api.herokuapp.com/season/{.x}/format/quotes")
  raw_df <- jsonlite::fromJSON(url)

  output <- raw_df$data %>%
    as_tibble() %>%
    unnest(quotes) %>%
    group_by(episode, name) %>%
    mutate(scene = row_number()) %>%
    ungroup() %>%
    unnest(quotes) %>%
    mutate(character = str_extract(quotes, "^[A-z+\\s+\\.+\\'+\\&]*:"),
           character = str_replace(character, ":", ""),
           quote = str_replace(quotes, "^[A-z+\\s+\\.]*:", ""),
           season = .x) %>%
    mutate_if(is.character, str_trim) %>%
    select(season, episode, name, scene, character, quote)

  cat("Finished season ", .x, "\n")
  Sys.sleep(5)
  return(output)
})


usethis::use_data(office_quotes)
