## 1. Software available directly
```
module avail sftw
module load sftw
```
If you don't know how is it called axactly, you can search for all the sftw that beggings by sft: ```module avail sft\*``` (Important the use of "\" for this)

## 2. Install via ```singularity```
If the software is not in metacentrum, you can dowload the container via singularity (example with angsd)
```
cd my_modules/
singularity search angsd #To search for all the caintainers called angsd (you can call directly singularity without loading it first)
singularity pull library://james-s-santangelo/angsd/angsd:0.938 #get the container I want
singularity exec angsd_0.938.sif angsd --help #to look if it worked
singularity exec angsd_0.938.sif realSFS #To run realSFS from angsd
```
I download this on ```my_modules``` folder. From now, to run angsd with a script or from another path I have two options:
1. ```singularity exec /storage/plzen1/home/repulles/my_modules/angsd_0.938.sif realSFS``` This is the normal way, were I have to specify the path of my container
2. I wrote the path to my ```.bashrc``` file, so I can call it directly: (I wrote this in .bashrc to call ```realSFS```
     ```
     realSFS() {
    singularity exec /storage/plzen1/home/repulles/my_modules/angsd_0.938.sif realSFS "$@"
    }
    ```
   From now I just have to:
   ```
   source /storage/plzen1/home/repulles/.bashrc
   realSFS command
   ```

## 3. Git clone
(I don't know why, sometimes it work and sometimes doesn't)
```
git clone https://github.com/fgvieira/ngsLD.git
cd ngsLD/
make
```
Now, to run:
```
./ngsLD [options]
/storage/plzen1/home/repulles/my_modules/ngsLD/ngsLD [options] #to run from somwhere else
```

## sticcs and twisst
To install sticcs and twisst2, I couldn't do the regular git clone, there were some libraries that I needed. At the end, this worked:
```
module add mambaforge
mamba activate /auto/plzen1/home/repulles/my_modules/sticcs_env

# Instalar cyvcf2 desde bioconda (evita la compilación)
mamba install -c bioconda cyvcf2 -y

# Luego instalar STICCS desde GitHub
pip install git+https://github.com/simonhmartin/sticcs.git@v0.0.5
```
And now, to run:
```
module add mambaforge
mamba activate /auto/plzen1/home/repulles/my_modules/sticcs_env
```
## Pixy
Install it via conda (I already installed conda [here](https://github.com/RepullesM/Bioinformatics_basics/blob/main/install_miniconda_environments.bash). To use conda, I just have to run:
```
source .bashrc
```
Actually, I can directly use mambaforge for conda
```
module add mambaforge
```

Once you have conda loaded (or mambarforge), just follow [pixy's recomendation](https://pixy.readthedocs.io/en/latest/guide/pixy_guide.html#generate-a-vcf-with-invariant-sites-and-perform-filtering):
```
# create environment
conda create --name pixy
conda activate pixy
# install pixy
conda install --yes -c conda-forge pixy
conda install --yes -c bioconda htslib
# see argiments
pixy --help
```

For now on, to run pixy:
```
source /storage/plzen1/home/repulles/.bashrc
conda activate pixy
```
## easySFS
```
# use conda from mambaforge
module load mambaforge
# create environment
conda create -n easySFS
# activate env
conda activate easySFS
# Install dependencies with bioconda
mamba install -c bioconda numpy pandas scipy -y
# clone github directory
git clone https://github.com/isaacovercast/easySFS.git
# cd
cd easySFS
# change permits 
chmod 777 easySFS.py
# run easySFS
./easySFS.py
```
And for now on:
```
module load mambaforge
mamba activate /auto/plzen1/home/repulles/my_modules/easySFS
```
