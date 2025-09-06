#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --time=5:00:00

/usr/bin/time -v htseq-count --stranded=yes -i gene_id dedup_aligned_SRR25630398_Aligned.sorted.out.sam ./align/campylomormyrus.gtf > counts_stranded_SRR25630398
/usr/bin/time -v htseq-count --stranded=reverse -i gene_id dedup_aligned_SRR25630398_Aligned.sorted.out.sam ./align/campylomormyrus.gtf > counts_reverse_SRR25630398