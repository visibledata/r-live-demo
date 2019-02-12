
function(input, output, session){
  
  output$curvePlot <- renderPlot({
    
    curve(x^as.integer(input$exponent), from = -5, to = 5)
    
  })
  
}