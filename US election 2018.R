# Create a scatterplot of turnout2018 against turnout2014
turnout %>%
  plot_ly(x = ~turnout2014, y = ~turnout2018) %>%
  add_markers() %>%
  layout(xaxis = list(title = "2014 voter turnout"),
         yaxis = list(title = "2018 voter turnout"))

# Add the line y = x to the scatterplot
p %>%
  add_lines(x = c(0.25, 0.6), y = c(0.25, 0.6)) %>%
  layout(showlegend = FALSE)

# Create a dotplot of voter turnout in 2018 by state ordered by turnout
turnout %>%
  top_n(15, wt = turnout2018) %>%
  plot_ly(x = ~turnout2018, y = ~fct_reorder(state, turnout2018)) %>%
  add_markers() %>%
  layout(xaxis = list(title = "Eligible voter turnout"),
         yaxis = list(title = "State", type = "category"))

# Create a histogram of receipts for the senate races
fundraising %>%
  filter(office == "S") %>%
  plot_ly(x = ~receipts) %>%
  add_histogram() %>%
  layout(xaxis = list(title = "Total contributions received"),
         title = "Fundraising for 2018 Senate races")

# Create a dotplot of the top 15 Senate campaigns
fundraising %>%
  filter(office == "S") %>%
  top_n(15, wt = receipts) %>%
  plot_ly(x = ~receipts, y = ~fct_reorder(state, receipts),
          color = ~fct_drop(party),
          hoverinfo = "text",
          text = ~paste("Candidate:", name, "<br>",
                        "Party:", party, "<br>",
                        "Receipts:", receipts, "<br>",
                        "Disbursements:", disbursement)) %>%
  add_markers(colors = c("blue", "red")) 

  