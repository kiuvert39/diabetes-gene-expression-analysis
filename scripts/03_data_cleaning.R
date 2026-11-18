eset <- readRDS("data/raw/GSE38642_eset.rds")

expression_matrix <- exprs(eset)

sample_metadata <- pData(eset)

# 2.1 extract relevant clinical data information 
clinical_data <- data.frame(
  sample_id = rownames(sample_metadata),
  Age = sample_metadata$`age:ch1`,
  BMI = sample_metadata$`bmi:ch1`,
  HbA1c = sample_metadata$`hba1c:ch1`,
  Diabetes_Status = sample_metadata$`status:ch1`
)

head(clinical_data)
str(clinical_data)

# 2.2 Replace missing-value markers with NA
clinical_data[clinical_data == "--"] <- NA
clinical_data[clinical_data == ""] <- NA

# Convert clinical measurements to numeric
clinical_data$Age <- as.numeric(clinical_data$Age)
clinical_data$BMI <- as.numeric(clinical_data$BMI)
clinical_data$HbA1c <- as.numeric(clinical_data$HbA1c)
clinical_data$Sex <- sample_metadata$`Sex:ch1`

# Convert diabetes status into a categorical variable
clinical_data$Diabetes_Status <- factor(
  clinical_data$Diabetes_Status,
  levels =  c("non-diabetic donors", "T2D donors")
)

table(clinical_data$Diabetes_Status)
levels(clinical_data$Diabetes_Status)


all(colnames(expression_matrix) == clinical_data$sample_id)
ncol(expression_matrix) == nrow(clinical_data)

# Combine prepared data
prepared_data <- list(
  expression_matrix = expression_matrix,
  clinical_data = clinical_data
)

# Save prepared dataset
saveRDS(
  prepared_data,
  file = "data/raw/GSE38642_prepared.rds"
)


cat("Prepared dataset saved successfully\n")
