#!/usr/bin/env bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=3gb
#PBS -l walltime=72:00:00
#PBS -l cput=72:00:00
#PBS -M scottdaniel@email.arizona.edu
#PBS -m ea
#PBS -j oe
#PBS -o out/

mkdir -p out

export WD=$PBS_O_WORKDIR

export REF_DIR="/rsgrps/bhurwitz/hurwitzlab/data/reference/patric_genomes/complete"

cd $REF_DIR

echo "Uploading complete patric genomes to DE to use with virsorter"

find ./ \
    -iname "*.fna" \
    -print0 | xargs -0 -I file cat file > ../all-complete.fna

if [ ! -z ../all-complete.fna ]; then
    echo "all-complete.fna is non-zero"
    echo "all is well"
else
    echo "all-complete.fna does not exist or is zero-length"
    exit 1
fi
