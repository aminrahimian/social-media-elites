#!/bin/bash
#SBATCH --job-name="simulation_run"
#SBATCH --ntasks-per-node=20
#SBATCH --nodes=6
#SBATCH --mem-per-cpu=4G
#SBATCH --cluster=mpi
#SBATCH --partition=mpi
#SBATCH --time=1800:00


#SBATCH -o /ihome/arahimian/zhx43/misinformation/output/output.out
#SBATCH -e /ihome/arahimian/zhx43/misinformation/errors/errors.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=zhx43@pitt.edu


module load gcc/8.2.0
module load python/anaconda3.9-2021.11
python3 /ihome/arahimian/zhx43/misinformation/simulation_run.py
