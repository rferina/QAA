#!/usr/bin/env python

import matplotlib.pyplot as plt
import gzip 

# open 22 files
with gzip.open('/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/22read1_forward_paired.fastq.gz', 'rt') as forward22:
    with gzip.open('/projects/bgmp/rferina/bioinfo/Bi622/QAA/trimmomatic_outputs/22read2_reverse_paired.fastq.gz', 'rt') as reverse22:
        line_num = 0
        read_1 = []
        for line in forward22:
            # line = line.decode()
            line = line.strip('\n')
            line_num += 1
            read_len = 0
            # obtain sequence line
            if line_num % 4 == 2:
                read_len = len(line)
                read_1.append(read_len)
        line_count = 0
        read_2 = []
        for seq in reverse22:
            seq = seq.strip('\n')
            line_count += 1
            read_length = 0
            # obtain sequence line
            if line_count % 4 == 2:
                read_length = len(seq)
                read_2.append(read_length)
    
# graph 22_both distribution   
plt.hist([read_1,read_2], label=['read1', 'read2']) 
plt.yscale("log")  
plt.legend()
plt.ylabel("Frequency")
plt.xlabel("Read Length Distribution")
plt.title("Distribution of Read Lengths for 22_3H_both_S16_L008") 
plt.savefig('read_dist_22.png')
