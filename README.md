# INTRODUCCIÓN A LA BIOINFORMÁTICA
Tutoriales básicos: [Linux tutorial](https://ryanstutorials.net/linuxtutorial/navigation.php) y [Python Tutorial](https://stackabuse.com/python-tutorial-for-absolute-beginners/)

## **Ambiente UNIX**
[Aquí](https://github.com/siriusb-nox/Taller-Oxford-Nanopore-Dec-2022/blob/main/bash_tutorial.md) hay una guía rápida de comando UNIX. 
Dentro de una terminal tienes lo que se llama *shell*, que es parte del sistema operativo que define cómo se va a comportar la terminal y cómo va a verse. Hay varios *shell* disponibles, pero el más común es *BASH* (Bourne again shell). 
### Sintaxis básica
Todos los programas, en general funcionan igual: le dices el programa, las opciones que quieras usar (se llaman *flag* y son opcionales), el input > output
```programa -opcion1 -opcion2 input > output```
### Comandos esenciales BASH
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
5.  ```git clone``` se descarga el repositorio que le especifíques.
6.   ``gunzip``` para descomprimir archivos zip
7.    ```wget``` para descargar programas
En metacentrum la mayoría de los programas ya están decargados y lo que hay que hacer es llamarlos con ```module add programa1```
8. ```programa1 -man``` para el manual del programa1
9. ```programa1 --help``` para obtener ayuda del programa1
10. ```unzip``` para descomprimir .zip

## File commands
- ```ls``` lista de lo que hay en el directorio
   - ```ls -a``` formatted listing with hidden files
   - ```ls -l``` lista larga con info de cada archivo (tamaño, fecha...)
   - ```ls -la``` 
   - ```ls/etc``` lista de contenidos de los directorios
   - ```ls fileX``` lista del contenido del directorio "fileX"

- ```du -h``` para ver el tamaño de cada carpeta

- ```rm file``` borrar file
    - ```rm -r dir``` borrar dir
    - ```rm -f file```force remove file
    - ```rm -rf dir``` force remove dir (*TENER CUIDADOOO*)

- ```cp file1 file2``` copy *file1* in the current directory and calls it *file2* (si en el nombre de file2 es un camino a otro drectorio, lo copias a ese)
    - ```cp -r  dir1 dir 2``` copy directories
    - ```cp root/directory/file1 . ``` copia el archivo file1 de la carpeta directory en el directorio actual (lo llamas con el . ) y deja el nombre igual

- ```scp file1 file2``` secure copy
     - ```scp -r backup/Heliconius/Niklas_lab/mar_samples repulles@minos.zcu.cz:home/repulles/Heliconius/```
- ```mv file1 file2``` rename or move file1 to file2. si file2 existe, mueve file1 a file2

- ```ln -s file link``` create symbolic lik *link* to file

- ```touch file``` create or update file

- ```cat``` concatenate. Para visualizar archivos no binarios. También puedes unir varios archivos (si no le das output, te los une en la pantalla, sin crear un nuevo archivo)
      - ```cat readme.txt``` para leer el archivo en la pantalla
      - ```cat > file``` places standard input into *file*
```
cat archivo1 archivo2 > test.out
```
- ```more file``` output the contents of *file*

- ```head file``` output the first 10 lines of *file*
    ```head -n 5``` output first 5 lines
    ```head -n -2``` output all the lines except the last two

- ```tail file``` 10 last lines of *file*
    - ```tail -f file``` contenido de *files* as it grows, starting with the last 10 lines 

- ```clear``` limpiar la terminal (lo que ves)

- ```less readme.txt``` escribe el contenido de un archivo en la pantalla pagina a pagina. 

## Process Management
- ```qsub script``` para poner a funcionar el script
- ```ps``` display your currently active processes
- ```top``` display all running processes
- ```kill pid``` kill process id *pid*
    - ```killall proc``` kill all process named *proc* (*CUIDADOO CON ESTO)
- "*ctrl + c*"  para parar un comando
- ```qdel trabajo1``` para parar el trabajo "trabajo1"
- ```bg``` lists stopped or background jobs; resume a stopped job in the backgroud
- ```fg``` brings the most recent job to foreground
- ```fb n ``` brings job *n* to the foreground

## Searching
**GREP**
- ```grep pattern files``` search for pattern in *files*
      - ```grep -r pattern dir``` search recursively for *pattern* in *dir*
- ```command | grep pattern``` search for *pattern* in the output of *command*
- ```locate file``` find all instances of *file*
- ``` grep "^@" fastq_runid.fastq``` para los archivos fastq que cada read tiene un *id* que empieza por @
      - ```grep "^@" fastq_runid.fastq | awk '{print $1 " " $5}' | sort -k2,2 > test_longitude_reads.txt``` que ademas me lo ordene por longitud del read
- ```grep -A 10 23a636c0-9f8b-42a3-986a-c401afee6d95 trimming_adapt/default_parameters/trimmed_bc01.fastq``` buscar el read "*26a63..*" en el archivo *trimmed_bc01.fastq* e imprimir las primeras 10 lineas de despues (-A after). para imprimir las columnas de antes: -b (before)

- ```sort``` para ordenar según el parámetro que le digas

**AWK**
- ```awk '{sum +=$3; n++} END {if(n>0) print sum/n; }' ``` para calcular la media de la longitud del read

**[SED](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/)**
- ``` $sed 's/unix/linux/' geekfile.txt``` replaces the word “unix” with “linux” in the file (*la "s" especifica que sustituya*)
Por defecto, **sustituye la primera palabra** que le especificas ("unix") de cada linea (si hay una linea que tiene varias veces "unix", solo va asustituir la primera)
- ``` $sed 's/unix/linux/2' geekfile.txt ``` Reemplaza la **segunda palabra** de cada linea (/2). Si quieres que reemplace la primera y segunda: /1,2 (?)
- ```$sed 's/unix/linux/g' geekfile.txt``` Reemplaza **todas** las palabras (flag "g"). 
- ```$sed 's/unix/linux/3g' geekfile.txt``` Reemplaza todas (g) a partir de la tercera (incluida)
- ``` $ echo "Welcome To The Geek Stuff" | sed 's/\(\b[A-Z]\)/\(\1\)/g' ``` Pone la primera letra de cada paabra entre parentesis 
   output: ``` (W)elcome (T)o (T)he (G)eek (S)tuff``` 
- ```$sed '3 s/unix/linux/' geekfile.txt``` Hace sed en la fila numero 3 
- ```$sed -n 's/unix/linux/p' geekfile.txt``` Print solo las lineas que reemplazas (flag /n)
- ``` $ sed 's/[[:space:]]/_/g' Cytb_PM-bacchus.fasta ``` replace spaces by _

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

## Compression
- ```tar cf file.tar files``` create a tar named *file.tar* containing file
- ```tar xxf file.tar``` extract the files from *file.tar*
- ```tar czf file.tar.gaz files``` create
- ```tar xzf file.tar.gz``` extract a tar using Gzip
- ```tar cjf file.tar.bz2``` create a tar with Bzip2 compression
- ```tar xjf file.tar.bz2``` extract
- ```gzip file``` compresses *file* 
- ```gzip -d file.gz``` decompresses
- ```gunzip``` para descomprimir archivos zip
- ```unzip``` para descomprimir .zip

## Shortcuts
- Ctrl+C --> detiene el current command
- Ctrl+Z --> stops the current command, resume with **fg** in the background or **bg** in the background
- Ctrl+D --> log out of current session, similar to **exit**  
- Ctrl+W --> erase one word in the current line
- Ctrl+U --> erase the whole line
- Ctrl+R --> type to bring up a recent command
- !! --> 

## Comparar dos archivos
**diff**:
  - ```diff archivo1 archivo2``` diferencias entre archivos: produce una lista de los cambios que se deben hacer al primer archivo, para que coincida con el segundo archivo
  - ```diff -s archivo1 archivo2``` simplemente para saber si son iguales o no
  - ```diff -y -W 70 arch1 arch2``` -y (produce vista lado a lado) y -W (limita numero de columnas que muestra).  Aquí hemos dicho a diff que produzcas una visualización lado a lado y que limites la salida a 70 columnas
  - ```diff -y -W 70 --suppress-common-lines arch1 arch2``` lista solo las lineas modificadas
  - ```colordiff --suppress-common-lines arch1 arch2``` lo pone por colores (apt-get para instalar el paquete en el sistema si usas ubuntu)

```
colordiff --suppress-common-lines --brief trimming_adapt/default_parameters/trimmed_2/reads_ids_bc01.txt output_guppy_3/trimming_porechop/reads_ids_bc01.txt
```

## change sequences names in a fasta file
```
#set the names file
patterns_file=change_NCBI_names.txt

for i in {1..9} ; do 
#####loci 239
target_file=clade_$i/mafft_L239.fasta
while IFS=$'\t' read -r new_pattern L239 L3 L1 L1111 L5 L6 L7 L9 L10 L11 L12 L13; do
    sed -i "s/${L239}/${new_pattern}/g" "$target_file"
done < "$patterns_file"
```
## Mv files in .txt from a folder to another
```
while IFS= read -r file; do mv bam_2.5/"${file}" removedPCRdupl/"${file}"; done < removedPCRduplicates.txt
```

#### METACENTRUM
1. When the copy step is unsuccessful (for any reason), the clean_scratch command will not be executed, and you can pick up your data from the scratch directory later:
```cp -r * $MYIN/ || export CLEAN_SCRATCH=false```

2. You can manually log in to the compute node (ssh node_name), go to scratch (cd /scratch...), and copy what you need. Or you can use our utility go_to_scratch as follows:
```go_to_scratch job_ID ```

3. Interative job to run directly from your screen but not from the fronted: ```qsub -I -l select=1:ncpus=4 -l walltime=2:00:00 ```. You can exit an interative job with ```$ exit```
