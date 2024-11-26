# Loading necessary packages
if (!require(readxl)) install.packages("readxl")
if (!require(tidyverse)) install.packages("tidyverse")
library(readxl)
library(tidyverse)

# Set working directory and load the cleaned data
setwd("D:/01 BSMRAAU/6th Semester/04 MAT 4601 Probability and Statistics/Assignment")
jb <- read.csv("Cleaned_UnitedAirlinesData(updated).csv")

# Check the structure of the data to confirm columns for regression
str(jb)

# Assuming 'Salaries and Wages' is the dependent variable, and others are independent.
# Ensure the column names match the dataset

# Create a linear model for multiple regression
lm_model <- lm(Salaries_and_Wages ~ Pilot_Training + Benefits_and_Payroll_Taxes + Per_Diem_Personnel + 
                 Maintenance + Aircraft_Ownership + Indices + Daily_Utilization_per_Aircraft, data = jb)

# View the summary of the regression model
summary(lm_model)

# i) Regression Equation
# This can be written as:
# Salaries_and_Wages = (Intercept) + (Pilot_Training coefficient) + (Benefits_and_Payroll_Taxes coefficient) + ...

# ii) R-squared value
cat("R-squared value: ", summary(lm_model)$r.squared)

# iii) Standard Error of the Estimate
cat("Standard Error of Estimate: ", summary(lm_model)$sigma)

# iv) Correlation Matrix
cor_matrix <- cor(jb[, c("Pilot_Training", "Benefits_and_Payroll_Taxes", "Per_Diem_Personnel", 
                         "Maintenance", "Aircraft_Ownership", "Indices", "Daily_Utilization_per_Aircraft")])
print(cor_matrix)

# v) Global Test for the set of independent variables
# ANOVA test for global significance
anova_lm <- anova(lm_model)
print(anova_lm)

# vi) Hypothesis Test for each independent variable
# Checking p-values for each coefficient to decide on deletion of variables
cat("P-values for each independent variable:\n")
summary(lm_model)$coefficients[,4]

# If any variable has a p-value greater than 0.05, consider removing it.

# vii) New Multiple Regression Equation
# After checking p-values, if some variables are removed, re-run the model:
# For example, if 'Per_Diem_Personnel' is not significant, run without it:
lm_model_updated <- lm(Salaries_and_Wages ~ Pilot_Training + Benefits_and_Payroll_Taxes + 
                         Maintenance + Aircraft_Ownership + Indices + Daily_Utilization_per_Aircraft, data = jb)
summary(lm_model_updated)

