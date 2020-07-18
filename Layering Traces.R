# Fit the regression model of User_Score on Critic_Score
m <- lm(User_Score ~ Critic_Score, data = vgsales2016)

# Create the scatterplot with smoother
vgsales2016 %>%
   select(User_Score, Critic_Score) %>%
   na.omit() %>%
   plot_ly(x = ~Critic_Score, y = ~User_Score) %>%
   add_markers(showlegend = FALSE) %>%
   add_lines(y = ~fitted(m))


# Compute density curves
d.a <- density(activision$Critic_Score, na.rm = TRUE)
d.e <- density(ea$Critic_Score, na.rm = TRUE)
d.n <- density(nintendo$Critic_Score, na.rm = TRUE)

# Overlay density plots
plot_ly() %>%
  add_lines(x = ~d.a$x, y = ~d.a$y, name = "Activision", fill = 'tozeroy') %>%
  add_lines(x = ~d.e$x, y = ~d.e$y, name = "Electronic Arts", fill = 'tozeroy') %>%
  add_lines(x = ~d.n$x, y = ~d.n$y, name = "Nintendo", fill = 'tozeroy') %>%
  layout(xaxis = list(title = 'Critic Score'),
         yaxis = list(title = 'Density'))