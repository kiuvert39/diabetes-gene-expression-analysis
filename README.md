
# Diabetes Gene Expression Analysis Using R

## Project Overview

This project explores gene expression data from human pancreatic islet samples to examine differences between non-diabetic donors and donors with Type 2 Diabetes (T2D).

The project was developed as a practical introduction to R programming, statistical data analysis and bioinformatics. It focuses on learning how to work with real biological datasets, prepare data, perform exploratory analysis and visualise results.

## Dataset

The analysis uses the publicly available **GSE38642** dataset from the Gene Expression Omnibus (GEO).

- Samples: 63 human pancreatic islet samples
- Non-diabetic donors: 54
- T2D donors: 9
- Expression features: 18,808
- Platform: Affymetrix Human Gene 1.0 ST (GPL6244)

The expression data were already processed and normalised using Robust Multi-array Average (RMA).

Dataset: [GSE38642 – NCBI GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE38642)

## Tools and Technologies

- R
- RStudio
- GEOquery
- Base R statistical and visualisation functions

## Project Scope

The project covers:

- Importing and inspecting biological data.
- Extracting and preparing clinical information.
- Handling missing values and checking sample alignment.
- Calculating descriptive expression statistics.
- Comparing expression values between diabetes groups.
- Creating visualisations to explore observed differences.

This is an introductory exploratory analysis, not a comprehensive differential gene expression study or clinical investigation.

## Repository Structure

```text
diabetes-gene-expression-analysis/
├── data/
│   └── raw/
├── documentation/
│   ├── project_rationale.md
│   ├── methodology.md
│   ├── findings.md
│   └── limitations.md
├── scripts/
│   ├── 01_data_import.R
│   ├── 02_data_inspection.R
│   ├── 03_data_cleaning.R
│   ├── 04_exploratory_analysis.R
└── README.md
```

## Documentation

For more details about the project:

- [Project Rationale](documentation/project_rationale.md)
- [Methodology](documentation/methodology.md)
- [Findings](documentation/findings.md)
- [Limitations](documentation/limitations.md)

## Purpose

This project represents an independent learning exercise undertaken to develop practical skills in R, statistics and introductory bioinformatics, while exploring the application of data analysis to diabetes-related biological data.
