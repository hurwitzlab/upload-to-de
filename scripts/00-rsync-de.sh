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

cd $WD

echo "Uploading complete patric genomes to DE to use with virsorter"

irsync -r /rsgrps/bhurwitz/hurwitzlab/data/reference/patric_genomes/complete \
    i:/iplant/home/scottdaniel/complete_patric_genomes
