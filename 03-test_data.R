# Year Coverage Test
test_1 <- all(sort(unique(data$Year)) == 2000:2019)

# Hospital Coverage Test
test_2 <- all(table(data$Hospital) == length(2000:2019))

# Non-negative Deaths Test
test_3 <- all(data$Deaths >= 0)

# Data Completeness Test
test_4 <- nrow(data) == length(2000:2019) * 5

# Predictor Range Checks
test_5a <- all(data$Hospital_Capacity >= 100 & data$Hospital_Capacity <= 500)
test_5b <- all(data$Funding >= 5 & data$Funding <= 20)
test_5c <- all(data$Oncologists >= 10 & data$Oncologists <= 50)

# Logical Check on Death Counts vs Hospitality Capacity
# Assuming higher capacity should not have fewer deaths consistently across years
test_6 <- all(diff(aggregate(Deaths ~ Hospital_Capacity, data = data, sum)$Deaths) >= 0)

# Check for Unusual Yearly Changes in Death
# Check for any year where deaths increased or decreased by more than 50% from the previous year
test_7 <- all(abs(diff(aggregate(Deaths ~ Year, data = data, sum)$Deaths)) / lag(aggregate(Deaths ~ Year, data = data, sum)$Deaths, 1) < 0.5)

# Data Types Check
test_8a <- is.integer(data$Year) || is.numeric(data$Year)
test_8b <- is.factor(data$Hospital)
test_8c <- is.numeric(data$Hospital_Capacity)
test_8d <- is.numeric(data$Funding)
test_8e <- is.numeric(data$Oncologists)
test_8f <- is.numeric(data$Deaths)

# Check for Missing Data
test_9 <- !any(is.na(data))

# Check for Plausible Correlation Between Funding and Deaths
# Assuming higher funding should correlate with fewer deaths, on average
correlation <- cor(data$Funding, data$Deaths)
test_10 <- correlation < 0

# Summary of Tests
tests_passed <- c(test_1, test_2, test_3, test_4, test_5a, test_5b, test_5c, test_6, test_7, test_8a, test_8b, test_8c, test_8d, test_8e, test_8f, test_9, test_10)
summary_passed <- all(tests_passed)
print(summary_passed)
