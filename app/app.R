library(shiny)
library(survival)
library(survminer)
library(tidyverse)

data <- read_csv("../data/survival_data.csv")  # load data

ui <- fluidPage(
  titlePanel("Survival Analysis Dashboard"),
  plotOutput("km_plot")
)

server <- function(input, output) {
  
  output$km_plot <- renderPlot({
    fit <- survfit(Surv(time, status) ~ treatment, data = data)
    ggsurvplot(fit, data = data)$plot
  })
}

shinyApp(ui = ui, server = server)