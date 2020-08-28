#instalar los paquetes necesarios
install.packages('rvest')
install.packages('xml2')
install.packages('stringr')
install.packages('robotstxt')
install.packages("purrr", dependencies = T)
install.packages("readr", dependencies = T)
install.packages("stringr", dependencies = T)
install.packages("rvest", dependencies = T)
#cargar los paquetes
library(rvest)
library(rvest)
library(dplyr)
library(purrr)
library(stringr)
library(tidyr)
library(xml2)
library(stringr)
library(rvest)
install.packages('robotstxt')
library("robotstxt")

#Especificar la pagina web que se desea scrapear
url="https://www.amazon.in/Test-Exclusive-237/dp/B071Z97T2C/ref=pd_vtp_107_6/258-9239741-1508102?_encoding=UTF8&pd_rd_i=B071Z97T2C&pd_rd_r=c9f842dc-80b8-42dd-8299-d5a8b6d03d08&pd_rd_w=RHcYt&pd_rd_wg=IVCbz&pf_rd_p=139d47d7-738e-46e1-a26e-36c93232f032&pf_rd_r=TQNJE84RCZ82QS4H0BYS&psc=1&refRID=TQNJE84RCZ82QS4H0BYS"

#preguntar a robots.xt si esta permitid trabajar con la pagina
  paths_allowed(paths =c(url))

#leer el contenido html de la pagina
  webpage = read_html(url)

#Extraer el titulo o nombre del producto
  title = webpage %>% html_node("h1#title") %>% html_text()
  head(title)  
#limpiar variable
  title = str_replace_all(title, "[\r\n]","")
  title = str_trim(title)
  

  # scrape the price of the product
  price_html <- html_nodes(webpage, "span#priceblock_ourprice")
  price <- html_text(price_html)
  
  # remove spaces and new line
  price <- str_replace_all(price, "[\u20b9]" , "")
  
  
  # Extraer la valoración del producto
  rate = webpage %>% html_nodes("span#acrPopover") %>% html_text()
  head(rate)
  rate <- str_replace_all(rate, "[\r\n]" , "")
  rate <- str_trim(rate)
  rate = rate[1]
  rate <-str_replace_all(rate,"out of 5 starts", "")
  rate =rate %>% as.numeric()
  
  # Guardar los datos en un data frame
  product_name = data.frame(Titulo = title, Precio = price, Valoracion = rate)
  View(product_name)
  