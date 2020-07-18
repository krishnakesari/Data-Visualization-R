# Polish the scatterplot by transforming the x-axis and labeling both axes
vgsales2016 %>%
  plot_ly(x = ~Global_Sales, y = ~Critic_Score) %>%
  add_markers(marker = list(opacity = 0.5)) %>%
  layout(xaxis = list(title = 'Global sales (millions of units)', type = 'log'),
         yaxis = list(title = 'Critic score'))