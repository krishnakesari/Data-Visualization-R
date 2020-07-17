# Create a scatter plot of User_Score against Critic_Score
vgsales %>% 
  plot_ly(x = ~Critic_Score, y = ~User_Score) %>%
  add_markers()

# Using counts
# Filter out the 2016 video games
vg2016 <- vgsales %>%
	filter(Year == 2016)

# Create a stacked bar chart of Rating by Genre
vg2016 %>%
	count(Genre, Rating) %>%
	plot_ly(x = ~Genre, y = ~n, color = ~Rating) %>%
  	add_bars() %>%
  	layout(barmode = 'stack')


# Box plot
# Filter out the 2016 video games
vg2016 <- vgsales %>%
	filter(Year == 2016)

# Create boxplots of Global_Sales by Genre for above data
vg2016 %>% 
  plot_ly(x = ~Global_Sales, y = ~Genre) %>%
  add_boxplot()

  
  
