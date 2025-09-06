#!/usr/bin/env python

# Plot the trimmed read length distributions for both paired R1 and paired R2 reads 
# (on the same plot - yes, you will have to use Python or R to plot this. See ICA4 from Bi621). 
# You can produce 2 different plots for your 2 different RNA-seq samples. 
# There are a number of ways you could possibly do this. One useful thing your plot should show,
# for example, is whether R1s are trimmed more extensively than R2s, or vice versa. 
# Comment on whether you expect R1s and R2s to be adapter-trimmed at different rates and why.

import argparse
import gzip
import matplotlib.pyplot as plt

def get_args():
    parser = argparse.ArgumentParser(description="A script make a histogram of the read lengths of both R1 and R2.")
    parser.add_argument("-r1", "--r1_file", help="R1 input file", required=True)
    parser.add_argument("-r2", "--r2_file", help="R2 input file", required=True)
    parser.add_argument("-o", "--output", help="output png", required=True)
    return parser.parse_args()

args = get_args()
r1_file = args.r1_file
r2_file = args.r2_file
out_png = args.output

abundance_r1 = dict()
abundance_r2 = dict()

with gzip.open(r1_file, "r") as r1, gzip.open(r2_file,"r") as r2:
    line_count = 0 
    for line_r1 in r1:
        line_r2 = r2.readline()
        line_r1 = line_r1.decode("utf-8").strip('\n')
        line_count+=1
        if line_count%4 == 2:
            len_r1 = len(line_r1)
            len_r2 = len(line_r2)
            if len_r1 not in abundance_r1:
                abundance_r1[len_r1]=1
            else:
                abundance_r1[len_r1]+=1
            if len_r2 not in abundance_r2:
                abundance_r2[len_r2]=1
            else:
                abundance_r2[len_r2]+=1

x1 = abundance_r1.keys()
y1 = abundance_r1.values()
y2 = abundance_r2.values()

plt.figure(figsize=(10,6))
plt.bar(x1, y1, width = 0.4, color = "green", label = "R1")
plt.bar(x1, y2, width = 0.4, color = "purple", label = "R2")
plt.yscale('log')
plt.xlabel('Read Length')
plt.ylabel('Abundance (log)')
plt.title('Read Length Distribution for R1 and R2')
plt.legend()

plt.savefig(out_png)