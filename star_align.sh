#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=star_align      ### Job Name
#SBATCH --output=st_align_%j.out         ### File in which to store job output
#SBATCH --error=st_align_%j.err          ### File in which to store job error messages
#SBATCH --time=0-01:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8    ### Number of cpus to be used
#SBATCH --account=bgmp      ### Account used for job submission

# r1_22='/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/22read1_forward_paired.fastq.gz'
# r2_22='/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/22read2_reverse_paired.fastq.gz'
r1_23='/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/23read1_forward_paired.fastq.gz'
r2_23='/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/23read2_reverse_paired.fastq.gz'
genome_dir='/projects/bgmp/rferina/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.ens107.STAR2.7.10a'

conda activate QAA
# align reads to reference genome
/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $r1_23 $r2_23 \
--genomeDir $genome_dir \
--outFileNamePrefix 23align_to_ref