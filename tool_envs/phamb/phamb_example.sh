#!/bin/bash

### REQUIRED: 
### Research group/PI
#SBATCH --account=bhurwitz
### Job queue (standard|windfall|high_pri)
### If windfall, omit --account
#SBATCH --partition=standard
### Number of nodes
#SBATCH --nodes=1
### Number of CPUs per node 
#SBATCH --ntasks=14
### Amount of memory per node
#SBATCH --mem=64gb
### Job walltime (HHH:MM:SS)
#SBATCH --time=24:00:00
### OPTIONAL:
### Job name
### SBATCH --job-name=JobName
### Standard output filename
### SBATCH -o out_filename.txt
### Standard error filename
### SBATCH -e error_filename.txt
### Email notifications (BEGIN|END|FAIL|ALL)
### SBATCH --mail-type=ALL
### Email addresss
### SBATCH --mail-user=mattmiller899@email.arizona.edu

# Source ~/.bashrc for aliases and $PATH
source ~/.bashrc

# Activate a conda environment
conda activate phamb

# Load any necessary modules
# module load my_modules

# Get current directory to help establish paths
DIR="/groups/bhurwitz/tools/phamb"
OUTDIR="/xdisk/bhurwitz/mattmiller899/new_phage_detection_benchmarks/tool_envs/phamb"
cd $DIR

run_RF.py test/contigs.fna.gz test/clusters.tsv test $OUTDIR