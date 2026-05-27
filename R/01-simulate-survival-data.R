# Load libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Define sample size
n <- 300

# Simulate survival dataset
clinical_data <- tibble(
  patient_id = 1:n,
  age = rnorm(n, 60, 10),
  treatment = sample(c("A", "B"), n, TRUE),
  biomarker = rnorm(n),
  time = rexp(n, rate = 0.1),
  status = rbinom(n, 1, 0.7)
)

# Save data
write_csv(clinical_data, "data/survival_data.csv")

# Preview data
head(clinical_data)