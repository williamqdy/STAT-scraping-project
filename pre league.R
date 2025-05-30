library(rvest)
library(tidyverse)
library(stringr)

webpage <- read_html("https://www.premierleague.com/tables")
webpage

club_nodes <- html_nodes(webpage, "div.league-table__expandable-container")
club_nodes
club_names <- html_text(club_nodes)
club_names

names <- str_extract(club_names, "([A-Z][a-z]+(?: [A-Z][a-z]+)*)")
league_names <- names[1:20]
league_names


table <- data.frame(league_names)
table









webpage <- read_html("https://www.imdb.com/search/title/?title_type=feature&release_date=2016-01-01,2016-12-31&count=100")
webpage
film_node <- html_nodes(webpage, ".title Column")
film_node
