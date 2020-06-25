  # Single column selection

  library(ggplot2)
  
  # single selection
  shinyApp(
    ui = fluidPage(
      varSelectInput("variable", "Variable:", mtcars),
      plotOutput("data")
    ),
    server = function(input, output) {
      output$data <- renderPlot({
        ggplot(mtcars, aes(!!input$variable)) + geom_histogram()
      })
    }
  )
  
  
