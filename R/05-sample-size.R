library(survival)
library(tidyverse)

simulate_power <- function(n) {
  
  data <- tibble(
    time = rexp(n, 0.1),
    status = rbinom(n, 1, 0.7),
    group = sample(c(0, 1), n, TRUE)
  )
  
  model <- coxph(Surv(time, status) ~ group, data = data)
  
  p_value <- summary(model)$coefficients[5]  # extract p-value
  
  p_value < 0.05  # significant result
}

mean(replicate(100, simulate_power(200)))  # estimated power