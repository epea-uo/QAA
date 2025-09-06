#!/usr/bin/env python

import re
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="A program to coun the number of mapped and unmapped reads in a sam file")
    parser.add_argument("-i", "--input", help="input file", required=True)
    return parser.parse_args()

args = get_args()
samfile = args.input
mapped_reads = 0
unmapped_reads = 0
#reads_seen = set()

with open(samfile,"r") as sam:
    for line in sam:
        if line.startswith("@") ==False:
            flag = re.search(r'^([^\t]+)\t(\d+)', line)
            #rname = str(flag.group(1))
            #if rname not in reads_seen:
            flag = int(flag.group(2))
            if(flag & 256):
                continue
            if((flag & 4) != 4):
                mapped_reads +=1
            else:
                unmapped_reads+=1
            #reads_seen.add(rname)


print(f'File proccessed: {samfile}')
print(f'Number of reads mapped: {mapped_reads}')
print(f'Number of reads unmapped: {unmapped_reads}')