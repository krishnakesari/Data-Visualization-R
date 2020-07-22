# Create a choropleth map of the change in voter turnout from 2014 to 2018
turnout %>%
  mutate(change = turnout2018 - turnout2014) %>%
  plot_geo(locationmode = 'USA-states') %>%
  add_trace(z = ~change, locations = ~state.abbr) %>%
  layout(geo = list(scope = 'usa'))

  # Create a choropleth map displaying the Senate results
senate_winners %>%
  plot_geo(locationmode = 'USA-states') %>%
  add_trace(z = ~as.numeric(party),locations = ~state,
    colors = c('dodgerblue', 'mediumseagreen', 'tomato'),
    hoverinfo = "text",
    text = ~paste("Candidate:", name, "<br>",
                  "Party:", party, "<br>",
                  "% vote:", round(pct.vote, 1))
  ) %>%
  layout(geo = list(scope = 'usa')) %>% 
  hide_colorbar()

  