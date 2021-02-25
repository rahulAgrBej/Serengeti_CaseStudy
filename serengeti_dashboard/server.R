
source('barGenerate.R')
source('violinGenerate.R')
source('boxplotGenerate.R')
source('scatterGenerate.R')

server <- function(input, output) {
  
  # Bar Plot Output
  output$barplotRender <- renderPlot({ barplotCreate(
    input$species_bar,
    input$standing_bar,
    input$resting_bar,
    input$moving_bar,
    input$eating_bar,
    input$interacting_bar,
    input$babies_bar,
    input$habitat_bar,
    input$date_bar,
    input$x_bar,
    input$y_bar)
  })
  
  # Histogram Plot Output
  output$histoplotRender <- renderPlot({ histoplotCreate(
    input$species_histo,
    input$standing_histo,
    input$resting_histo,
    input$moving_histo,
    input$eating_histo,
    input$interacting_histo,
    input$babies_histo,
    input$habitat_histo,
    input$date_histo,
    input$x_histo)
  })
  
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
  
  # Scatter Plot Output
  output$scatterplotRender <- renderPlot({ scatterplotCreate(
    input$species_scatter,
    input$standing_scatter,
    input$resting_scatter,
    input$moving_scatter,
    input$eating_scatter,
    input$interacting_scatter,
    input$babies_scatter,
    input$habitat_scatter,
    input$date_scatter,
    input$x_scatter,
    input$y_scatter)
  })
  
}