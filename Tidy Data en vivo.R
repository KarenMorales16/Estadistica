# Revisaremos una serie de datasets y en caso de necesitar no estar ordenados,
# se le har? el tratamiento respectivo. 
#un conjunto de datos ordenados son datos de variables 
# Paquetes requerido:
library(tidyverse)
library(datos)

tabla4a
# ?Es un conjunto de datos ordenados?
tabla4%>%
  pivot_longer(cols = c("1999","2000"), names_to="anio", values_to="casos")


tabla2
# ?Es un conjunto de datos ordenados?
tabla2%>%
  pivot_wider(names_from=tipo, values_from=cuenta)

tabla3
# ?Es un conjunto de datos ordenados?

tabla3%>%
separate(col=tasa, into= c("casos", "poblacion"), convert = TRUE)

tabla5
# Explicaci?n
tabla5%>%
unite(anio_comp, siglo,anio, sep=" ")

###
acciones <- tibble(
  anio = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  trimestre = c(1, 2, 3, 4, 2, 3, 4),
  retorno = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)

## TODO IMPLICITO
#FORMA 1:
acciones %>%
  pivot_wider(names_from = anio, values_from=retorno)

#FORMA 2:
acciones %>%
spread(anio, retorno)

#RECOMENDADA
acciones %>%
  complete(anio,trimestre)

###
tratamiento <- tribble(
  ~sujeto, ~tratamiento, ~respuesta,
  "Derrick Whitmore", 1, 7,
  NA, 2, 10,
  NA, 3, 9,
  "Katherine Burke", 1, 4)

# SE SOBRE ENTIENDE QUE LOS NA CORESPONDEN AL ANTERIOR QUE ESTA LLENO
#llenar vacios con el ultimo valor que se escribio
tratamiento %>%
fill(sujeto)

tratamiento <- tribble(
  ~sujeto, ~tratamiento, ~respuesta,
  "Derrick Whitmore", 1, 7,
  NA, 2, 10,
  NA, 3, 9,
  "Katherine Burke", 1, 4,NA,3,7)


