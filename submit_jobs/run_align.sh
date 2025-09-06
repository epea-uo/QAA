#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --time=5:00:00

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn /projects/bgmp/epea/bioinfo/Bi623/PS/QAA/qualtrimmed_paired_SRR25630398_1.fastq.gz /projects/bgmp/epea/bioinfo/Bi623/PS/QAA/qualtrimmed_paired_SRR25630398_2.fastq.gz \
 --genomeDir /projects/bgmp/epea/bioinfo/Bi623/PS/QAA/align \
 --outFileNamePrefix aligned_SRR25630398_