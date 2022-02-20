![Build Badge](https://github.com/aakashsur/docker-hic-qc/actions/workflows/continuous-integration.yml/badge.svg)


# Hi-C QC in Docker

[Phase Genomics](https://phasegenomics.github.io/) has a rich Hi-C quality control report. This is a containerization of [hic_qc.py](https://github.com/phasegenomics/hic_qc) and it is publically available via Docker Hub.

## Usage

```
docker pull \
  aakashsur/hic_qc

docker run \
  --rm \
  --volume $PWD:/root/results \
  --workdir /root/results \
  aakashsur/hic-qc \
  hic-qc \
  -b alignment.bam
```

# Details

The `hic-qc` command has been placed in $PATH. Easiest way to run is to have everything in $PWD, i.e. the *name sorted* .bam file. The current local directory then gets mounted to a folder in the home directory of the container, which is /root/results. To get the options for `hic-qc` simply run `docker run --rm aakashsur/hic-qc hic-qc --help`. 

For running in an HPC setting, where singularity is often the choice of containerization -  

```
singularity pull 
  docker://aakashsur/hic-qc
  
singularity run \
    --bind $PWD:/root/results/ \
    --home $PWD:/root/results/ \
    hic-qc_latest.sif \
    hic-qc \
    -b alignment.bam
```
