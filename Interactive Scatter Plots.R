# Create a SPLOM of NA_Sales, EU_Sales, and JP_Sales
library(readr)
library(plotly)

vgsales <- read.csv("vgsales.csv")
vgsales2016 <- vgsales %>% filter(Year == "2016")

vgsales2016 %>%
  plot_ly() %>%
  add_trace(
    type = 'splom',
    dimensions = list(
      list(label = 'N. America', values = ~NA_Sales),
      list(label = 'Europe', values = ~EU_Sales),
      list(label = 'Japan', values = ~JP_Sales)
    )
  )

  

