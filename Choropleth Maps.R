# Create a choropleth map of the change in voter turnout from 2014 to 2018
turnout %>%
  mutate(change = turnout2018 - turnout2014) %>%
  plot_geo(locationmode = 'USA-states') %>%
  add_trace(z = ~change, locations = ~state.abbr) %>%
  layout(geo = list(scope = 'usa'))

  