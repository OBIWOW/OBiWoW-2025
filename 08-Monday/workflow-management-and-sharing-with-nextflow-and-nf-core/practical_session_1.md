Nextflow practical session 1
A simple pipeline for RNA-seq QC, using FastQC and MultiQC

In this practical session, we will get our first encounter with the basics of making a nextflow pipeline, and get practical expericence with the core concepts like workflows, processes and channels.

Open a terminal and make a directory for our new pipeline.
We will download some test data from the nf-core rnaseq pipeline

```
git clone https://github.com/nf-core/test-datasets --single-branch --branch rnaseq
```

We will be using the fastq files, which can be found here

```
$ ls test-datasets/testdata/GSE110004/*.fastq.gz
test-datasets/testdata/GSE110004/SRR6357070_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357072_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357075_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357077_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357080_1.fastq.gz
test-datasets/testdata/GSE110004/SRR6357070_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357073_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357075_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357078_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357080_2.fastq.gz
test-datasets/testdata/GSE110004/SRR6357071_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357073_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357076_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357078_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357081_1.fastq.gz
test-datasets/testdata/GSE110004/SRR6357071_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357074_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357076_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357079_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357081_2.fastq.gz
test-datasets/testdata/GSE110004/SRR6357072_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357074_2.fastq.gz	test-datasets/testdata/GSE110004/SRR6357077_1.fastq.gz	test-datasets/testdata/GSE110004/SRR6357079_2.fastq.gz
```

We have our data. Now lets start to make our pipeline.

Create a main.nf file, and a nextflow.config file. The main.nf file is where we will define our nextflow pipeline. You can copy paste from below

```
// main.nf
process FASTQC {
    container "biocontainers/fastqc:v0.11.9_cv8" // This is a container on dockerhub, nextflow will download and use this to run the process

    input:
    // input channel definition goes here

    script:
    """
    // What to run goes here
    // e.g. fastqc some_file
    """
}       

workflow {
    // This is where we connect processes using channels, which make up your pipeline
    // example
    // input_channel = Channel.Some_factory( ... )
    // PROCESS_A( input_channel )
    // PROCESS_B( PROCESS_A.out )
    
}
```

```
// nextflow.config
docker.enabled = true
```

We have already added directive in the FASTQC process, pointing to a container on dockerhub which we will use to run fastqc. In the nextflow.config we have also told nextflow to use docker to run the container.

Now we need to get our input channel. The first step of our pipeline is running fastqc on the fastq files. For this we can use Channel.fromPath(), which is one of nextflows many channel factories.

It adds files from a path using a regular expression and returns it as a nextflow channel. 
e.g. ``` ch_A = Channel.fromPath("/some/path/*.file_ext") ```

In the workflow section, create a channel that takes all the .fastq.gz files. You can make nextflow print a channel using ch_A.view()

When you are ready to have a look at your channel we can try to run nextflow on what we have currently. Before doing that, it is recommended to first run it in preview mode. This will tell nextflow to try to compile the workflow, without executing any jobs. You can do this with ```nextflow run main.nf -preview```

Does everything look good? If you didnt get an error, you can now try to run it without -preview

The results should look something like this
```
$ nextflow run main.nf

 N E X T F L O W   ~  version 25.10.2

Launching `main.nf` [high_mclean] DSL2 - revision: aecc6afca4

/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357072_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357081_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357080_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357073_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357076_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357077_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357070_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357071_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357078_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357074_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357079_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357075_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357077_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357076_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357080_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357073_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357072_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357081_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357079_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357075_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357078_1.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357074_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357071_2.fastq.gz
/Users/villadswinton/obiwow_25_practical_1.1/test-datasets/testdata/GSE110004/SRR6357070_1.fastq.gz
$
```

```
process FASTQC {
    container "biocontainers/fastqc:v0.11.9_cv8" // This is a container on dockerhub, nextflow will download and use this to run the process

    input:
    // input channel definition goes here

    script:
    """
    // What to run goes here
    // e.g. fastqc some_file
    """
}       

workflow {
    // This is where we connect processes using channels, which make up your pipeline
    // example
    // input_channel = Channel.Some_factory( ... )
    // PROCESS_A( input_channel )
    // PROCESS_B( PROCESS_A.out )
    
    ch_fastqc = Channel.fromPath("test-datasets/testdata/GSE110004/*.fastq.gz").view()   
}
```

Now we have our channel with fastq files. Lets setup the FASTQC process to process them each one at a time.

In the input section, tell the process to take path(fastq_file). path is a nextflow type, that means that nextflow will expect a path to a file. After we have defined that we can refer to this file in the script section, where we tell nextflow what to do with the input.

Try to run with -preview , this will tell you if you have any syntax mistakes in your process definition.

```
process FASTQC {
        container "biocontainers/fastqc:v0.11.9_cv8"
        
        input:
        path(fastq_file)
    
        output:

        script:
        """
        fastqc ${fastq_file}
        """
}       

workflow {
    // This is where we connect processes using channels, which make up your pipeline
    // example
    // input_channel = Channel.Some_factory( ... )
    // PROCESS_A( input_channel )
    // PROCESS_B( PROCESS_A.out )
    
    ch_fastqc = Channel.fromPath("test-datasets/testdata/GSE110004/*.fastq.gz").view()
}
```
If it is all good, then we are ready to feed our channel with fastq files into our FASTQC process. Add it to the workflow section and run (use -preview first, notice anything different from last time?)

```
process FASTQC {
        container "biocontainers/fastqc:v0.11.9_cv8"
        
        input:
        path(fastq_file)

        script:
        """
        fastqc ${fastq_file}
        """
}       

workflow {
    // This is where we connect processes using channels, which make up your pipeline
    // example
    // input_channel = Channel.Some_factory( ... )
    // PROCESS_A( input_channel )
    // PROCESS_B( PROCESS_A.out )
    
    ch_fastqc = Channel.fromPath("test-datasets/testdata/GSE110004/*.fastq.gz").view()
    FASTQC( ch_fastqc )
}
```

Success? Take a look around the ./work directory, this is where Nextflow makes working directories for each job to run in. Find one of the .html files and open it.

It is cumbersome to look at each one at a time, lets pass the ouputs on to multiQC to make a single report. In order to pass on the fastq files, we need to define the output section such that it captures the right files. Use path("*_something"), emit: output_name
You can add several named outputs

In the workflow you can extract the output channel from FASTQC, using ```FASTQC.out.output_name```
View the FASTQC output channel. Hint you can use -resume to try to reuse what has been computed previously ```nextflow run main.nf -resume```
Without  -resume, nextflow will run the whole workflow from the beginning each time.

```
process FASTQC {
        container "biocontainers/fastqc:v0.11.9_cv8"

        input:
        path(fastq_file)

        output:
        path("*_fastqc.zip"), emit: zip
        path("*_fastqc.html"), emit: html

        script:
        """
        fastqc ${fastq_file}
        """
}

workflow {
    // This is where we connect processes using channels, which make up your pipeline
    // example
    // input_channel = Channel.Some_factory( ... )
    // PROCESS_A( input_channel )
    // PROCESS_B( PROCESS_A.out )

    ch_fastqc = Channel.fromPath("test-datasets/testdata/GSE110004/*.fastq.gz").view()
    FASTQC( ch_fastqc )
}
```
MULTIQC takes all the fastQC and makes a single report. So far we have processed each file one at a time, we can use .collect() on a channel to take all its elements. 
```FASTQC.out.zip.collect()```

Now, write the MULTIQC process definition

MultiQC automatically checks for files to take in a directory, so if input is correct the script is just ```multiqc .```
The '.' is important, as it refers to the current directory.

```
process FASTQC {
        container "biocontainers/fastqc:v0.11.9_cv8"

        input:
        path(fastq_file)

        output:
        path("*_fastqc.zip"), emit: zip

        script:
        """
        fastqc ${fastq_file}
        """
}

process MULTIQC{
        container "multiqc/multiqc:pdf-latest"

        input:
        path(fastqc_zip_files)

        output:
        path("multiqc_report.html")

        script:
        """
        multiqc .
        """
}

workflow {
        // This is where we connect processes using channels, which make up your pipeline
        // example
        // input_channel = Channel.Some_factory( ... )
        // PROCESS_A( input_channel )
        // PROCESS_B( PROCESS_A.out )

        ch_fastqc = Channel.fromPath("test-datasets/testdata/GSE110004/*.fastq.gz").view()
        FASTQC( ch_fastqc )
        MULTIQC( FASTQC.out.zip.collect() )
}
```

It is slightly annoying to find your files in nextflows work directories, and actually not something you are supposed to need to look at.

Lets add an instruction telling nextflow to save the 'multiqc_report.html' to 'outputs/multiQC'. To accomplish that we add

publishDir 'outputs/multiQC'

to the MULTIQC process definition

```
process MULTIQC{
        container "multiqc/multiqc:pdf-latest"
        publishDir 'outputs/multiQC'

        input:
        path(fastqc_zip_files)

        output:
        path("multiqc_report.html")

        script:
        """
        multiqc .
        """
}
```

If we want to continue expanding our pipeline we can add Trim Galore. Trim galore takes raw reads, but since we have paired sequences, we need to redefine our fastq channel.
Luckily since nextflow is made for bioinformatics, they have channel factories for common problems like paired end sequences. 
We can use 
```
ch_fastq_paired = Channel.fromFilePairs("test-datasets/testdata/GSE110004/*_{1,2}.fastq.gz")
```

It is often practical to also keep a sample ID or other metadata associated to the files in our channel. For this we use tuples to group together multiple types in our channel
```
input:
tuple val(sample_id), path(reads)
```

Add the paired file channel, and view it. 

```
...   
process TRIM_GALORE {
        container "community.wave.seqera.io/library/cutadapt_trim-galore_pigz:a98edd405b34582d"

        input:
        tuple val(sample_id), path(reads)

        output:
        tuple val(sample_id), path("*_{1_val_1,2_val_2}.fq.gz"), emit: reads

        script:
        """
        trim_galore --paired ${sample_id}_1.fastq.gz ${sample_id}_2.fastq.gz
        """
}

workflow {
        ...
        
        ch_fastq_paired = Channel.fromFilePairs("test-datasets/testdata/GSE110004/*_{1,2}.fastq.gz").view()
        TRIM_GALORE ( ch_fastq_paired )
}
```

If we want to repeat the FASTQC and MULTIQC, now on the trimmed reads. Nextflow doesnt allow the same process to be used twice, but it does allow the same process to be imported twice under two different names. So lets make a new file called processes.nf, and move all the process definitions over there.

We can now import each of the processes from processes.nf into main.nf using 
include { hallo as sayHello } from './some/module'

```
include {
        FASTQC as FASTQC_RAW
        MULTIQC as MILTIQC_RAW
        TRIM_GALORE
        FASTQC as FASTQC_TRIM
        MULTIQC as MULTIQC_TRIM
} from './processes.nf'

workflow {
    ...
}
```
However, now that we have 2 MULTIQC processes, in order to differentiate between the reports in the output, we cant use the publisDir directive in the process definition. We will have to use another approach. This feature of nextflow is a little annoying, so i will just give you the code to copy paste. When you have the template, adding to it should be simple. Hopefully a prettier solution will come in the future.

```
workflow {
    main:
    // pipeline definition as before
    ...
    FASTQC_RAW( ch_fastqc )
    MULTIQC_RAW( FASTQC_RAW.out.zip.collect() )    

    //Define channels to publish
    publish:
    multiqc_raw = MULTIQC_RAW.out
    multiqc_trim = MULTIQC_TRIM.out
}

//Define how channels are published
output {
    multiqc_raw {
        path 'outputs/multiQC_raw'
    }
    multiqc_trim {
        path 'outputs/multiQC_trim'
    }   
}
```

Lets set up the workflow that goes TRIM_GALORE -> FASTQC -> MULTIQC

First we just need to change the FASTQC process definition in processes.nf. We need to do this because it needs to take the TRIM_GALORE output channel as input. Its a small change, just copy the TRIM_GALORE input block to the FASTQ input block and make sure the path(var) matches what is used in the script block. e.g.
```
input:
tuple val(sample_id), path(reads)

script:
"""
fastqc ${reads}
"""
```


fastqc can take several files at a time, so it just runs the paired files together instead

Now, finish the workflow to run both the trimmed and untrimmed QC





