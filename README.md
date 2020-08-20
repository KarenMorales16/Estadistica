## GITHUB CONSOLA
_configurar git datos son iguales a los que se tiene en la  cuenta de github_
``` 
git config --global user.name "nombre_usuario"
git config --global user.email "email_id"
``` 
_Crea directorio para tu escritorio_
``` 
 > mkdir prueba
 > dir
``` 

_Creacion de Archivo Readme sirve para dar detalles del proyecto, programa o aplicación._
``` 
git init
touch README
git add README.md
```

_Realizar un commit se preparan los archivos con **git add .** significa que se anade todos los arhivos, para espeficicar archivos solo **git add  < nombre de archivo>.**
git **commit -m "Nombre_Commit"** guarda una copia del estado del archivo/s en ese momento y añade el código SHA a la cabecera del repositiorio_
``` 
git add .
git commit -m "Nombre_Commit"
 ```
 
_Empujar el contenido del repositorio local hacia el repositorio remoto, mediante el comando_
``` 
git push origin "Nombrerama"
``` 

_Crear rama_
```  
 git branch Unidad1
```

_Crea una rama a partir de donde estamos y con el estado de los archivos en el que nos encontramos pero no nos lleva a ella_
```
  git checkout Unidad1
``` 
  
_Crea una nueva rama en el repositorio, con los archivos en el estado en el que se encuentran en el momento que se crea y desde la rama en la que se crea y nos coloca en esa rama_

``` 
  git checkout -b otrarama
``` 


 ![Especificaciones-branch](git-branch.png)


 _Borrar una rama de nuestro repositorio local_
 ```
  git branch -d "nombre_rama"
  git branch -D "nombre-rama"
``` 
_En el caso de querer eliminar una rama del repositorio remoto_
 ```
 git push origin "nombre-rama"
  ```

![Especificaciones-push](git-push.png)


_Clona el repositiorio que haya en la url._
``` 
git clone <url>  
``` 
## Sincronización

_Baja el historial del repo remoto e incorpora los cambios. Es necesario hacer esto antes de subir nada._
``` 
 git pull
 ```
_Trae los cambios de la rama mencionada a la rama en la que nos encontramos_
``` 
  git merge Unidad1
  git merge Unidad2
  git merge Unidad3
``` 
 ## GIT PULL Y  GIT FETCH
_¿Cuál es la diferencia entre pull y fetch en git?_
git pull es una abreviación de **git fetch** seguido de **git merge FETCH_HEAD.**
_Es decir, git fetch trae los cambios, pero los deja en otro branch, hasta que se hace el git merge para traerlos al branch local._

_Siempre en un repositorio tienes una rama oculta, que puedes ver al usar git branch -a_
_Esa rama oculta es **origin/master.**_

_Tú al usar git fetch, bajas los cambios del repositorio remoto a la rama origin/master **git fetch origin**_

_Ahora ya tienes los cambios en origin/master, pero tendrías que pasarlos a la rama master, para eso tienes que usar: **git merge origin/master**_

_A partir de esto tu tienes los nuevos cambios en tu rama master y listo._
_Al usar git pull estas combinando git fetch+ git merge **git pull origin master**
_En conclusión con git pull te estás ahorrando el usar un comando más, pero te recomiendo que si apenas estás empezando a usar git, sigas usando git fetch y git merge, El git pull simplemente es un git fecth + git merge. No utilizar el git pull si en realidad está dudoso de qué cambios puedan traerse del repositorio remoto._

## GIT MERGE Y REBASE
_En git existen dos formas que nos permiten unir ramas, git merge y git rebase. La forma mas conocida es git merge, la cual realiza una fusión a tres bandas entre las dos últimas instantáneas de cada rama y el ancestro común a ambas, creando un nuevo commit con los cambios mezclados.

Git rebase básicamente lo que hace es recopilar uno a uno los cambios confirmados en una rama, y reaplicarlos sobre otra. Utilizar rebase nos puede ayudar a evitar conflictos siempre que se aplique sobre commits que están en local y no han sido subidos a ningún repositorio remoto. Si no tienen cuidado con esto último y algún compañero utiliza cambios afectados, seguro que tendrá problemas ya que este tipo de conflictos normalmente son difíciles de reparar.
  
  ### Referencias
- [markdown Github](https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax)
- [markdown Github](https://gist.github.com/Villanuevand/6386899f70346d4580c723232524d35a)
- [Comandos Git para consola](https://gist.github.com/mrcodedev/c234fd1aa2515008dd934ca8135cbfd2)
- [Comandos Git para consola](https://www.solucionex.com/blog/git-merge-o-git-rebase)
-https://slidesgo.com/es/tema/academia-de-idiomas

