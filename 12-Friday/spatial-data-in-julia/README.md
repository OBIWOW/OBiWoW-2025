# Spatial Biology in Julia: From Pixels to Neighborhoods

Spatial biology is rapidly evolving, and standard analysis pipelines are still being defined. With a fun and fast programming language like **Julia**, you can test out new solutions and approaches quickly in a reactive and reproducible notebook environment.

In this workshop, we will treat images as matrices and cell data as data frames. We will leverage Julia's unique ability to handle vectorization and high-performance loops to analyze Hyperion (Imaging Mass Cytometry) data.

## 📅 Workshop Timetable (12:30 - 16:00)

We will mix interactive coding (you type along with the instructor) with a mini-hackathon challenge at the end.

| Time | Activity | Notebook |
| :--- | :--- | :--- |
| **12:30 - 12:45** | **Setup & Welcome**<br>Ensuring everyone has Julia/Pluto running and data loaded. | *N/A* |
| **12:45 - 13:15** | **Why Julia?**<br>A speed comparison against Python/R and an intro to the syntax. | `01_julia_advertisement.jl` |
| **13:15 - 14:00** | **The Image Viewer**<br>Building a reactive tool to visualize high-dimensional TIFFs. | `02_image_viewer.jl` |
| **14:00 - 14:15** | ☕ **Coffee Break** | |
| **14:15 - 15:00** | **Cell Annotation**<br>Clustering cells and isolating specific immune populations. | `03_cell_annotation.jl` |
| **15:00 - 15:45** | **Hackathon: Neighborhood Analysis**<br>Challenge: Code a proximity analysis to find T-cell/B-cell interactions. | `04_neighborhood_analysis.jl` |
| **15:45 - 16:00** | **Solutions & Wrap-up** | |

## Instructors
**Colin LaMont**
colinharrylamont@gmail.com
[lamontbiophysics.com](lamontbiophysics.com)

---

## 🛠️ Setup Instructions (Please do this BEFORE the workshop)

To ensure we can start on time, please have the software installed and data downloaded before 12:30.

### 1. File Structure
**IMPORTANT** Your folder must look exactly like this for the code to run.

```text
/Workshop_Folder
│   README.md
│   01_julia_advertisement.jl
│   02_image_viewer.jl
│   03_cell_annotation.jl
│   04_neighborhood_analysis.jl
│   ...
└── data
    ├── panel.csv
    ├── img
    │   └── [image_files.tiff]
    └── masks
        └── [mask_files.tiff]
```

### 2. Data Download
Download the Hyperion data from Figshare:
👉 **[Download Link](https://figshare.com/s/e76c4ea940c55cd65093)**

This data comes from this Myklebust lab [paper](https://ashpublications.org/bloodadvances/article/7/23/7216/497828)
special thanks to Ivana and Kanutte for providing it.

1. Unzip the downloaded file.
2. Ensure the `img`, `masks`, and `panel.csv` are placed inside a folder named `data` inside your workshop directory (see structure above).

### 3. Install Julia
We recommend installing Julia using `juliaup` (the official installer).

* **Windows:** Run `winget install julia -s msstore` OR type `juliaup` in the Microsoft Store.
* **Mac/Linux:** Copy and paste this into your terminal:
    ```bash
    curl -fsSL [https://install.julialang.org](https://install.julialang.org) | sh
    ```

### 4. Install Pluto (The Notebook Environment)
1. Open your terminal (or command prompt) and type `julia` to open the REPL.
2. Press `]` to enter Pkg mode (the prompt will turn blue).
3. Type:
   ```julia
   add Pluto
   ```
4. Press `Backspace` to return to the green `julia>` prompt.
5. Launch Pluto by typing:
   ```julia
   import Pluto; Pluto.run()
   ```
   This will open the environment in your web browser.

### 5. Pre-compilation
When you open the notebooks for the first time, Julia will download and compile the necessary packages (CairoMakie, DataFrames, etc.). **This can take 5-10 minutes.**

**Please open `01_julia_advertisement.jl` and `02_image_viewer.jl` at least once before the workshop starts to let them pre-compile!**

---

## 🆘 Troubleshooting
* **"Package not found":** Ensure you are connected to the internet when you first open the notebooks.
* **"File not found":** Check that your `data` folder is named correctly (lowercase) and is in the same directory as the `.jl` notebook files.
