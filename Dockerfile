FROM condaforge/miniforge3:24.7.1-2

# Build tools
RUN apt-get update && apt-get install build-essential -y wget \
    libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev libcurl3-dev

# Needed for R
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt install -y tzdata

WORKDIR /home/pgMAP/

COPY workflow workflow
COPY config config
COPY input input
COPY ./run_snakemake.sh run_snakemake.sh

RUN mamba env create -f workflow/envs/snakemake.yaml
