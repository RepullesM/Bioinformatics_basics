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
