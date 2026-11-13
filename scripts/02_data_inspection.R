# ==========================================
# Project: Gene Expression in Human Pancreatic
# Islets Associated with Type 2 Diabetes
# Script: 02_data_inspection.R
# ==========================================

# Load required package
library(GEOquery)

# Load previously imported dataset
eset <- readRDS("data/raw/GSE38642_eset.rds")

# Extract sample metadata
sample_metadata <- pData(eset)


diabetes_distribution <- table(
  sample_metadata$`status:ch1`
)

diabetes_distribution_df <- as.data.frame(diabetes_distribution)

colnames(diabetes_distribution_df) <- c(
  "Diabetes_Status",
  "Frequency"
)

sex_distribution <- table(
  sample_metadata$`Sex:ch1`
)

sex_distribution_df <- as.data.frame(sex_distribution)

colnames(sex_distribution_df) <- c(
  "Sex",
  "Frequency"
)


diabetes_sex_distribution <- table(
  sample_metadata$`status:ch1`,
  sample_metadata$`Sex:ch1`
)

diabetes_sex_distribution_df <- as.data.frame(
  diabetes_sex_distribution
)

colnames(diabetes_sex_distribution_df) <- c(
  "Diabetes_Status",
  "Sex",
  "Frequency"
)

View(diabetes_distribution_df)

View(sex_distribution_df)

View(diabetes_sex_distribution_df)


# ==========================================
# 5. Inspect Clinical Metadata
# ==========================================
clinical_metadata <- sample_metadata[, c(
  "age:ch1",
  "bmi:ch1",
  "hba1c:ch1"
)]

colnames(clinical_metadata) <- c(
  "Age",
  "BMI",
  "HbA1c"
)
View(clinical_metadata)


# ==========================================
# 6. Check Missing Clinical Metadata
# ==========================================

missing_clinical_data <- colSums(
  clinical_metadata == "--",
  na.rm = TRUE
)

missing_clinical_data_df <- data.frame(
  Variable = names(missing_clinical_data),
  Missing_Values = as.integer(missing_clinical_data),
  Available_Values = nrow(clinical_metadata) -
    as.integer(missing_clinical_data)
)

missing_clinical_data_df$Percentage_Missing <- round(
  missing_clinical_data_df$Missing_Values /
    nrow(clinical_metadata) * 100,
  2
)
colSums(is.na(clinical_metadata))

View(missing_clinical_data_df)

# ==========================================
# 7. Inspect Gene Expression Matrix
# ==========================================

expression_matrix <- exprs(eset)

class(expression_matrix)

dim(expression_matrix)

typeof(expression_matrix)

head(rownames(expression_metrix))

head(colnames(expression_metrix))

# ==========================================
# 8. Inspect Expression Values
# ==========================================

range(expression_matrix, na.rm =TRUE)

summary(as.vector(expression_matrix))

sum(is.na(expression_matrix))


# ==========================================
# 9. Inspect Expression Distribution by Sample
# ==========================================
png(
  "plots/expression_distribution.png",
  width = 2400,
  height = 1200,
  res = 200
)

# Generate boxplot
boxplot(
  expression_matrix,
  main = "Gene Expression Distribution Across Samples",
  xlab = "Samples",
  ylab = "RMA Expression Values",
  outline = TRUE,
  las = 2
)

# Close image device and save plot
dev.off()

# ==========================================
# 10. Check Sample ID Consistency
# ==========================================

sample_ids_expression <- colnames(expression_matrix)
sample_ids_metadata <- rownames(sample_metadata)

all(sample_ids_expression == sample_ids_metadata)

length(sample_ids_expression) == nrow(sample_metadata)

# ==========================================
# 11. Prepare Clinical Variables for Inspection
# ==========================================

clinical_numeric <- clinical_metadata

clinical_numeric[clinical_numeric == "--"] <- NA

clinical_numeric$Age <- as.numeric(clinical_numeric$Age)
clinical_numeric$BMI <- as.numeric(clinical_numeric$BMI)
clinical_numeric$HbA1c <- as.numeric(clinical_numeric$HbA1c)

colSums(is.na(clinical_numeric))
str(clinical_numeric)

summary(clinical_numeric)
# ==========================================
# 12. Clinical Descriptive Statistics
# ==========================================

clinical_summary <- data.frame(
  Variable = c("Age", "BMI", "HbA1c"),
  
  Count = c(
    sum(!is.na(clinical_numeric$Age)),
    sum(!is.na(clinical_numeric$BMI)),
    sum(!is.na(clinical_numeric$HbA1c))
  ),
  
  Mean = c(
    mean(clinical_numeric$Age, na.rm = TRUE),
    mean(clinical_numeric$BMI, na.rm = TRUE),
    mean(clinical_numeric$HbA1c, na.rm = TRUE)
  ),
  
  Median = c(
    median(clinical_numeric$Age, na.rm = TRUE),
    median(clinical_numeric$BMI, na.rm = TRUE),
    median(clinical_numeric$HbA1c, na.rm = TRUE)
  ),
  
  Minimum = c(
    min(clinical_numeric$Age, na.rm = TRUE),
    min(clinical_numeric$BMI, na.rm = TRUE),
    min(clinical_numeric$HbA1c, na.rm = TRUE)
  ),
  
  Maximum = c(
    max(clinical_numeric$Age, na.rm = TRUE),
    max(clinical_numeric$BMI, na.rm = TRUE),
    max(clinical_numeric$HbA1c, na.rm = TRUE)
  )
)

# Round numerical results to 2 decimal places
clinical_summary[, 3:6] <- round(
  clinical_summary[, 3:6], 2
)

View(clinical_summary)

# ==========================================
# 13. Clinical Characteristics by Diabetes Status
# ==========================================

clinical_group_data <- data.frame(
  Diabetes_Status = sample_metadata$`status:ch1`,
  clinical_numeric
)


aggregate(
  cbind(Age, BMI) ~ Diabetes_Status,
  data = clinical_group_data,
  FUN = mean
)


aggregate(
  HbA1c ~ Diabetes_Status,
  data = clinical_group_data,
  FUN = function(x) mean(x, na.rm = TRUE)
)

aggregate(
  !is.na(HbA1c) ~ Diabetes_Status,
  data = clinical_group_data,
  FUN = sum
)

# Open PNG graphics device
png(
  "plots/clinical_distributions.png",
  width = 2400,
  height = 1200,
  res = 200
)

# Display two plots side by side
par(mfrow = c(1, 2))

boxplot(
  Age ~ Diabetes_Status,
  data = clinical_group_data,
  main = "Age by Diabetes Status",
  xlab = "Diabetes Status",
  ylab = "Age (years)",
  col = "lightblue"
)

boxplot(
  BMI ~ Diabetes_Status,
  data = clinical_group_data,
  main = "BMI by Diabetes Status",
  xlab = "Diabetes Status",
  ylab = "BMI",
  col = "lightgreen"
)

# Restore plotting layout
par(mfrow = c(1, 1))

# Save and close image
dev.off()

png(
  "plots/clinical_HbA1c.png",
  width = 2400,
  height = 1200,
  res = 200
)

boxplot(
  HbA1c ~ Diabetes_Status,
  data = clinical_group_data,
  main = "HbA1c Distribution by Diabetes Status",
  xlab = "Diabetes Status",
  ylab = "HbA1c (%)",
  col = c("lightblue", "lightgreen")
)

# Save and close image
dev.off()

# Identify non-diabetic donors with HbA1c above 6.5%

subset(
  clinical_group_data,
  Diabetes_Status == "non-diabetic donors" & HbA1c > 6.5,
  select = c(Diabetes_Status, HbA1c)
)

