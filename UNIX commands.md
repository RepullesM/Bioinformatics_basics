# UNIX Commands

## File commands
- ```ls``` lista de lo que hay en el directorio
- ```ls -al``` formatted listing with hidden files
- ```ls -l``` lista larga con info de cada archivo (tamaño, fecha...)
- ```ls/etc``` lista de contenidos de los directorios
- ```cd bacchus``` cambiar al directorio "bacchus"
- ```cd``` cambiar a home dir
- ```pwd``` ver dónde estás
- ```du -h``` para ver el tamaño de cada carpeta
- ```mkdir bacchus``` Crear directorio "bacchus"
- ```rm file``` borrar file
- ```rm -r dir``` borrar dir
- ```rm -f file```force remove file
- ```rm -rf dir``` force remove dir (*TENER CUIDADOOO*)
- ```cp file1 file2``` copy *file1* to *file1*
- ```cp -r  dir1 dir 2``` copy directories
- ```mv file1 file2``` rename or move file1 to file2. si file2 existe, mueve file1 a file2
- ```ln -s file link``` create symbolic lik *link* to file
- ```touch file``` create or update file
- ```cat > file``` places standard input into *file*
- ```more file``` output the contents of *file*
- ```head file``` output the first 10 lines of *file*
- ```tail file``` 10 last lines of *file*
- ```tail -f file``` contenido de *files* as it grows, starting with the last 10 lines 

## Process Management
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
- ```grep pattern files``` search or pattern in *files*
- ```grep -r pattern dir``` search recursively for *pattern* in *dir*
- ```command | grep pattern``` search for *pattern* in the output of *command*
- ```locate file``` find all instances of *file*
- ``` grep "^@" fastq_runid.fastq``` para los archivos fastq que cada read tiene un *id* que empieza por @
- ```grep "^@" fastq_runid.fastq | awk '{print $1 " " $5}' | sort -k2,2 > test?longitude_reads.txt``` que ademas me lo ordene por longitud del read
- ```awk '{sum +=$3; n++} END {if(n>0) print sum/n; }' ``` para calcular la media de la longitud del read
- ```grep -A 10 23a636c0-9f8b-42a3-986a-c401afee6d95 trimming_adapt/default_parameters/trimmed_bc01.fastq``` buscar el read "*26a63..*" en el archivo *trimmed_bc01.fastq* e imprimir las primeras 10 lineas de despues (-A after). para imprimir las columnas de antes: -b (before)

## Compression
- ```tar cf file.tar files``` create a tar named *file.tar* containing file
- ```tar xxf file.tar``` extract the files from *file.tar*
- ```tar czf file.tar.gaz files``` create
- ```tar xzf file.tar.gz``` extract a tar using Gzip
- ```tar cjf file.tar.bz2``` create a tar with Bzip2 compression
- ``` tar xjf file.tar.bz2``` extract
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
