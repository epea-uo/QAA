#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --time=5:00:00

#/usr/bin/time -v samtools view -b aligned_SRR25630398_Aligned.out.sam > aligned_SRR25630398_Aligned.out.bam
# /usr/bin/time -v samtools sort aligned_SRR25630303_Aligned.out.sam > aligned_SRR25630303_Aligned.sorted.out.sam
# /usr/bin/time -v samtools sort aligned_SRR25630398_Aligned.out.sam > aligned_SRR25630398_Aligned.sorted.out.sam

/usr/bin/time -v samtools view -h dedup_aligned_SRR25630303_Aligned.sorted.out.bam > dedup_aligned_SRR25630303_Aligned.sorted.out.sam
/usr/bin/time -v samtools view -h dedup_aligned_SRR25630398_Aligned.sorted.out.bam > dedup_aligned_SRR25630398_Aligned.sorted.out.sam