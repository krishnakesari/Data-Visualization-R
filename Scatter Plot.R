# Load the plotly package
library(plotly)

# Store the scatterplot of Critic_Score vs. NA_Sales sales in 2016
scatter <- vgsales %>%
			filter(Year == 2016) %>%
			ggplot(aes(x = NA_Sales, y = Critic_Score)) +
			geom_point(alpha = 0.3)

# Convert the scatterplot to a plotly graphic
ggplotly(scatter)


# Plotting a Histogram
vgsales %>%
	plot_ly(x = ~Critic_Score) %>%
	add_histogram()				  

# # Create a histogram of Critic_Score with at most 25 bins
vgsales %>%
	plot_ly(x = ~Critic_Score) %>%
	add_histogram(nbinsx = 25)

# Create a histogram with bins of width 10 between 0 and 100
vgsales %>%
  plot_ly(x = ~Critic_Score) %>%
  add_histogram(xbins = list(start = 0, end = 100,   size = 10))


# Create a frequency for Genre
genre_table <- vgsales %>%
	count(Genre)

# Create a bar chart of Genre
genre_table %>%
	plot_ly(x = ~Genre, y = ~n) %>%
	add_bars()


# Reorder the bars for Genre by n
genre_table %>%
	mutate(Genre = fct_reorder(Genre, n, .desc = TRUE)) %>%
	plot_ly(x = ~Genre, y = ~n) %>% 
	add_bars()                      



