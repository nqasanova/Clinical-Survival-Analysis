calculate_km <- function(data, time, status, group) {
  survfit(Surv({{ time }}, {{ status }}) ~ {{ group }}, data = data)
}