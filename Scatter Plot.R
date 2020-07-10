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

