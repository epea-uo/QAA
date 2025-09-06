#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --time=1:00:00

/usr/bin/time -v ./nucl_mean_dist.py -i SRR25630303_1.fastq -o SRR25630303_1_hist.png