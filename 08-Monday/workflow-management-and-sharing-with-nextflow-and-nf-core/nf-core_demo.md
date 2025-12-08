# Introduction to nf-core #

We will try a few useful things and get started with nf-core.

## Build and activate the environment ##

Before we start, build and activate nf-core environment.

```bash
## Build the environment
conda env create --name nf-core

## Activate the environment
conda activate nf-core

## install nextflow and nf-core
curl -s https://get.nextflow.io | bash
echo $PATH
# depending on what is in your PATH, you can move nextflow executable there
# mv nextflow /usr/bin
# if you already have nextflow installation, move the newly installed version to the folder in the beginning of PATH
nextflow -v

pip install nf-core
```

## Help and list of pipelines ##

You can access all ```nf-core``` parameters with ```nf-core -h```.

You can see all available pipelines with ```nf-core pipelines list```.

## Interface ##

```bash
nf-core interface
```

## RNA-seq sample data ##

```
"https://github.com/nf-core/tesput-datasets/tree/rnaseq"
```

## Demo pipeline ##

Pipeline page [here](https://nf-co.re/demo/1.0.2/).

```bash
mkdir demo_pipeline
cd demo_pipeline

nextflow run nf-core/demo -r 1.0.2 -profile test,apptainer --outdir test_profile
nextflow run nf-core/demo -r 1.0.2 -profile test,conda --outdir test_profile
```

To run with their example data

```bash
nano samplesheet.csv
# paste example from website
nextflow run nf-core/demo -profile docker --input samplesheet.csv --outdir results
```

## RNA-seq pipeline ##

Pipeline page [here](https://nf-co.re/rnaseq/3.22.0/).

```bash
mkdir rnaseq_pipeline
cd rnaseq_pipeline

nextflow run nf-core/rnaseq -r 3.22.0 -profile test,singularity --outdir test_profile

```

## scRNA-seq pipeline ##

Pipeline page [here](https://nf-co.re/scrnaseq/4.1.0/).

```bash
mkdir scrnaseq_pipeline
cd scrnaseq_pipeline

VERSION=108
wget -L ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz
wget -L ftp://ftp.ensembl.org/pub/release-$VERSION/gtf/homo_sapiens/Homo_sapiens.GRCh38.$VERSION.gtf.gz

nextflow run nf-core/scrnaseq \
    -r 4.1.0 \
    --input ../samplesheet_scrnaseq.csv \
    --outdir ./results \
    --genome GRCh38 \
    --fasta Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz \
    --gtf Homo_sapiens.GRCh38.108.gtf.gz \
    -profile singularity \
    --protocol 10XV2 \
    --aligner star \
    -c custom.config

```