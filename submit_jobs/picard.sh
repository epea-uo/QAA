#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --time=5:00:00

# /usr/bin/time -v picard MarkDuplicates INPUT=aligned_SRR25630303_Aligned.sorted.out.bam \
#  OUTPUT=dedup_aligned_SRR25630303_Aligned.sorted.out.bam \
#  METRICS_FILE=SRR25630303_dup.metrics \
#  REMOVE_DUPLICATES=TRUE VALIDATION_STRINGENCY=LENIENT

/usr/bin/time -v picard MarkDuplicates INPUT=aligned_SRR25630398_Aligned.sorted.out.bam \
 OUTPUT=dedup_aligned_SRR25630398_Aligned.sorted.out.bam \
 METRICS_FILE=SRR25630398_dup.metrics \
 REMOVE_DUPLICATES=TRUE VALIDATION_STRINGENCY=LENIENT