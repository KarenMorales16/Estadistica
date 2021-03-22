
library(datos)
paises <- datos ::paises
names(paises$esperanza_de_vida, paises$pib_per_capita)= c("Lifeexpectancy","","",FertilityRate")


colnames()

#Debe generar un diagrama de dispersión (scatter-plot) que muestre las estadísticas
  #esperanza de vida = esperanza_de vida
de esperanza de vida ( Life expectancy - eje y) y tasa de fertilidad (Fertility Rate -eje
                                                                      x) por país (Country).

#El diagrama de dispersión también debe clasificarse por países Regiones (Country
                                                                         Regions).

#Se le han proporcionado datos durante 2 años: 1960 y 2013 y se le exige que
produzca una visualización para cada uno de estos años.
Algunos datos se han proporcionado en un archivo CVS, algunos en vectores R. El
archivo CVS contiene datos combinados de ambos años. Toda manipulación de datos
debe realizarse en R (No en Excel) porque este proyecto puede ser auditado en una
etapa posterior.