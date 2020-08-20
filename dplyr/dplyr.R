install.packages("funModeling", dependencies = T)
install.packages("Hmisc", dependencies = T)
install.packages("dplyr", dependencies = T)
install.packages("datos", dependencies = T)
install.packages("fueleconomy", dependencies = T)

library(dplyr)
library(Hmisc)
library(funModeling)
library(fueleconomy)
library(ggplot2)

# Filter <-filtrar
# Mutate <-permite crear variables nuevas
# Summary <- resumir todo el data se
# Arrange <-Esta función nos permite ordenar las observaciones
# Operador pipe %>% <-Este operador permite realizar varias operaciones del paquete dplyr de manera consecutiva.
# group_by <- . La función crea grupos en el data set dependiendo de las variables que se escojan

# !() o !=  & =
# %ini& <- pertenece al conjunto

#filter
filter (data, x1 %ini% c(5,6,7,8,9,10))
filter (data, x1 %ini% 5:10)
filter (data, x2 %ini% c("Masculino","transgenero"))

paises <- datos ::paises
glimpse(paises)
View(paises)
 
#rankeo paises
rankeo  <-mutate(paises,"Ranking"= min_rank(paises$esperanza_de_vida)
View(rankeo)

rankeo  <-mutate(paises,"Ranking"= min_rank(paises$esperanza_de_vida)
View(rankeo)


#pipe ctrl +shift +m 
%>% 
  
#4. (vehicles) Hallar los cuartiles de la variable cty. Pista: Realizar un “resumen” del data set y utilizar
#la función quantiles()
 
vehicles  <- fueleconomy::vehicles
df_status(vehicles)
vehicles %>% summarise("Q0"=quantile(cty,0.0),"Q1"=quantile(cty,0.25),"Q2"=quantile(cty,0.5),"Q3"=quantile(cty,0.75),"Q4"=quantile(cty,0.1)) %>% View()

quantile(vehicles$cty) %>% View()

attach(vehicles)
#quiantile( arg1=vector,vectornumeros que va especificar el pontertual)


#(vehicles) Excluyendo los vehiculos de años anteriores a 2005, agrupar dependiendo de la clase del
#vehiculo y del numero de cilindros. Hallar el valor maximo de cilindraje (displ) para cada grupo y
#ordenar de manera descendente

#dataframe
vehicles
#filter()
vehicles %>% filter(!(year<2005)) %>% View()
#grup_by
vehicles %>% filter(!(year<2005)) %>% group_by(class,cyl) %>% summarise("Cilindrage_Maximo"=max(displ)) %>% View()
#Los grupos salen de 
vehicles %>% filter(!year<2005)
df_status(vehicles)
#cada nivel de cada nivel de class y cyl  
#arrange(desc())
vehicles %>% filter(!(year<2005)) %>% group_by(class,cyl) %>% summarise("Cilindrage_Maximo"=max(displ)) %>% arrange(desc(Cilindrage_Maximo)) %>% View()
#----Ejercicio Avanzado #------

#imputacion de datos && Balanceo
#/home/karen/Escritorio/Analytics/dplyr/Dane_Paramodelos_regresion.csv
#Venezonalos en colombia
Dane <- read.csv("/home/karen/Escritorio/Analytics/dplyr/Dane_Paramodelos_regresion.csv", header=T) 
View(Dane)
df_status(Dane)
# Departamentos ramas de actividad dentro de cada departamento cuales son las que ganan más
# grup_by(Departamento con rama de actividad)
# summarise(mean()) <- promedio
Dane %>%  group_by(Departamento, Rama.actividad) %>% summarise("Ingreso_promedio"=mean(Ingresos_total)) %>% View()
# summarise(mean()) <- promedio
# 5 ramas de actividad que tienen la mayor primedio mejores rankeo min_rank() el numero 1
# mutate() --- min_rank()
#filter()



# Agrupamos Genero

#Si el porcentaje de asalariados en hombre casados vs Si el porcentaje de asalariados en mujer casados (asalariados que trabajan para alguien)
