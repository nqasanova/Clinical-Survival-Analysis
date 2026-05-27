library(survival)
library(tidyverse)

data <- read_csv("data/survival_data.csv")  # load data

cox_model <- coxph(
  Surv(time, status) ~ age + treatment + biomarker,
  data = data
)

summary(cox_model)  # model results