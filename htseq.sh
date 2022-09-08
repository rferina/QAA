#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=htseq      ### Job Name
#SBATCH --output=htseq_database_%j.out         ### File in which to store job output
#SBATCH --error=htseq22_%j.err          ### File in which to store job error messages
#SBATCH --time=0-03:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8    ### Number of cpus to be used
#SBATCH --account=bgmp      ### Account used for job submission

conda activate QAA

file='/projects/bgmp/rferina/bioinfo/Bi622/QAA/23align_to_refAligned.out.sam'
file22='/projects/bgmp/rferina/bioinfo/Bi622/QAA/22align_to_refAligned.out.sam'
gtf='/projects/bgmp/rferina/bioinfo/Bi622/QAA/dre/Mus_musculus.GRCm39.107.gtf'

/usr/bin/time -v htseq-count -r name -s reverse -c 22stranded_reverse_count.tsv $file22 $gtf