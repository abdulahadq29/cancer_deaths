# Setting the seed for reproducibility
set.seed(42)

# Basic parameters
years <- 2000:2019
n_years <- length(years)
n_hospitals <- 5

# Simulating predictor variables
hospital_capacity <- sample(100:500, n_hospitals, replace = TRUE)  # Number of beds
funding <- sample(5:20, n_years * n_hospitals, replace = TRUE)  # Funding in millions
oncologists <- sample(10:50, n_years * n_hospitals, replace = TRUE)  # Number of oncologists

# Simulating the number of deaths based on the predictors with some noise
deaths <- 0.05 * rep(hospital_capacity, each = n_years) - 2 * funding + 0.1 * oncologists + rnorm(n_years * n_hospitals, mean = 0, sd = 10)

# Creating the dataset
data <- data.frame(Year = rep(years, times = n_hospitals),
                   Hospital = rep(factor(1:n_hospitals), each = n_years),
                   Hospital_Capacity = rep(hospital_capacity, each = n_years),
                   Funding = funding,
                   Oncologists = oncologists,
                   Deaths = round(deaths))

# Ensuring no negative deaths
data$Deaths[data$Deaths < 0] <- 0

