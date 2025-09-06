#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=8

/usr/bin/time -v python ./make_hist_r1_r2.py -r1 qualtrimmed_paired_SRR25630398_1.fastq.gz -r2 qualtrimmed_paired_SRR25630398_2.fastq.gz -o qualtrimmed_paired_SRR25630398_hist