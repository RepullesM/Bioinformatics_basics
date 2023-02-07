## Crear loop para correr programas
Cuando tienes inputs con varias nombres y outputs con varios nombres, se puede hacer un loop Para que cree un script con todos los nombres y ;uego solo tengas que ponerlo a correr. 
Hay otras maneras de hecerlo, esto es solo una de ellas
```
for i in {01...12}; do echo -e "comando-programa -i bacchus/output_guppy/barcode$i -o output_trim/barcode_trim$i" > progama$i.sh | done
```
- el primer "i" es simplemente un simbolo que luego sustitulle por lo que le digas {}, puede ser i, pero puede ser x tambien
- echo es para que escriba lo que va entre ""
- "" el comando del programa para que te crea un script para cada uno de lo codigos
- '>' para el output 
