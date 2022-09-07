#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=star_database      ### Job Name
#SBATCH --output=st_database_%j.out         ### File in which to store job output
#SBATCH --error=st_database_%j.err          ### File in which to store job error messages
#SBATCH --time=0-01:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8    ### Number of cpus to be used
#SBATCH --account=bgmp      ### Account used for job submission

fa='/projects/bgmp/rferina/bioinfo/Bi622/QAA/dre/Mus_musculus.GRCm39.dna.primary_assembly.fa'
gtf='/projects/bgmp/rferina/bioinfo/Bi622/QAA/dre/Mus_musculus.GRCm39.107.gtf'
genome_dir='/projects/bgmp/rferina/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.ens107.STAR2.7.10a'

conda activate QAA
# build STAR database for reference sequence
/usr/bin/time -v STAR --runThreadN 8 --runMode genomeGenerate --genomeDir $genome_dir --genomeFastaFiles $fa --sjdbGTFfile $gtf

