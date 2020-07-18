# Add x-axis and y-axis labels, and a title to  sp2
sp2 %>%
   layout(
     xaxis = list(title = " "), 
     xaxis2 = list(title = "Year"),
     yaxis = list(title = "Global Sales (M units)"), 
     yaxis2 = list(title = "Global Sales (M units)")
   )


