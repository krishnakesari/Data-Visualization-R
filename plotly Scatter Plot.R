# Verical grid line
vline <- function(x = 0, color = "gray") {
  list(
    type = "line", 
    y0 = 0, 
    y1 = 100, 
    yref = "paper",
    x0 = max(x$`NET CMT AMT in Millions`/2), 
    x1 = max(x$`NET CMT AMT in Millions`/2), 
    line = list(color = color)
  )
}
# Horizontal grid line 

hline <- function(y = 0, color = "gray") {
  list(
    type = "line", 
    x0 = 0, 
    x1 = max(x$`NET CMT AMT in Millions`), 
    xref = "paper",
    y0 = 50, 
    y1 = 50, 
    line = list(color = color)
  )
}

# Setting up colors for scatter points
colors <- c("darkgreen", "gold", "orange", "red", "darkred", "grey")

fig <- plot_ly(x, x = ~`NET CMT AMT in Millions`, y = ~dis_perc, color = ~`DO RTNG SHRT DESC`,
               text = ~`PROJ LGL NAME`,
               colors = colors, type = 'scatter', mode = 'markers',
               hovertemplate = "<br>%{text} <br>Disbursement Percent (%): %{y} <br>Net Commitment ($M): %{x}", #Hover over text details
               marker = list(size = 10))
# Setting up titles 
fig <- fig %>% layout(title = 'Net Disbursement Amount',
                      xaxis = list(title = "Net Commitment Amount (In Millions)"),
                      yaxis = list(title = "Disbursement Percentage (%)"))
# Adding grid lines to plot
fig <- fig %>% layout(shapes = list(vline(1750), hline(50)))

fig

## Optional way to create grid lines
fig <- fig %>% add_segments(x = 1750, xend = 1750, y = 0, yend = 100)
fig <- fig %>% add_segments(x = 0, xend = 3500, y = 50, yend = 50)