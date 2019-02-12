

fluidPage(
  selectInput("exponent",
              label = "choose an exponent, dude",
              choice = 1:5),
  plotOutput("curvePlot")
)