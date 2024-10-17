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
                          
