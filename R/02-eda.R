# Load libraries
library(tidyverse)

# Load data
data <- read_csv("data/survival_data.csv")

# Inspect data
glimpse(data)

# Summary by treatment
data |>
  group_by(treatment) |>
  summarise(
    n = n(),
    mean_time = mean(time),
    event_rate = mean(status)
  )