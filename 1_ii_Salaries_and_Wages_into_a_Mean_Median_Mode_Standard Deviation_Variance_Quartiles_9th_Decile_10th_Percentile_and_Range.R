setwd("D:/01 BSMRAAU/6th Semester/04 MAT 4601 Probability and Statistics/Assignment")
print(getwd())

jb <- read.csv("Cleaned_UnitedAirlinesData(updated).csv")

print(jb$Salaries.and.Wages[3:18])

# Calculate Mean, Median, Mode, Standard Deviation, Variance, Quartiles, 9th 
# Decile, 10th Percentile and Range of “Salaries and Wages”

mean <- mean(jb$Salaries.and.Wages[3:18])
median <- median(jb$Salaries.and.Wages[3:18])
standard_deviation <- sd(jb$Salaries.and.Wages[3:18])
variance <- var(jb$Salaries.and.Wages[3:18])
range <- range(jb$Salaries.and.Wages[3:18])
percentile_10 <- quantile(jb$Salaries.and.Wages[3:18], 0.10)
decile_9 <- quantile(jb$Salaries.and.Wages[3:18], 0.90)

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode <- getmode(jb$Salaries.and.Wages[3:18])

# Output the statistics
cat("Mean:", mean, "\n")
cat("Median:", median, "\n")
cat("Mode:", mode, "\n")
cat("Standard Deviation:", standard_deviation, "\n")
cat("Variance:", variance, "\n")
cat("Range:", range, "\n")
cat("10th Percentile:", percentile_10, "\n")
cat("9th Decile:", decile_9, "\n")
