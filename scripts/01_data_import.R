
# ==========================================
# Project: Gene Expression in Human Pancreatic
# Islets Associated with Type 2 Diabetes
# Script: 01_data_import.R
# ==========================================

# 1. Load required package
library(GEOquery)

# 2. Create directory for raw data
if (!dir.exists("data/raw")) {
  dir.create("data/raw", recursive = TRUE)
}

# 3. Retrieve GEO dataset
gse <- getGEO(
  "GSE38642",
  GSEMatrix = TRUE,
  getGPL = FALSE,
  destdir = "data/raw"
)

# 4. Extract expression dataset
eset <- gse[[1]]

# 5. Extract expression matrix and sample metadata
expression_matrix <- exprs(eset)
sample_metadata <- pData(eset)

# 6. Save the expression dataset
saveRDS(eset,file = "data/raw/GSE38642_eset.rds")

# 7. Display dataset information
cat("Dataset successfully imported\n")

cat("Number of probes:",nrow(expression_matrix), "\n")

cat("Number of samples:",ncol(expression_matrix), "\n")

cat("Platform:",annotation(eset), "\n")

# 8. Verify saved file
cat("Saved file exists:",file.exists("data/raw/GSE38642_eset.rds"),"\n")
