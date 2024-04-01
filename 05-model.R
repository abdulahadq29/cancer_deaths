library(rstanarm)

# Assuming data has a predictor we'll call "Funding" for illustration
# Simulate some "Funding" data for the sake of example
data$Funding <- runif(100, 5, 20)

# Building a Bayesian model predicting Deaths based on Funding
# Note: Ensure your data and model complexity is appropriate for Bayesian analysis
model <- stan_glm(Deaths ~ Funding, data = data, family = gaussian(), 
                  prior = normal(0, 2.5), chains = 2, iter = 2000, seed = 42)

print(model)
