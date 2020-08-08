#Consultas SQL en R
### Instalar Packages
install.packages("sqldf")
require(sqldf)
### csv
iris<- read.csv(file="/home/karen/Escritorio/Analytics/Recursos/iris.csv")

## SQL Queries
### Selecionar todo de Iris
sqldf("SELECT * FROM iris")

### ver cuantos datos tenemos de cada especie
sqldf ("SELECT COUNT(species), species from iris GROUP BY species")

### Selecionar todo de iris cuando las especie sea igual a setosa
sqldf("SELECT * FROM iris where species='setosa'")

## Selecionar los datos de mayor a menor valor de petal_length
sqldf("Select petal_length AS 'petal_length DESC',  UPPER (species)  from iris order by petal_length DESC" )

## Selecionar los datos de mayor a menor valor de petal_length
sqldf("Select CEILING(petal_length) AS 'petal_length DESC',  UPPER (species)  from iris order by petal_length DESC" )

### Selecionar todo de iris cuando las especie sea versicolor y petal_length sea de rango 1.0 a 1.3
sqldf("SELECT * FROM iris where species='versicolor' and petal_length BETWEEN 1.0 and 1.3")
sqldf("SELECT * FROM iris where   petal_length>=1.0 and petal_length<=1.3")

### Selecionar los datos de cuyo sepal_length inicia con 5
sqldf("select sepal_length,sepal_width,petal_length,petal_width, species from iris
      where sepal_length like '%5'")


### Selecionar los datos de cuyo sepal_width contengan un 4
sqldf("select sepal_length,sepal_width,petal_length,petal_width, species from iris
      where sepal_width like '4%'")

### Selecionar los datos de cuyo sepal_length inicia con 5
sqldf("select sepal_length,sepal_width,petal_length,petal_width, species from iris
      where sepal_width like '%4%'")

### Selecionar los datos de cuyo sepal_length inicia con 5
sqldf("select sepal_length,sepal_width,petal_length,petal_width, species from iris
      where sepal_width like '%145%'")


movies<- read.csv(file="/home/karen/Escritorio/Analytics/Recursos/P2-Movie-Ratings.csv")
sqldf("SELECT * FROM iris")

