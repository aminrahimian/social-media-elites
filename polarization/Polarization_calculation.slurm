#!/bin/bash
#SBATCH --job-name="Polarization_calculation"
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=12
#SBATCH --mem-per-cpu=4G
#SBATCH --cluster=mpi
#SBATCH --partition=mpi
#SBATCH --time=1800:00


#SBATCH -o /ihome/arahimian/zhx43/misinformation/output/output.out
#SBATCH -e /ihome/arahimian/zhx43/misinformation/errors/errors.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=zhx43@pitt.edu

module load gcc/8.2.0 r/4.0.0
Rscript /ihome/arahimian/zhx43/misinformation/Polarization_calculation.R
