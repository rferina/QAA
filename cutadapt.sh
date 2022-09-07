#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=cutadapt_%j      ### Job Name
#SBATCH --output=cutadapt_%j.out         ### File in which to store job output
#SBATCH --error=cutadapt_%j.err          ### File in which to store job error messages
#SBATCH --time=0-7:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission
dirout='/projects/bgmp/rferina/bioinfo/Bi622/QAA/cutadapt_outputs'


r1_22='/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz'
r2_22='/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz'
# r1_23='/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R1_001.fastq.gz'
# r2_23='/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz'

conda activate QAA

/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o $dirout/22r1.fastq -p $dirout/22r2.fastq $r1_22 $r2_22