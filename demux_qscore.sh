#!/bin/bash
#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=22r2_%j      ### Job Name
#SBATCH --output=22r2_%j.out         ### File in which to store job output
#SBATCH --error=22r2_%j.err          ### File in which to store job error messages
#SBATCH --time=0-04:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission

file='/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz'
graph='22_3H_L008_R2_001_dist.png'

conda activate bgmp_py310
/usr/bin/time -v ./demux_qs_processing.py  -r 101 -f $file -g $graph