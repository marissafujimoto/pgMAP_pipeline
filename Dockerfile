FROM condaforge/miniforge3:24.7.1-2

WORKDIR /home/pgMAP/

COPY workflow workflow
COPY config config
COPY input input
COPY ./run_snakemake.sh run_snakemake.sh

RUN mamba env create -f workflow/envs/snakemake.yaml
