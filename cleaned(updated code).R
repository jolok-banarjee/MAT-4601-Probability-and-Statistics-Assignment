# Install the readxl package if not already installed
if (!require(readxl)) install.packages("readxl")
library(readxl)

# Setting Working Directory
setwd("D:/01 BSMRAAU/6th Semester/04 MAT 4601 Probability and Statistics/Assignment")
print(getwd())

# Reading the .xls File
jb <- read_excel("2. United Airlines Aircraft Operating Statistics- Cost Per Block Hour (Unadjusted).xls")
print(head(jb))  # Display the first few rows

# Viewing Column Names
print(names(jb))

# Transposing Rows into Columns
jb1 <- as.data.frame(t(jb))
print(head(jb1))  # Check the transposed data

# Data Cleaning
# Removing commas
jb1$V1 <- gsub(",", "", jb1$V1)
print(jb1$V1)

# Removing dollar signs
jb1$V1 <- gsub("\\$", "", jb1$V1)
print(jb1$V1)

# Convert Cleaned Column to Numeric (if needed)
jb1$V1 <- as.numeric(jb1$V1)
print(sum(is.na(jb1$V1)))  # Check for NA values

# Save the Cleaned Data
output_path <- "D:/01 BSMRAAU/6th Semester/04 MAT 4601 Probability and Statistics/Assignment/Cleaned_UnitedAirlinesData(updated).xlsx"
write.csv(jb1, output_path, row.names = FALSE)
print(paste("Data saved at:", output_path))
