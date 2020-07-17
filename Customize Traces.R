# Create a histogram of Critic_Score with navy bars that are 50% transparent
vgsales2016 %>%
  plot_ly(x = ~Critic_Score) %>%
  add_histogram(color = I("navy"), opacity = 0.5)

# Change the color of the histogram using a hex code
vgsales2016 %>%
  plot_ly(x = ~Critic_Score) %>%
  add_histogram(color = I('#111e6c'))

# Change the color of the histogram using rgb()
vgsales2016 %>%
  plot_ly(x = ~Critic_Score) %>%
  add_histogram(marker = list(color = "rgb(17, 30, 108)"))

# Set the plotting symbol to diamond and the size to 4
plot_ly(data = vg2016, x = ~User_Score, y = ~Critic_Score) %>% 
	add_markers(marker = list(symbol = "diamond", size = 4)) 


# Using Colors
# Use color to add Genre as a third variable
vgsales2016 %>%
  plot_ly(x = ~Critic_Score, y = ~User_Score, color = ~Genre) %>%
  add_markers(colors = "Dark2")

# Use Symbols - Create a scatterplot of User_Score against Critic_Score coded by Rating
vgsales2016 %>%
   plot_ly(x = ~Critic_Score, y = ~User_Score, symbol = ~Rating) %>%
   add_markers()

# Create a scatterplot of User_Score vs. Critic_Score colored by User_Count
vgsales2016 %>%
  plot_ly(x = ~Critic_Score, y = ~User_Score, color = ~User_Count) %>%
  add_markers()

# Create a scatterplot of User_Score vs. Critic_Score colored by log User_Count
vgsales2016 %>%
  plot_ly(x = ~Critic_Score, y = ~User_Score, color = ~log(User_Count)) %>%
  add_markers()


# Hover information 

# Create a bar chart of Platform with hoverinfo only for the bar heights
vgsales2016 %>%
  count(Platform)%>%
	plot_ly(x = ~Platform, y = ~n, hoverinfo = "y") %>%
 	add_bars()

# Format the hover info for NA_Sales, EU_Sales, and Name
vgsales2016 %>%
  plot_ly(x = ~NA_Sales, y = ~EU_Sales,
          hoverinfo = "text",
          text = ~paste("NA_Sales: ", NA_Sales, 
                     "<br>", "EU_Sales: ", EU_Sales, 
                     "<br>", "Name: ", Name)
  ) %>%
  add_markers()


# Customize Layout

