# Methodology

## 1. Research Design

This project will adopt a quantitative, exploratory research approach using publicly available gene-expression data. The analysis will compare gene-expression profiles from human pancreatic islet samples obtained from donors with Type 2 diabetes and non-diabetic donors.

## 2. Dataset Source and Description

The study will use dataset GSE38642, titled Expression data from human pancreatic islets, obtained from the National Center for Biotechnology Information (NCBI) Gene Expression Omnibus (GEO).

The dataset contains gene-expression measurements from 63 human pancreatic islet donor samples, comprising 54 non-diabetic donors and 9 donors with Type 2 diabetes. The measurements were generated using the Affymetrix Human Gene 1.0 ST microarray platform (GPL6244).

The available processed expression measurements were summarised and normalised using the Robust Multi-array Average (RMA) method and are reported as log2 expression intensities.

## 3. Data Retrieval and Software Environment

The dataset and associated sample metadata will be retrieved using the GEOquery package in R.

The analysis will be conducted in R on an Ubuntu Linux environment. Relevant R and Bioconductor packages will be used for data retrieval, statistical analysis, annotation and visualisation.

## 4. Data Inspection and Quality Assessment

The retrieved data will be examined to understand the structure of the gene-expression matrix, gene or probe identifiers, sample characteristics and experimental group assignments.

Quality assessment will include checking for missing values, duplicate identifiers, inconsistent sample annotations and unusual expression distributions. Sample-level variation will also be examined to identify potential outliers or unusual patterns.

## 5. Exploratory Data Analysis

Exploratory analysis will be conducted to understand the distribution and variation of gene-expression measurements across the biological samples.

Visualisation techniques will include expression-distribution plots, principal component analysis (PCA) and heatmaps of selected genes.

These methods will help examine sample relationships, variation and possible patterns associated with the two experimental groups.

## 6. Differential Gene-Expression Analysis

Differential gene-expression analysis will be performed to compare pancreatic islet samples from donors with Type 2 diabetes and non-diabetic donors.

The limma package will be used to fit appropriate linear models and estimate differences in gene-expression levels between the groups. Multiple-testing correction will be applied to account for the large number of genes being examined.

Genes will be evaluated using adjusted p-values and estimated expression differences. Candidate differentially expressed genes will be selected for further examination based on the statistical results and biological relevance.

## 7. Biological Interpretation

Selected candidate genes will be examined to understand their known biological functions and potential relationships with pancreatic islet function and Type 2 diabetes.

Where appropriate, gene identifiers will be mapped to recognised gene symbols and relevant biological annotation resources will be consulted.

The interpretation will distinguish statistical evidence of differential expression from established biological knowledge. Observed associations will not be treated as proof of causation.

## 8. Limitations and Reproducibility

The analysis will be limited by the size and composition of the available dataset, particularly the relatively small number of diabetic donor samples.

Additional limitations may arise from biological variability, differences in donor characteristics, microarray measurement technology and the availability of sample metadata.

All data preparation and analytical procedures will be documented in R scripts to support transparency and reproducibility. The findings will be considered exploratory and will require independent validation before any clinical interpretation.
