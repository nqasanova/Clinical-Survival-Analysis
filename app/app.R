library(shiny)
library(survival)
library(survminer)
library(tidyverse)

data <- read_csv("../data/survival_data.csv")  # load data

ui <- fluidPage(
  titlePanel("Kaplan-Meier Survival Analysis by Treatment Group"),
  plotOutput("km_plot")
)

server <- function(input, output) {
  
  output$km_plot <- renderPlot({
    fit <- survfit(Surv(time, status) ~ treatment, data = data)
    ggsurvplot(
      fit,
      data = data,
      pval = TRUE,           # show p-value
      risk.table = TRUE,     # show number at risk
      palette = c("#E64B35", "#4DBBD5")
    )$plot
  })
}

shinyApp(ui = ui, server = server)