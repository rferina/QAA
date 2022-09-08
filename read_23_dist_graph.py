#!/usr/bin/env python

import matplotlib.pyplot as plt
import gzip 

# open 23 files
with gzip.open('/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/23read1_forward_paired.fastq.gz', 'rt') as forward23:
    with gzip.open('/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/23read2_reverse_paired.fastq.gz', 'rt') as reverse23:
        line_num = 0
        reads_1 = []
        for line in forward23:
            line = line.strip('\n')
            line_num += 1
            read = 0
            # obtain sequence line
            if line_num % 4 == 2:
                read = len(line)
                reads_1.append(read)
        line_count = 0
        reads_2 = []
        for seqs in reverse23:
            seqs = seqs.strip('\n')
            line_count += 1
            reads_length = 0
            # obtain sequence line
            if line_count % 4 == 2:
                reads_length = len(seqs)
                reads_2.append(reads_length)
    
# graph 23 distribution   
plt.hist([reads_1,reads_2], label=['read1', 'read2']) 
plt.legend()
plt.yscale("log")  
plt.ylabel("Frequency")
plt.xlabel("Read Length Distribution")
plt.title("Distribution of Read Lengths for 23_4A_control_S17_L008") 
plt.savefig('read_dist_23.png')