# Load prepared dataset
prepared_data <- readRDS("data/raw/GSE38642_prepared.rds")

expression_matrix <- prepared_data$expression_matrix
clinical_data <- prepared_data$clinical_data

# Confirm dimensions
dim(expression_matrix)
dim(clinical_data)


# Calculate expression summary statistics
gene_mean <- rowMeans(expression_matrix)
gene_median <- apply(expression_matrix, 1, median)
gene_sd <- apply(expression_matrix, 1, sd)


expression_summary <- data.frame(
  Feature_ID = rownames(expression_matrix),
  Mean = gene_mean,
  madian = gene_median,
  stanard_Deviation = gene_sd
)


head(expression_summary)

# Identify samples belonging to each diabetes group
non_diabetic_samples <- clinical_data$Diabetes_Status == "non-diabetic donors"
t2d_samples <- clinical_data$Diabetes_Status == "T2D donors"

# Calculate average expression for each group
non_diabetic_mean <- rowMeans(
  expression_matrix[, non_diabetic_samples]
)

t2d_mean <- rowMeans(
  expression_matrix[, t2d_samples]
)

# Calculate the difference between the two groups
mean_difference <- t2d_mean - non_diabetic_mean
