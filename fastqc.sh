#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=fastqc_%j      ### Job Name
#SBATCH --output=fqstqc_%j.out         ### File in which to store job output
#SBATCH --error=fastqc_%j.err          ### File in which to store job error messages
#SBATCH --time=0-7:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission
dirout='/projects/bgmp/rferina/bioinfo/Bi622/QAA/fastqc_outputs'
# r1_24='/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R1_001.fastq.gz'
# r2_24='/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S18_L008_R2_001.fastq.gz'
# r1_22='/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz'
# r2_22='/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz'
r2_23='/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz'

module load fastqc/0.11.5

# /usr/bin/time -v fastqc -t 4 $r1_24 $r2_24 $r1_22 $r2_22 -o $dirout
/usr/bin/time -v fastqc $r2_23 -o $dirout

