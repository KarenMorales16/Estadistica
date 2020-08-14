#instalar paquetes plotly
install.packages("plotly")
#usar libreria
library(plotly)
library(dplyr)
#leer base de datos de gapmider
library(gapminder)
#Visualizar datos
View(gapminder)
#Gráfico
g1 <-ggplot(data=gapminder, mapping =  aes(x=gdpPercap, y=lifeExp))+geom_point()

#Plotly nos da opciones,lazo, zoom, descargar imagen, cortar forma especifico
#pasar gráfico de ggplot a plottly
ggplotly(g1)

#plottly
g <-gapminder%>% #trabajar base de datos data

#Gráfica normal de barras
plot_ly(x=c("Leones", "Orangutanes","Monos"), y=c(5,10,7), type="bar")

#Gráfico de Pay
plot_ly(labels=c("Leones", "Orangutanes","Monos"), values=c(5,10,7),   type="pie")

#
?plot_ly()
#Gráfica con data Diamonds
fig <- ggplot2 ::diamonds  # llamamos data diamonds del paquete ggplot2
fig <- fig%>%count(cut,clarity)
#forma lógica de comparar las tres variables de data
#"YlOrRd" ,"Blues"
fig <- fig%>% plot_ly(x ~cut,y ~n, color ~clarity, colors = "#RRGGBB" )
fig
# Con la función Layout podemos personalizar los detalles de nuestras grádcas
# Podemos buscarlas en  https://plotly.com/r/reference/
