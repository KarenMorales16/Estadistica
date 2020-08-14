#PAQUETES
install.packages("ggplot2")
install.packages("gapminder")
#usar Libreryas
library(ggplot2)
library(gapminder)
#Visualizar datos
View(gapminder)
#crear grafico en ggplot
p <- ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))+geom_point()

#colocar color en las esteticas
p <- ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp,color="purple"))+geom_point()

#instalar paquete Socviz
install.packages("socviz")
library(socviz)
p2 <- ggplot(data = gss_sm,mapping=aes(x=bigregion,fill=religion))+geom_bar(position="dodge")
p2
  
# Mostrar barra no ampliada
p2 <- ggplot(data = gss_sm,mapping=aes(x=bigregion,fill=religion))+geom_bar(position="dodge")
p2
  
library(socviz)
p3 <- ggplot(data=oecd_sum,mapping =aes(x=year,y=diff,fill=hi_lo))
  
# ESPERANZA DE VIDA EN AÑOS EN UN FORO EN ESTADOS UNIDOS
view(oesc_sum)

p3 <- ggplot(data=oecd_sum,mapping =aes(x=year,y=diff,fill=hi_lo))
p3+geom_col()+guides(fill=FALSE)+
  labs(x=NULL,y="Diferencia en años",title = "Brecha en esperanza de vida con USA",
subtitle = "Diferencia de la experanza de vida promedio entre USA y países de la OCDE
1960-2015",  caption = "DATOS:OECD. After a chart by Christopher Ingraham, Washington Post, December 27th 2017")

