## Backup Novogene (PHMA phylogeny)
ssh -x repulles@zuphux.cerit-sc.cz 
backup/PHMA_phylogeny

In "zuphux.cerit-sc.cz" I also have 03.Heliconius/ data and 01.bacchus_miION and I will have all the input data and output data, but I'll work from "@minos".
## Backup minION raw reads
ssh -x repulles@minos.zcu.cz
backup

## MinION data y flujo de trabajo
ssh -x repulles@adan1.grid.cesnet.cz #He estado trabajando aqui, pero parece que en realidad no se peude trabajar en esta maquina, tengo que usar un fronted. 

ssh -x repulles@minos.zcu.cz # Paso todo a este fronted para trabajar desde aqui 

## Data for analysis (outputs & inputs)
ssh -x repulles@zuphux.cerit-sc.cz:/storage/brno12-cerit/home/repulles

## Work fom: (scripts and send jobs)
ssh -x repulles@minos.zcu.cz

## Common backup:
```/storage/projects/matos_lab/```

Change permit to allow other member to have acces:
```chmod -R g+rw folder_name/```
