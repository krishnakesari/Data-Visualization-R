# Create a choropleth map displaying the Senate winners
senate_map %>%
  group_by(group) %>%
  plot_ly(x = ~long, y = ~lat, color = ~party, split = ~region) %>%
  add_polygons(line = list(width = 0.4), showlegend = FALSE)

  # Adjust the polygon colors and boundaries
senate_map %>%
  group_by(group) %>%
  plot_ly(x = ~long, y = ~lat, color = ~party, split = ~region,
          colors = c("dodgerblue", "mediumseagreen", "tomato")) %>%
  add_polygons(line = list(width = 0.4, color = toRGB("gray60")), showlegend = FALSE)

  # Define the layout settings to polish the axes
map_axes <- list(title = "",
                  showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)

# Apply the layout to both axes
senate_map %>%
  group_by(group) %>%
  plot_ly(x = ~long, y = ~lat, color = ~party, split = ~region,
          colors = c("dodgerblue", "mediumseagreen", "tomato")) %>%
  add_polygons(line = list(width = 0.4, color = toRGB("gray60")), showlegend = FALSE) %>%
  layout(xaxis = map_axes, yaxis = map_axes)

  ######### County level choropleth map ###########
  
  # Join the fl_boundaries and
# fl_results data frames
senate_vote <- left_join(fl_boundaries, fl_results, by = c("subregion" = "CountyName"))

# Join the fl_boundaries and fl_results data frames
senate_vote <- left_join(fl_boundaries, fl_results, by = c("subregion" = "CountyName"))

# Create a county-level choropleth map of Pctvote
senate_vote %>%
  group_by(group) %>%
  plot_ly(x = ~long, y = ~lat, 
          color = ~Pctvote,
          split = ~subregion) %>%
  add_polygons(line = list(width = 0.4), showlegend = FALSE, colors = c("blue", "red"))


  # Join the fl_boundaries and fl_results data frames
senate_vote <- left_join(fl_boundaries, fl_results, by = c("subregion" = "CountyName"))

# Specify the axis settings to polish the map
map_axes <- list(title = "", 
                 gridlines = FALSE,
                 zerolines = FALSE,
                 tickmarks = FALSE)

# Create a polished county-level choropleth map of Pctvote
senate_vote %>%
  group_by(group) %>%
  plot_ly(x = ~long, y = ~lat, 
          color = ~Pctvote,
          split = ~subregion) %>%
  add_polygons(line = list(width = 0.4), showlegend = FALSE, colors = c("blue", "red")) %>%
  layout(xaxis = map_axes, yaxis = map_axes)

  

