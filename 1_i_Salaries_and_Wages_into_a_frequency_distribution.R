setwd("D:/01 BSMRAAU/6th Semester/04 MAT 4601 Probability and Statistics/Assignment")
print(getwd())

#
jb <- read.csv("Cleaned_UnitedAirlinesData(updated).csv")
#print(head(jb))


print(jb$Salaries.and.Wages[3:18])

Salaries.and.Wages[3:18] <- as.numeric(Salaries.and.Wages[3:18])

#
breaks <- seq(290,370,by = 20 )

print(breaks)
#student ID: 16 (Let), But my student ID is 26

freq_table <- cut(Salaries.and.Wages[3:18], breaks = breaks, right = FALSE)
frequency <- table(freq_table)

# Create a frequency table data frame
freq_df <- data.frame(Class = names(frequency), Frequency = as.vector(frequency))
print(freq_df)
