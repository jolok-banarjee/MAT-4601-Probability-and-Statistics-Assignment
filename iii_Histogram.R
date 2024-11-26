setwd("D:/01 BSMRAAU/6th Semester/04 MAT 4601 Probability and Statistics/Assignment")
print(getwd())

jb <- read.csv("Cleaned_UnitedAirlinesData(updated).csv")

print(jb$Salaries.and.Wages[3:18])

# Plot histogram

# Create data for the graph.
v <- jb$Salaries.and.Wages[3:18]


# Create the histogram.
hist(v, xlab = "Salaries and Wages", col = "green",
     border = "black", xlim = c(280, 380),
     ylim = c(0, 4), breaks = 20)
