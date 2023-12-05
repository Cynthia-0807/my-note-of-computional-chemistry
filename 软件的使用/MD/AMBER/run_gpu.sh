#!/bin/sh
#BSUB -gpu "num=1"
#BSUB -q gpu
#BSUB -m gpu01
#BSUB -n 1
#BSUB -o %J.out
#BSUB -e %J.err
#BSUB -J wt1_site1
#BSUB -R "rusage[ngpus_physical=1]"

export PATH=/data/home/fxia/soft/cuda-9.0_new/bin:$PATH
export LD_LIBRARY_PATH=/data/home/fxia/soft/cuda-9.0_new/lib64:$LD_LIBRARY_PATH
#pmemd.cuda -O -i min.in -o min.out -p wt1_site1-solv.prmtop -c wt1_site1-solv.inpcrd -r min.rst 
pmemd.cuda -O -i heat.in -o heat.out -p wt1_site1-solv.prmtop -c min.rst -r heat.rst -x heat.nc 
#pmemd.cuda -O -i md.in -o md1.out -p wt1_site1-solv.prmtop -c md.rst -r md1.rst -x md1.nc
#cpptraj -i trajin -o trajout









