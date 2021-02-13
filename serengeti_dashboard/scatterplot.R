
# scatterplot tab
scatterplotTab <- tabItem(
  tabName = 'scatterplot',
  
  # Row for activity description and for data filters
  fluidRow(
    box(
      h2('Activity:'),
      'Filter using 1 variable', br(),
      'Filter using 2 variables', br(),
      '...tests'
    ),
    box(
      h2('Data Filters:')
    )
  ),
  
  # Row for the plot of the data
  fluidRow(
    box(
      width=12
    )
  )
)
