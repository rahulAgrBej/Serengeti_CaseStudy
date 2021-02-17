
source('violinGenerate.R')
source('boxplotGenerate.R')

server <- function(input, output) {
  
  # Violin Plot Output
  output$violinPredPrey <- renderPlot({ dailyViolinPlot(input$species_select) })
  
  # Box Plot Output
  output$boxplotRender <- renderPlot({ boxplotCreate(
    input$species_box,
    input$standing_box,
    input$resting_box,
    input$moving_box,
    input$eating_box,
    input$interacting_box,
    input$babies_box,
    input$habitat_box,
    input$date_box,
    input$x_box,
    input$y_box)
    })
  
}