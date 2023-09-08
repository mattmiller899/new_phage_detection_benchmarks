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
#SBATCH --ntasks=16
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

# Load modules


# Activate a conda environment
conda activate hecatomb

# Get current directory to help establish paths
OUTDIR="/xdisk/bhurwitz/mattmiller899/new_phage_detection_benchmarks/tool_envs/hecatomb"
INPUT="/xdisk/bhurwitz/mattmiller899/new_phage_detection_benchmarks/data/zenodo_archive/test_dataset/test.fa"
cd $OUTDIR


hecatomb install -t 14

hecatomb test
