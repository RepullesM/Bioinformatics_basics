###################################################################################################
## Installing programs via conda
###################################################################################################
## 1. Install conda
## Download the latest version of Miniconda (python 3) and install it by executing the downloaded sh-file (see commands below).
## Conda is a software and environment manager, that makes installation of new software and of required dependencies very simple and straightforward.
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

## Install it. Follow the directions, by default it will propose installing
## to your home directory, which should be fine, e.g., `/home/user/miniconda2`
## When asked yes/no whether to append the miniconda directory to $PATH, say yes.
##
## Do you wish the installer to initialize Miniconda2 by running conda init? [yes|no]: yes
$ sh Miniconda2-latest-*.sh

## When it asks Miniconda2 will be installed in this location, simply type after >>>, the following
>>> /storage/plzen1/home/pavelmatos/software/miniconda2

## You could now quit and reopen the terminal, or just run the following command
## which reloads your ~/.bashrc so that miniconda will now be in your path.
## This is necessary so that the conda program can be found from the terminal by
## simply typing conda.
$ source ~/.bashrc

## test that conda is installed. This will print info about your conda install.
$ conda info

## Add Bioconda channels (containing bioinformatics software):
$ conda config --add channels defaults; conda config --add channels conda-forge; conda config --add channels bioconda; conda config --add channels https://conda.anaconda.org/faircloth-lab

## 2. Install the SECAPR environment
## Conda automatically downloads and installs all necessary software dependencies.
## We strongly recommend to install SECAPR and all it's dependencies in a separate virtual environment,
## in order to not interfer with potentially already installed verisons of the software dependencies.
## Install SECAPR in virtual environment (here named secapr_env):
$ cd ./software
$ conda create -n secapr_env secapr

## 3. Activate the environment
## To activate the newly created environment, type:
$ source activate secapr_env

## When the environment is activated, all the necessary software dependencies will be available in the standard path,
## e.g. when you type samtools the samtools version required for SECAPR will be executed.
## After you are done using secapr, you can deactivate the environment to switch back to your standard environment with this command:
$ conda deactivate

## 4. Check active environment
## Check if you are connected to the correct environment (there should eb a star in front of secapr_env in the output of this command):
$ conda info --envs

## From now on to activate the environment
$ source ~/.bashrc
$ source activate secapr_env

## To see what version of SECAPR is installed, it should be something with "unknown" or "dirty". In this case, it is: secapr 0+unknown
$ secapr --version

