library(ggplot2)

# Simulating some example data
set.seed(42)  # Ensure reproducibility
data <- data.frame(
  Year = rep(2001:2020, times = 5),
  Hospital = rep(paste("Hospital", 1:5), each = 20),
  Deaths = sample(100:200, 100, replace = TRUE)
)

# Visualizing the data
ggplot(data, aes(x = Year, y = Deaths, fill = Hospital)) +
  geom_area(position = 'stack') +
  theme_minimal() +
  labs(title = "Cancer Deaths by Hospital Over Time",
       x = "Year", y = "Number of Deaths",
       fill = "Hospital")
