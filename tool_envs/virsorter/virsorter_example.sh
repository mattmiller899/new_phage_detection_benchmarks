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

# Load modules


# Activate a conda environment
conda activate virsorter

# Get current directory to help establish paths
DIR="/groups/bhurwitz/tools/VirSorter"
OUTDIR="/xdisk/bhurwitz/mattmiller899/new_phage_detection_benchmarks/tool_envs/virsorter"
INPUT="/xdisk/bhurwitz/mattmiller899/new_phage_detection_benchmarks/data/zenodo_archive/test_dataset/test.fa"
cd $DIR

PRG="wrapper_phage_contigs_sorter_iPlant.pl"
PREDS="$OUTDIR/Predicted_viral_sequences"
DB="/groups/bhurwitz/databases/virsorter/virsorter-data"

$PRG -f $IN --db 1 --wdir $OUTDIR --ncpu 4 --data-dir $DB

if ! [ "$(ls -A $PREDS)" ]; then
    echo "No viruses found, creating empty output files."
    echo "sequences" > $PREDS/VIRSORTER_cat-1.fasta
    echo "sequences" > $PREDS/VIRSORTER_cat-2.fasta
    echo "sequences" > $PREDS/VIRSORTER_cat-3.fasta
    echo "sequences" > $PREDS/VIRSORTER_prophages_cat-4.fasta
    echo "sequences" > $PREDS/VIRSORTER_prophages_cat-5.fasta
    echo "sequences" > $PREDS/VIRSORTER_prophages_cat-6.fasta
fi
