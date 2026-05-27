library(survival)
library(survminer)
library(tidyverse)

data <- read_csv("data/survival_data.csv")  # load data

fit <- survfit(Surv(time, status) ~ treatment, data = data)  # KM model

km_plot <- ggsurvplot(
  fit,
  data = data,
  pval = TRUE,         # log-rank test
  risk.table = TRUE    # patients at risk
)

ggsave("report/kaplan_meier.png", km_plot$plot)  # save plot