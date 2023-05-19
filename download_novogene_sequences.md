# DOWNLOAD NOVOGENE SEQUENCES ON METACENTRUM THROUGH LINK
Open space work on metacentrum (fronted) for backups (with enough memory). Don't use the same fronted that you usually use for running project and create the folder to store the backup. 

```
ssh -x repulles@zuphux.cerit-sc.cz 

mkdir backup/PHMA_phylogeny
```
For start the download you can create a bash script and submit the job with ```qsub``
But, it's also possible to do it directly on the screen. To do so and to be sure that the download don't stop if you loose internet conexion, you can create a screen that will be working even if you close mobaxterm. 

## CREATE A SCREEN
Only use it for dowload data, don't use it to run programs!!

'''
screen -S screen_name #crear el screen y entrar en él
```
To get out from it: ```ctr+A +D``` Be careful, don't press ctrl+D, you will kill the screen. You should press ctrl+A and then, press D

```
screen -ls #list of screens you have

screen -r screen_name #to get into the screen you want

screen -XS screen_name quit #to finish the screen
```

## TO MAKE SURE IS DOWNLOAD
### Summarize the integrity of all the files (*) in the working directory into the file checklist.chk
md5sum * > checklist.chk

### Report the integrity of every file
md5sum -c checklist.chk

### All files should give an "OK" note
