# Introduction to neural oscillations analysis

In the brain, vast networks of neurons are continuously active, exchanging information through electrical and chemical signals. The combined activity of these neurons generates rhythmic fluctuations in electrical fields, known as neural oscillations. Analysing these oscillations offers a window into ongoing neural computations and allows to distinguish between different functional brain states.   In this workshop, we will explore different techniques to analyse the oscillations from electrocorticograms (ECoG) as well as Local Field Potential (LFP) recorded in the hippocampus of sleeping and behaving rats. We will start by working through specific examples to highlight the strengths and limitations of different methods, from basic filtering to more advanced approaches such as the Fourier transform and Morlet wavelet analysis. We will then explore how spectral features relate to different brain states, for example distinguishing sleep stages or identifying signatures of motor activity. Finally, we will address common pitfalls in time-frequency analysis, such as motion artifacts and electrical noise contamination, and present strategies to mitigate them.

## Instructors
Cantin Ortiz, Letizia Signorelli
cantin.ortiz@ncmbm.uio.no, letizia.signorelli@ncmbm.uio.no

## Software Requirements

### 0. Prerequisites

Before you begin, please make sure you have [Anaconda](https://www.anaconda.com/products/distribution) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installed on your system. This will allow us to manage our Python environment and packages easily.

### 1. Create a Conda Environment

Open your terminal (or Anaconda Prompt on Windows) and run the following command to create a new environment named `obi25_neuro` with Python 3.12.

```bash
conda create -n obi25_neuro python=3.12
```

### 2. Activate the Environment
Once the environment is created, you need to activate it. You will need to do this every time you work on this project.

```bash
conda activate obi25_neuro
```
Your terminal prompt should now show (`obi25_neuro`) at the beginning, indicating that the environment is active.

### 3. Install Required Packages
With the environment active, we can now install the necessary Python libraries

Run the following command to install all the packages we'll need for the workshop:

```bash
pip install numpy matplotlib scipy jupyter
```

You are now all set up and ready to start the workshop!

### 4. Clone this repository
Clone this repository in your preferred folder

```bash
git clone https://github.com/OBIWOW/OBiWoW-2025.git
```

Then, navigate to the workshop's directory:
```bash
cd OBiWoW-2025/12-Friday/introduction-to-neural-oscillations-analysis
```

## Workshop Agenda
We will work through three Jupyter notebooks in order.

To start, activate your conda environment and run `jupyter notebook` in your terminal from this project's directory, or open the workshop folder in your favourit IDE (i.e. Visual Studio Code)

### Notebook 1: `01_basic_signal_processing.ipynb`

This notebook provides a hands-on introduction to fundamental signal processing concepts essential for analyzing electrophysiological recordings.

### Notebook 2: `02_fft_timefreq_analysis.ipynb`
Here, we'll dive into the frequency domain. You will learn how to deconstruct a signal into its constituent frequencies using the Fast Fourier Transform (FFT) and how to visualize frequency changes over time using spectrograms.

### Notebook 3: `03_sleepscoring.ipynb`
In this final notebook, we will apply all the concepts we've learned to a practical, real-world problem: building a simplified sleep scoring analysis pipeline. We will use FFT and frequency analysis to distinguish between different brain states from real neural data.