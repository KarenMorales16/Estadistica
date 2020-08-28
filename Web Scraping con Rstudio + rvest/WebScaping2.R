# Instalamos las librerías a utilizar en el caso de aplicación:
  install.packages("rvest", dependencies = T)
  install.packages("robotstxt", dependencies = T)
  install.packages("selectr", dependencies = T)
  install.packages("xml", dependencies = T)
  install.packages("dplyr", dependencies = T)
  install.packages("stringr", dependencies = T)
  install.packages("forcats", dependencies = T)
  install.packages("magrittr", dependencies = T)
  install.packages("tidyr", dependencies = T)
  install.packages("ggplot2", dependencies = T)
  install.packages("lubridate", dependencies = T)
  install.packages("purrr", dependencies = T)
  install.packages("readr", dependencies = T)
  install.packages("xml", dependencies = T)

  library(rvest)
  library(robotstxt)
  library(selectr)
  library(xml)
  library(dplyr)
  library(stringr)
  library("forcats")
  library("magrittr")
  library("tidyr")
  library("ggplot2")
  library("lubridate")
  library("purrr")
  library("readr")
  library(xml2)
  library(shiny) 

url <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"
paths_allowed(paths = url)
html_web <- head_html(url)
html_web %>% View()
#Scrape 1 : Titulo 50 peliculas solo el
titulo <- html_web %>% html_nodes(".lister-item-header a") %>% html_text()

año_estreno <- html_web %>%html_nodes(".lister-item-year.text-muted.unbold") %>% html_text() %>% 
  str_sub(start = 2, end = 5) %>%as.numeric()
  