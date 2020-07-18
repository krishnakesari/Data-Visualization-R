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

