
# Project Limitations

This document records the limitations and challenges identified during each stage of the project. It will be updated as the analysis progresses.

## Stage 1: Data Import

- The project uses an existing publicly available dataset from GEO rather than collecting new biological samples.
- The analysis is dependent on the quality, completeness and accuracy of the information provided with the original dataset.

## Stage 2: Data Inspection

### 2.1 Sample Characteristics

- The dataset contains an imbalanced number of samples: 54 non-diabetic donors and only 9 T2D donors.
- The small T2D group may make comparisons more sensitive to individual sample variations.

### 2.2 Clinical Data

- HbA1c measurements are missing for 12 of the 63 donors (19.05%), limiting analyses involving this variable.
- Age and BMI are available for all samples, but differences in these characteristics may influence comparisons between diabetes groups.

### 2.3 Clinical Classification

- Three samples labelled as non-diabetic have HbA1c values above 6.5%.
- The available dataset information does not explain this discrepancy.
- Original diabetes-status classifications were retained because there was insufficient evidence to justify changing them.

### 2.4 Expression Data

- The expression values were already processed and normalised using RMA before being obtained from GEO.
- Raw microarray data were not used in this project, so the original preprocessing and normalisation procedures could not be independently assessed.

### 2.5 Visual Inspection and Data Quality Checks

- Visual inspection of expression distributions can identify obvious differences between samples but cannot establish that all technical quality issues are absent.
- The checks performed at this stage were exploratory and did not constitute a complete microarray quality-control assessment.


## Stage 3: Data Preparation

- The 12 missing HbA1c measurements were retained as missing values rather than estimated or imputed.
- Clinical data preparation was limited to the variables required for the project. No additional clinical variables were incorporated into the prepared dataset.
- The original diabetes-status classifications were preserved despite the previously identified HbA1c discrepancies.


## Stage 4: Exploratory Data Analysis

- The comparison between diabetes groups was based on descriptive statistics, without formal statistical significance testing.
- The dataset contains only 9 T2D donors compared with 54 non-diabetic donors, which limits the reliability of group comparisons.
- The analysis identified differences in expression values but did not establish their biological significance.
- Expression feature identifiers were not mapped to gene symbols, limiting biological interpretation.

## Stage 5: Visualisation

- The visualisations provide exploratory views of the data but cannot independently establish statistical significance or biological relationships.
- Only selected expression features were visualised individually.