#te separara la variables con el separardor de excel
datos<- read.csv2(file="/home/karen/Descargas/SnakeRiver.csv")
#Resumen
summary(datos)
str(datos)
datos$Nieve <-as.numeric(datos$Nieve) #X
datos$NivelRio <-as.numeric(datos$NivelRio) #Y
#son proporcionales porque son proporcionales, hay un dato atipico
plot(datos)
#(Y~X)
#Y=Bo+B1X.... X=Nieve
fit<- lm(NivelRio~Nieve,data = datos)
#Estimacion de Bo
#Ho :Bo=0
#H1 :Bo=~0
#Rechazar Ho
summary(fit)
#Intercept es igual 0
#Y=1.9485+05809
fit<- lm(NivelRio~0+Nieve,data = datos) #cambiar la confianza con level
anova(fit)
#el modelo es valido por Ho si es significativo una confianza del 95% se rechaza el Ho
par(mfrow=c(2,2))
plot(fit)
#supuestos
#Normalidad  (grafico Normal Q~Q)
#Ho: Los residuos se distrubuyen normalmente 
#con un  u=0 y varianza estimada como S>2 =15.22
install.packages("car")
library(car)
#normalidad se calcula con los residuales
#ar::shapiro.test(fit$residuals)
shapiro.test(fit$residuals)
#La normalidad  no se cumplio 
#Se cumple el supuesto
#Independencia (Residual vs Fitted) 
# Ho: Los residuos son idepedendientes
require(car)  
durbinWatsonTest(fit)
#se cumplen el supuestos.

#Homocednasticidad o varianza cte (Scale-Location).
#Ho: Los residuos tienen varianza constacte.
ncvTest(fit)
#Y=0.74790x
neobj <-data.frame(Nieve=c(24,65,23,73))
predict(fit,newdata = neobj)

#Intervalo de confianza
#valor esperado en y
predict(fit,newdata = neobj,interval = "confidence")

#INtervalo de prediccion
predict(fit,newdata = neobj,interval = "prediction")

### Ejercicio Credit
datos <-read.csv(file="/home/karen/Descargas/Credit.csv",sep=",")
# Y= Balance
datos <-datos[,-1]
#Estructura datos
str(datos)
#datos$Ethnicity <- factor(datos$Ethnicity)
#correlación numéricas
cormat <- cor(cbind(datos$Income,datos$Limit,datos$Rating,datos$Cards,datos$Age,datos$Education,datos$Balance)) 
cormat
colnames(cormat) <- c("Income","Limit","Rating","Cards","Age","Education","Balance")
row.names(cormat) <-c("Income","Limit","Rating","Cards","Age","Education","Balance")
cormat
#modelo Y~x1+x2+...+xn
attach(datos)
fit<- lm(Balance~., data = datos)
summary(fit)
#si el Vif <5 todo está bien
#vif >5 las varables independientes se explican entre sí.
require(car)
vif(fit)
# Eliminamor Rating
datos <- datos[,-3]
summary(datos)

#Correlacion de variables categoricas
par(mfrow =c(2,2))
#Y~X categorica  para ver la incidencia
boxplot(Balance~Gender,datos=datos,main="Gender", col=c("pink", "blue"))
boxplot(Balance~Student,datos=datos,main="Student", xlab = "x",ylab = "y")
boxplot(Balance~Married,datos=datos,main="Married")
boxplot(Balance~Ethnicity,datos=datos,main="Ethnicity")
#Prueba de independencia de las variables categoricas 
#Ho: las variables son independientes
chisq.test(datos$Student,datos$Gender)
# para buscar el mejor modelo 
#grafica todo los modelos de regresion que puedan formarse
install.packages("leaps")
library(leaps)
par(mfrow =c(1,1))
#nbest= 100 muestra los 100 mejores modelos
todas <-regsubsets(Balance~.,data=datos, nbest=3,really.big = TRUE)
# con respecto al bic (minimizar el bic)
  plot(todas)
#cp (minimizar)
plot(todas, scale="Cp")
#Escoger las variables significativas
#Itercept, Income, limit, Cards,Age,Student 
Resultado= summary(todas)
#R2 alto cp bajo bic  bajo
out = with(data =Resultado, cbind(adjr2,cp,bic))
summary(out)
out =data.frame(out)
which.min(out$bic)
out[which.min(out$bic),]
fit<- lm(Balance~., data = datos)
summary(fit)
#Probar con la que tenga mas P VALOR EN ESTE CASO Married
fit1 <-lm(Balance~Income+Limit+Cards+Age+Education+Gender+Student+Ethnicity,data =datos)
summary(fit1)
#Eliminamos la que tenga el P valor mas alto
fi1<-lm(Balance~Income+Limit+Cards+Age+Gender+Student+Ethnicity,data =datos)
#Eliminamos la que tenga el P valor mas alto
fi1<-lm(Balance~Income+Limit+Cards+Age+Student,data =datos)
summary(fi1)
#Analissi del Modelo
#Y =-4.673e+02 -7.760e+00*Income +Limit*2.661e-01-Age*6.220e-01+4.284e+02  *student
#Anova
anova(fit)
#Gráficos de dispersión
#BUSCAR
pairs(datos$Income,datos$Limit,datos$Rating,datos$Cards,datos$Age,datos$Education,datos$Balance)

#Supuestis
par(mfrow=c(2,2))
plot(fit1)
#Normalidad
shapiro.test(fi1$residuals)
durbinWatsonTest(fi1)
ncvTest(fi1)
###
neobj <-data.frame(Income=c(24,65,23,73), Limit=c(24,65,23,73),Cards=c(24,65,23,73),
                   Age=c(24,65,23,73),Student=c("Yes","No","Yes","No"))
predict(fi1,newdata = neobj)

#Intervalo de confianza
#valor esperado en y
predict(fi1,
        newdata = neobj,interval = "confidence", level =0.99)

#INtervalo de prediccion
predict(fi1,
        newdata = neobj,interval = "prediction")


