# To dowload genome assambly data --> use [datasets from ncbi](https://www.ncbi.nlm.nih.gov/datasets/docs/v2/download-and-install/)
To install it, I used miniconda (It's not in metacentrum)
```
source ~/.bashrc
miniconda create -n ncbi_datasets
conda activate ncbi_datasets
conda install -c conda-forge ncbi-datasets-cli
```
Now, everytime I want to use it, I have to activate it first (```conda activate ncbi_datasets```)

# To dowload SRA sequences (raw sequences) --> use sratoolkit (it's in metacentrum)
 ```
module load sratoolkit
prefetch --option-file SraAccList.txt #to use a list with several spp with accesion numbers
fastq-dump --split-3 ./FILE.sra > out.fastq #to convert the sra. file. In metacentrum you have to give the path of the file!
```
                          
# UPLOAD data ncbi
To upload data to ncbi from metacentrum you have to: 1) fill all the samples data on the ncbi submission portal (bioProject, bioSample and sra data), and 2) in metacentrum have the files you want to submit in one folder with the exact same names you give in the sra submission in ncbi.  
### in ncbi
Go to [submission portal](https://submit.ncbi.nlm.nih.gov/) of ncbi. For short read sequences, click on the "sra" tool. 
Best is to do it with "Aspera command line":
<img width="1237" height="739" alt="image" src="https://github.com/user-attachments/assets/84613ed9-7843-4cd2-af4b-b729ecadb2c0" />
Click on "New submission" and fill in all the info. I already had a BioProject created, so I just have to provide the accesion number. If not, click "no" and you will create it. 
To add the info, if many samples, click on upload excel file and download the template to fill it in. 
Next step if to upload the files. Click on "FTP or Aspera command line preload". You will have the option to  "select a preload folder". This folder is from metacentrum and you have to preload from there. 

To upload the folder from metacenrum, you need 1) the "Key file" --> click on "Download the key file" and save the file (aspera.openssh) in metacetrum; and 2) your path to ncbi: subasp@upload.ncbi.nlm.nih.gov:uploads/marepulles_gmail.com_LZFLTAAs.

Now --> go to metacentrum
### in metacentrum
Create a folder with all the files you want to upload and with the same names that you gave in the excell uploaded in ncbi.
Then, you can run in a screen or a submit a job if many files:
```
#PBS -N ncbiDataTransfer
#PBS -l select=1:ncpus=1:mem=50gb:scratch_local=400gb
#PBS -l walltime=167:59:00
#PBS -o ncbiDataTransfer.out
#PBS -e ncbiDataTransfer.err

module load aspera-cli
ascp -i /storage/plzen1/home/repulles/02.Nymphalidae_AF/01.PHMA_phylogeny/aspera.openssh -QT -l 1000m -k1 -d /storage/plzen1/home/repulles/02.Nymphalidae_AF/01.PHMA_phylogeny/toSubmitNCBI subasp@upload.ncbi.nlm.nih.gov:uploads/marepulles_gmail.com_LZFLTAAs

echo "transfer complete"
```
Where you give the "key file" you downloaded from ncbi (aspera.openssh), your folder with files (toNCBI) and the path ncbi gave you. 

### in ncbi
After this, in ncbi you willl be able to select a preload folder and submitt you files. 
