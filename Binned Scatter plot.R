# Create a binned scatterplot of User_Score vs. Critic_Score
vgsales %>%
  plot_ly(x = ~Critic_Score, y = ~User_Score) %>%
  add_histogram2d(nbinsx = 50, nbinsy = 50)


