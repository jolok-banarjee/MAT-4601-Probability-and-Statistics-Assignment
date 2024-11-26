setwd("D:/01 BSMRAAU/6th Semester/04 MAT 4601 Probability and Statistics/Assignment")
print(getwd())

jb <- read.csv("Cleaned_UnitedAirlinesData(updated).csv")

print(jb$Salaries.and.Wages[3:18])

# Create data for the graph.
geeks<- jb$V21
labels <- jb$Salaries.and.Wages

# Plot the chart with title and rainbow 
# color pallet.
pie(geeks, labels, main = "Maintenance and Load factor",
    col = rainbow(length(geeks)))

# Plot histogram
ggplot(data = data.frame(Salaries = jb$Salaries.and.Wages), aes(x = Salaries)) +
  geom_histogram(binwidth = 10000, fill = "blue", color = "black") +
  labs(title = "Histogram of Salaries and Wages", x = "Salaries and Wages", y = "Frequency")

# Pie chart for Maintenance
maintenance <- jb$V21  # Replace with actual column name
pie_data <- data.frame(Category = factor(1:length(maintenance)), Values = maintenance)

ggplot(pie_data, aes(x = "", y = Values, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Pie Chart of Maintenance") +
  theme_void()

# Bar chart for Load Factor
load_factor <- jb$V21`  # Replace with actual column name

ggplot(data.frame(LoadFactor = load_factor), aes(x = factor(LoadFactor), y = LoadFactor)) +
  geom_bar(stat = "identity", fill = "purple") +
  labs(title = "Bar Diagram of Load Factor", x = "Load Factor", y = "Frequency")

# Box plot for Purchased Goods, Aircraft Ownerships, and Daily Utilization per Aircraft
purchased_goods <- jb$V8`
aircraft_ownerships <- jb$V21
daily_utilization <- jb$V7

boxplot(purchased_goods, aircraft_ownerships, daily_utilization,
        names = c("Purchased Goods", "Aircraft Ownerships", "Daily Utilization"),
        main = "Box Plots of Selected Variables",
        col = c("orange", "green", "cyan"))
