Practical session: using nf-core modules

In this session we will be making a pipeline by using nf-core, and esspecially the nf-core modules. 

Lets have a look at what we can do with nf-core. Start by using ```nf-core --help```. Look around some of the different subcommands by using the ```--help``` flag. Find out how to create a new pipeline with the nf-core template, and do that.  We want to make one without fastqc and multiqc pre-installed, because that is what we will be doing. If you have problems with using the interactive interface you can use a template.yml instead. You can use this one

```
// template.yml
name: rnaseq2
description: Our second rnaseq QC pipeline, using nf-core modules
author: me
org: obiwow
outdir: .
force: false
version: 1.0.0dev
skip_features:
    - multiqc
    - fastqc
```


Now we should have a new directory with the full nf-core scaffolding in place. An nf-core pipeline has a lot of boilerplate, and can be rather complex to navigate. Take a look around, try to see if there are things you can recognize from before, and look into these files. 
 
Maybe you found the main.nf file in the root of our nf-core pipeline directory. Notice the include statements, the different workflow blocks and see if you can figure out the structure. Nf-core comes with 2 extra subworkflows, PIPELINE_INITIALISATION and PIPELINE_COMPLETION. The main.nf is just our entrypoint, and puts together the subworkflows when we are ready to run our pipeline. Our pipline is going to be defined in ```workflows/name.nf```.
PIPELINE_INITIALISATION, does several things, but most importantly it handels the samplesheet.csv file and outputs the corresponding channel. Using a samplesheet is standard practise in most nf-core pipelines, and the samplesheet channel is the expected input to many of the nf-core modules.

First we will need to make our own samplesheet.csv and set up the input in the nextflow.config to point to it. We can look at one of the samplesheets that comes with the template, located at ```assets/samplesheet.csv``` for inspiration. Lets reuse the data we downloaded in the first practical session.

Now lets install our modules. We can find availible modules online at https://nf-co.re/modules/

```
nf-core modules install fastqc
nf-core modules install multiqc
```

We can find our newly installed modules at ```./modules/nf-core/```
Have a look at their .nf files, to see what their input and output channels are. You can also use ```nf-core modules info fastqc```.

Now we can start putting together our processes into a pipeline like we did in the earlier session (remember to include the modules). Since the FASTQC process is outputting the .zip in a tuple with the metadata map, we need to only collect the file without the map. For this purpose we can use ```.collect{it[1]}```, which tells the collect method to iterate over each element in the channel and only take the element in position 1 of the tuple (the index starts at 0).
MultiQC has several optional input channels (https://nf-co.re/modules/multiqc/). We dont care about these at the moment, so we just give empty lists ```[]``` instead. 

In the end of the workflow block, we need to add our outputs to the emit section. This is how outputs from subworkflows are defined.
```
emit:
    multiqc_report = MULTIQC.out.report
```
Finally, before we run the pipeline, we should define and output directory in the config file.
To run our pipeline we call ```nextflow run main.nf```, like we did before
