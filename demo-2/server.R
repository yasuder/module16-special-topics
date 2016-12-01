# Run the traffic simulation
source('traffic_sim.R')
shinyServer(function(input, output) {
  output$histogram <- renderPlot({
    RepeatSimulation(
      num.sims = input$num.sims, 
      mean = input$speed, 
      sd = input$deviation, 
      num.cars = input$num.cars
    )
  })
})