# Intro to R and Data Handling

Follow the instructions below to prepare for the workshop.

## Install R and RStudio 

### macOS

1. Install R
	1.	Go to the CRAN R project [website](https://cran.r-project.org)
 	2.	Under Download and Install R, click Download R for macOS. 
	3.	Choose the latest R-x.x.x.pkg file (top of the page). 
	4.	Open the .pkg file once it finishes downloading. 
	5.	Follow the installer prompts → Continue → Install. 
	6.	Enter your Mac password if asked. 

2. Install RStudio
	1.	Go to the RStudio download [page](https://posit.co/download/rstudio-desktop/)
	2.	Under All Installers, download the macOS version (.dmg).
	3.	Open the downloaded .dmg file.
	4.	Drag the RStudio icon into the Applications folder.
	5.	Open RStudio from Applications.

RStudio will automatically detect your R installation.

### Windows

1. Install R
	1.	Go to the CRAN R project [website](https://cran.r-project.org)
	2.	Click Download R for Windows.
	3.	Click base.
	4.	Download the R-x.x.x-win.exe installer.
	5.	Run the installer:
	•	Choose default options unless you need something specific.
	•	Click Next until Install.

2. Install RStudio
	1.	Go to the RStudio download [page](https://posit.co/download/rstudio-desktop/)
	2.	Under All Installers, download the Windows version (.exe).
	3.	Run the installer and click through the default installation steps.
	4.	Open RStudio from the Start Menu.

RStudio will automatically detect your R installation.

You can orient yourself to RStudio using this [guide](RStudio.pdf).

## Setup RStudio Environment

1. Open Rstudio and in the bottom left corner you'll see the Files pane. Navigate to a directory where you would like to keep your work from this workshop. Select the triangle beside the "More" menu. Select "Open New Terminal Here"

2. In the bottom left pane, select the Terminal tab. You are now located in the same folder that is shown under "Files". Execute the following command to clone the repository.

```
git clone https://github.com/bnwolford/OBiWoW-2025.git
```

3. Now you can navigate to 12_Friday > from-tidy-data-... in the "Files" pane. Click on Setup.R. This will open in the top left pane.

Note: If you are unable to get this working, you can simply download the [Setup.R](Setup.R) script from this repository and place it somewhere on your computer where you can navigate to within RStudio. Then open it and pick up with #4.

4. In the top left pane, you will see a button that says Source in the top right corner. Press this and it will run the Setup.R Script. It will install missing packages and let you know if your environment is ready for the workshop.

5. In the bottom left console, read the output. If you did not pass all of the checks, something may be wrong.

Note: If this has failed, you can try to install packages in the R console by executing the following command:

```         
install.packages(c("ggplot2", "tidymodels", "dplyr", "tidyr", "readr","workflows","tune","mlbench","ranger","randomForest"))
```


