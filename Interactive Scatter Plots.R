# Create a SPLOM of NA_Sales, EU_Sales, and JP_Sales
library(readr)
library(plotly)
library(dplyr)

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



# Color the SPLOM of NA_Sales, EU_Sales, and JP_Sales by nintendo
vgsales2016 %>%
  mutate(nintendo = ifelse(Publisher == "Nintendo", "Nintendo", "Other")) %>%
  plot_ly(color = ~nintendo) %>% 
  add_trace(
    type = 'splom',                                  
    dimensions = list(
      list(label = 'N. America', values = ~NA_Sales), 
      list(label = 'Europe', values = ~EU_Sales),     
      list(label = 'Japan', values = ~JP_Sales)       
    )
  )

  # Delete the diagonal plots in splom
splom %>%
   style(diagonal = list(visible = FALSE))

# Delete the plots in the upper half of splom
splom %>%
   style(showupperhalf = FALSE)

# Delete the plots in the lower half of splom
splom %>%
   style(showlowerhalf = FALSE)

