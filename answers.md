## Part 1

1. Using FastQC via the command line on Talapas, produce plots of quality score distributions for R1 and R2 reads. Also, produce plots of the per-base N content, and comment on whether or not they are consistent with the quality score plots.

**22_3H read 1: There is only a small amount of N content for the first base, and the average quality score is lower at the first base, so this is consistent. It is also expected to have lower quality for the first base.**
**22_3H read 2: There is only a small amount of N content for the first base, and the average quality score is again lower at the first base, so these graphs are consistent.**
**23_4A read 1:**
**23_4A read 2:**

2. Run your quality score plotting script from your Demultiplexing assignment. (Make sure you're using the "running sum" strategy!!) Describe how the FastQC quality score distribution plots compare to your own. If different, propose an explanation. Also, does the runtime differ? If so, why?

**The runtime differed for the quality score distributions. My demultiplexing program took 1 minute and 10 seconds for the 22_3H files, and 13 minutes for the 23_4A files, which makes sense as the 23_4A files are longer. The FASTQC program took 5 minutes to process all 4 files. The FASTQC program is likely more optimized than my code, so the runtime is faster.**


3. Comment on the overall data quality of your two libraries.
**My demultiplex program graphs show that the 22_3H read 1 and read 2 data all has average quality scores above 30. The 23_4A read 1 data also has all average quality scores above 30, but the read 2 data had the first base pair's average below 30, but the rest above 30.**

## Part 2

1. Using cutadapt, properly trim adapter sequences from your assigned files. Be sure to read how to use cutadapt. Use default settings. What proportion of reads (both R1 and R2) were trimmed?

**R1:**
**R2:**
**option for paired end reads?**
2. Try to determine what the adapters are on your own. If you cannot (or if you do, and want to confirm), click here to see the actual adapter sequences used. Sanity check: Use your Unix skills to search for the adapter sequences in your datasets and confirm the expected sequence orientations. Report the commands you used, the reasoning behind them, and how you confirmed the adapter sequences.

**I confirmed the adapter sequence with**

3. Plot the trimmed read length distributions for both R1 and R2 reads (on the same plot). You can produce 2 different plots for your 2 different RNA-seq samples. There are a number of ways you could possibly do this. One useful thing your plot should show, for example, is whether R1s are trimmed more extensively than R2s, or vice versa. Comment on whether you expect R1s and R2s to be adapter-trimmed at different rates.

****

## Part 3

1. Using your script from PS8 in Bi621, report the number of mapped and unmapped reads from each of your 2 sam files.
**Mapped:**
**Unmapped:**

2. Count reads that map to features using htseq-count. You should run htseq-count twice: once with --stranded=yes and again with --stranded=reverse

3. Demonstrate convincingly whether or not the data are from “strand-specific” RNA-Seq libraries. Include any comands/scripts used. Briefly describe your evidence, using quantitative statements (e.g. "I propose that these data are/are not strand-specific, because X% of the reads are y, as opposed to z."). Hint - recall ICA4 from Bi621.