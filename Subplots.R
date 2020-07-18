# Create a scatterplot of User_Score against Critic_Score for PS4 games
p1 <- vgsales2016 %>%
   filter(Platform == "PS4") %>%
   plot_ly(x = ~Critic_Score, y = ~User_Score) %>% 
   add_markers(name = "PS4")

# Create a scatterplot of User_Score against Critic_Score for XOne games
p2 <- vgsales2016 %>%
   filter(Platform == "XOne") %>%
   plot_ly(x = ~Critic_Score, y = ~User_Score) %>% 
   add_markers(name = "XOne")

# Create a facted scatterplot containing p1 and p2
subplot(p1, p2, nrows = 2)


#######################

# Automated Faceting
# Create a faceted scatterplot of User_Score vs. Critic_Score with 3 rows
vgsales2016 %>%
  group_by(Platform) %>%
  do(
    plot = plot_ly(data = ., x = ~Critic_Score, y = ~User_Score) %>%
      add_markers(name = ~Platform)
  ) %>%
  subplot(nrows = 3, shareY = TRUE, shareX = TRUE)

  #########################

  # Building shared axis
  # Add x-axis and y-axis labels, and a title
subplot(p1, p2, nrows = 2, shareY = TRUE, shareX = TRUE) %>%
   layout(title = "User score vs. critic score by platform, 2016")