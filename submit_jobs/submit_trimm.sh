#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=8

/usr/bin/time -v trimmomatic PE -threads 8 trimmed_SRR25630303_1.fastq trimmed_SRR25630303_2.fastq \
  qualtrimmed_paired_SRR25630303_1.fastq.gz qualtrimmed_unpaired_SRR25630303_1.fastq.gz \
  qualtrimmed_paired_SRR25630303_2.fastq.gz qualtrimmed_unpaired_SRR25630303_2.fastq.gz \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35