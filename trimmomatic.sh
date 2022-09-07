#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=trim_%j      ### Job Name
#SBATCH --output=trim_%j.out         ### File in which to store job output
#SBATCH --error=trim_%j.err          ### File in which to store job error messages
#SBATCH --time=0-7:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --cpus-per-task=12     ### Number of cpus per task
#SBATCH --account=bgmp      ### Account used for job submission
cutdir='/projects/bgmp/rferina/bioinfo/Bi622/QAA/cutadapt_outputs'
dirout='/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs'

conda activate QAA

/usr/bin/time -v trimmomatic PE $cutdir/22r1.fastq $cutdir/22r2.fastq $dirout/22read1_forward_paired.fastq $dirout/22read1_forward_unpaired.fastq $dirout/22read2_reverse_paired.fastq $dirout/22read2_reverse_unpaired.fastq  LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

/usr/bin/time -v pigz $dirout/*.fastq
