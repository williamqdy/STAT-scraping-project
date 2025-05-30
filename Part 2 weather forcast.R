library(rvest)
library(tidyverse)
library(stringr)

webpage <- read_html("http://www.sfu.ca/~haoluns/forecast.html")
webpage


nodes <- html_nodes(webpage, "div.tombstone-container")
nodes


text <- html_text(nodes)
text


period <- str_extract_all(text, "(?<=\\n)\\s*(\\w+\\s?\\w*)(?=\\n)")%>% unlist()
period


short_desc <- str_extract_all(text, "(?<=\\n)\\w.*(?=High:|Low:)")%>% unlist()
short_desc


temp <- str_extract_all(text, "(Low:|High:).*" )%>% unlist()
temp


table <- data.frame(period, short_desc, temp)
table


write.table(table, "301449602.csv", sep = ",", row.names = T,col.names =T)

