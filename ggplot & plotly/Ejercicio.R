#
    library(ggplot2)
    data <-diamonds
    View(data)
    # quitar remove
    rm(data)
    remove(data)
    #comparar peso(carat) vs Price 
    p1 <- ggplot(data=diamonds, mapping = aes(x= carat, y=price, color =cut))  #setup simiento grafica 
    p1+ geom_point(color="purple") #diagrama de dispersión
   
    #comparar peso(carat) vs Price 
     p2 <- ggplot(data=diamonds, mapping = aes(x= carat, y=price, color =cut))  #setup simiento grafica 
     p2+ geom_point() #diagrama de dispersión

     #facet_wrap
     p3 <- ggplot(data=diamonds, mapping = aes(x= carat, y=price, color =cut))  #setup simiento grafica 
     p3+ geom_point()+ facet_wrap(~cut)
     
     # Agregar titulos  
     p3 <- ggplot(data=diamonds, mapping = aes(x= carat, y=price, color =cut))  #setup simiento grafica 
     p3+ geom_point()+ facet_wrap(~cut)+labs(title = "Precio vs Pesos",x="pesos",y="precios en dolares", subtitle = "ejemplo",caption = "prueba")
     
     # Agregar titulos  
     p4 <- ggplot(data=diamonds, mapping = aes(x= carat, y=price, color =cut))  #setup simiento grafica 
     p4+ geom_point()+ facet_wrap(~cut,ncol=2)+labs(title = "Precio vs Pesos",x="pesos",y="precios en dolares", subtitle = "ejemplo",caption = "prueba")
     
     # Agregar tema
     p5 <- ggplot(data=diamonds, mapping = aes(x= carat, y=price, color =cut))  #setup simiento grafica 
     p5+ geom_point()+ facet_wrap(~cut,ncol=2)+labs(title = "Precio vs Pesos",x="pesos",y="precios en dolares", subtitle = "ejemplo",caption = "prueba")+theme_dark()
    
     p5 <- ggplot(data=diamonds, mapping = aes(x= carat, y=price, color =cut))  #setup simiento grafica 
     p5+ geom_point()+ facet_wrap(~cut,nrow = 1)+labs(title = "Precio vs Pesos",x="pesos",y="precios en dolares", subtitle = "ejemplo",caption = "prueba")+theme_light()
     