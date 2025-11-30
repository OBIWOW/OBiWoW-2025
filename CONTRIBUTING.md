# Contributing to OBiWoW 2025

Thank you for contributing to this workshop! This guide will help you add your materials to the repository.

## Workshop Structure
```
/
├── Monday/
│   ├── workshop1-topic-name/
│   ├── workshop2-topic-name/
├── Tuesday/
│   ├── workshop1-topic-name/
...
```

Each workshop should have its own folder under the appropriate day.

## How to Add Your Materials

### Step 1: Fork the Repository
1. Click the **Fork** button at the top right of this page
2. This creates a copy of the repo in your GitHub account

### Step 2: Clone Your Fork
```bash
git clone git@github.com:YOUR-USERNAME/OBiWoW-2025.git
cd OBiWoW-2025
```

### Step 3: Create Your Workshop Folder
1. Navigate to the appropriate day folder (e.g., `Monday/`)
2. Copy the `example-workshop/` folder as a template
3. Rename it to match your workshop (e.g., `monday-metagenomics-assembly/`)
4. Add your materials:
   - Slides (PDF or PowerPoint)
   - Code/scripts
   - Data files (if small; use external links for large files)
   - Update the README.md with your workshop details

### Step 4: Commit Your Changes
```bash
git add .
git commit -m "Add materials for [Workshop Name]"
git push origin main
```

### Step 5: Submit a Pull Request
1. Go to your fork on GitHub
2. Click **Contribute** → **Open pull request**
3. Fill in the PR template with your workshop details
4. Click **Create pull request**

### Step 6: Wait for Review
One of the organizers will review and merge your PR. If changes are needed, we'll leave comments on the PR.

## Guidelines

- **File sizes:** Keep files under 50MB. For larger datasets, upload to Zenodo/Figshare and link to them
- **File formats:** PDFs for slides, common formats for code (.py, .R, .ipynb, etc.)
- **README:** Each workshop folder should have a README with:
  - Workshop title and instructor name(s)
  - Learning objectives
  - Details on a live troubleshooting session before the workshop, if you have one planned
  - Software requirements
  - Instructions for running code
  - Links to external resources

## Questions?

Contact the organizers at [email] or [open an issue](../../issues/new?template=instructor-question.md) in this repository.
