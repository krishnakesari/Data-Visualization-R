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