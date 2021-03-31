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
  aakashsur/hic_qc \
  hic_qc.py \
  -b alignment.bam
```

# Details

The `hic_qc.py` command has been placed in $PATH. Easiest way to run is to have everything in $PWD, i.e. the *name sorted* .bam file. The current local directory then gets mounted to a folder in the home directory of the container, which is /root/results. To get the options for `hic_qc.py` simply run `docker run --rm aakashsur/hic_qc hic_qc.py --help`. 

For running in an HPC setting, where singularity is often the choice of containerization -  

```
singularity pull 
  docker://aakashsur/hic_qc
  
singularity run \
    --bind $PWD:/root/results/ \
    --workdir /root/results \
    hic_qc_latest.sif \
    hic_qc.py \
    -b alignment.bam
```
