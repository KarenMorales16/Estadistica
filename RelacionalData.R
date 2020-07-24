library(tidyverse)
library(ready)

data1 <- data.frame(ID=1:2,x1=c("a1","a2"))
data2 <- data.frame(ID=2:3,x2=c("b1","b2"))
data1
data2

inner_join(data1,data2,by="ID")
#Dejar las observaciones del Primer dataset
left_join(data1,data2,by="ID")
#Dejar las observaciones del segundo dataset
inner_join(data1,data2,by="ID")
#Union total 
full_join(data1,data2,by="ID")

library(readxl)
Student_Profile <- read_excel("/home/karen/Escritorio/Colombia/Relational_Data_Analytics/Student_Profile.xlsx")
Major_Data <- read_excel("/home/karen/Escritorio/Colombia/Relational_Data_Analytics/Major_Data.xlsx")
Winners_Data <- read_excel("/home/karen/Escritorio/Colombia/Relational_Data_Analytics/Winners_Data.xlsx")
Mentor_Data <- read_excel("/home/karen/Escritorio/Colombia/Relational_Data_Analytics/Mentor_Data.xlsx")
# Crear una nuevo data set que contenga la descripcion de la carrera en 
# la que estan inscritos los ganadores de la beca y dem?s info.

#Option 1

#Agregamos descripcion de la carrera
New_dataset <- left_join(Student_Profile, Major_Data, by = "Major_Code") 
New_dataset


New_dataset <- right_join(New_dataset, Winners_Data, by = "Student_ID")
New_dataset

res
New_dataset2 <- inner_join(Student_Profile, Winners_Data, by = "Student_ID") 
New_dataset2


New_dataset2 <- left_join(New_dataset2, Major_Data, by = "Major_Code")
New_dataset2

New_dataset2 <- left_join(New_dataset2, Mentor_Data, 
                          by = c("Major_Code", "Gender"))

New_dataset2 <- left_join(New_dataset2, Mentor_Data, 
                          by = c("Major_Code"="Carrera", "Gender"="Genero_Est"))
New_dataset2

#Juntamos todas las observaciones de ambos data sets
New_dataset3 <- full_join(Student_Profile, Mentor_Data, 
                          by = c("Major_Code"="Carrera", "Gender"="Genero_Est"))
New_dataset3

#ERRORES 
#CUALES SON TODOS LOS ESTUDIANTES GANARON Y NO GANARON
left_join(Student_Profile,Winners_Data,by="Student_ID")
#ESTO ES UN ERROR PUESTO QUE NOS HAN PEDIDO TODO LOS ESTUDIANTES 
right_join(Student_Profile,Winners_Data,by="Student_ID")

# TODOS LOS LAS OBSERVACIONES DE MENTORES Y ESTIDIANTES 

mm <- data.frame(
  
  inner_join(x = Student_Profile,
             y = Mentor_Data,
             by= c("Major_Code"="Carrera", "Gender"="Genero_Est")) , 
  
  Location = c("Atlantico","Cundinamarca","Valle del Cauca", "Sucre","Antioquia") 
  
)

#semi_join() & anti_join()
#HACE LA INTERSECCION SIN MUTAR LAS VOLUMNAS
#TODOS LOS CONSEJEROS TODAS LAS CARRERAS QUE TIENEN UN MENTOR
semi_join(Major_Data,Mentor_Data, by= c("Major_Code"="Carrera"))   
#TODOS LOS CONSEJEROS TODAS LAS CARRERAS QUE TIENEN UN MENTOR
inner_join(Major_Data,Mentor_Data, by= c("Major_Code"="Carrera"))   
#TODAS LAS CARRERAS QUE TIENEN UN  ASOCIADO
anti_join(Major_Data,Mentor_Data, by= c("Major_Code"="Carrera"))

full_join(Major_Data,Mentor_Data, by= c("Major_Code"="Carrera"))


