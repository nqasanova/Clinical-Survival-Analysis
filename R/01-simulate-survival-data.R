library(tidyverse)

set.seed(123)

n <- 300

clinical_data <- tibble(
  patient_id = 1:n,
  age = rnorm(n, 60, 10),
  treatment = sample(c("A", "B"), n, TRUE),
  biomarker = rnorm(n),
  time = rexp(n, rate = 0.1),
  status = rbinom(n, 1, 0.7)
)

write_csv(clinical_data, "data/survival_data.csv")

head(clinical_data)