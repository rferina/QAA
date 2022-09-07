#!/bin/env python

unmapped = 0
mapped = 0
# with open('/projects/bgmp/rferina/bioinfo/Bi622/QAA/22align_to_refAligned.out.sam', 'r') as sam_file:
with open('/projects/bgmp/rferina/bioinfo/Bi622/QAA/23align_to_refAligned.out.sam', 'r') as sam_file:
    for line in sam_file:
        if line[0] != '@':
            line = line.split('\t')
            flag = int(line[1])
            # check that it's primary alignment
            if((flag & 256) != 256):
                # check if read mapped
                if((flag & 4) != 4):
                    mapped += 1
                else:
                    unmapped += 1

mapped_unmapped = open("23mapped_unmapped_results.txt", "w")
mapped_unmapped.write('mapped:' + '\t' + str(mapped) + '\n' + 'unmapped:' + '\t' + str(unmapped))
mapped_unmapped.close()