
source('violinGenerate.R')

server <- function(input, output) {
  output$violinPredPrey <- renderPlot({ dailyViolinPlot(input$species_select) })
}