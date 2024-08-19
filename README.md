# INTRODUCCIÓN A LA BIOINFORMÁTICA
Tutoriales básicos: [Linux tutorial](https://ryanstutorials.net/linuxtutorial/navigation.php) y [Python Tutorial](https://stackabuse.com/python-tutorial-for-absolute-beginners/)

## **Ambiente UNIX**
[Aquí](https://github.com/siriusb-nox/Taller-Oxford-Nanopore-Dec-2022/blob/main/bash_tutorial.md) hay una guía rápida de comando UNIX. 
Dentro de una terminal tienes lo que se llama *shell*, que es parte del sistema operativo que define cómo se va a comportar la terminal y cómo va a verse. Hay varios *shell* disponibles, pero el más común es *BASH* (Bourne again shell). 
### Sintaxis básica
Todos los programas, en general funcionan igual: le dices el programa, las opciones que quieras usar (se llaman *flag* y son opcionales), el input > output
```programa -opcion1 -opcion2 input > output```
### Comandos esenciales:
1. ```echo $SHELL``` para saber qué shell estás usando
``` echo``` es un comando que se usa para mostrar mensajes

2. ``` cd ``` para cambiar de directorio. Si quiero ir a la carpeta anterior, se ponen dos puntos: ```cd ../``` 

3. ```mkdir``` para crear carpeta. Si quiero crear varias carpetas al mismo tiempo, escriber varios nombres:
```
mkdir folder1 folder2 folder3
```
Para **crear carpetas con numeros consecutivos** :
```mkdir bc{01..12}``` #*mirar bien que tiene solo 2 puntos suspensivos*

4. ```pwd``` para saber dónde estoy

5. ```ls``` da una lista de lo que hay
```ls -l``` da una lista larga, con info de cada archivo (como por ej el tamaño)
```ls /etc``` da una lista del contenido de los directorios

6. ```du -h``` ppara ver el tamaño de las carpetas 

7. ```cat``` para visualizar archivos no binarios. También puedes unir varios archivos (si no le das output, te los une en la pantalla, sin crear un nuevo archivo)
```
cat archivo1 archivo2 > test.out
```

8. ```git clone``` se descarga el repositorio que le especifíques. 

9. ```gunzip``` para descomprimir archivos zip

10. ```wget``` para descargar programas
En metacentrum la mayoría de los programas ya están decargados y lo que hay que hacer es llamarlos con ```module add programa1``` 

11. ```unzip``` para descomprimir .zip

12. ```grep``` busca patrones regulares
```programa1 -man``` para el manual del programa1
```programa1 --help``` para obtener ayuda del programa1
```sort``` para ordenar según el parámetro que le digas
```awk``` para manipular archivos de texto

#### **Buscar patrones regulares con [grep](https://www.freecodecamp.org/espanol/news/grep-command-tutorial-how-to-search-for-a-file-in-linux-and-unix-with-recursive-find/)**
El patrón de texto que se quiere buscar, se pone siempre entre comillas. [Aquí](http://sospedia.net/el-shell-bash-de-gnulinux-4-expresiones-regulares/) hay una página con expresiones regulares comunes y el [manual](https://www.gnu.org/savannah-checkouts/gnu/grep/manual/grep.html).

**Ejemplos:**
En archivos *.fastq* (por ejemplo el output de *guppy*), cada *read* tiene un identificador (id) que empieza por @ y luego info donde por ejemplo, especifica la longitud de los reads.
*(Para que lea los archivos .fastq hay que descomprimirlos primero)*
Sabiendo esto, le puedo pedir a grep que me saque todas las líneas que empiecen por @, para que saque todos los identificadores (Si le pido únicamente que me saque las líneas que contengan @, pero no solo las que empiecen poor @, me va a sacar muchas más cosas).
```
grep "^@" fastq_runid.fastq
```
Además puedo pedirle que me lo ordene por la longitud de los reads con sort:
```
grep "^@" fastq_runid.fastq | awk '{print $1 " " $5}' | sort -k2,2 > test_longitude_reads.txt
```
Además puedo calcular la media: 
```
awk '{sum +=$3; n++} END {if(n>0) print sum/n; }'
```
Buscar el read "23a63..." en el archivo trimmed_bc01.fastq e imprimir las 10 filas de despues (-A after). Si quiesiese imprimir las columnas de antes: -b (before)
```
grep -A 10 23a636c0-9f8b-42a3-986a-c401afee6d95 trimming_adapt/default_parameters/trimmed_bc01.fastq
```

#### **Concatenar comandos***

1. ```|``` hace que la salida del primero se convierta en la entrada del segundo
2. ```&``` hace que dos o mas comandos se ejecuten a la vez
3. ```||``` el segundo comando se ejecuta si el primero acaba con exito 
4. ```&&``` el segundo comando se ejecuta solo si el primero acaba con exito
5. ```;``` el segundo se ejecuta sin importar el resultado del primero 

#### METACENTRUM
1. When the copy step is unsuccessful (for any reason), the clean_scratch command will not be executed, and you can pick up your data from the scratch directory later:
```cp -r * $MYIN/ || export CLEAN_SCRATCH=false```

2. You can manually log in to the compute node (ssh node_name), go to scratch (cd /scratch...), and copy what you need. Or you can use our utility go_to_scratch as follows:
```go_to_scratch job_ID ```
