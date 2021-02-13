
source('violinGenerate.R')

# violinplot tab
violinplotTab <- tabItem(
  tabName = 'violinplot',
  
  # Row for activity description and for data filters
  fluidRow(
    box(
      h2('Activity:'),
      'Filter using 1 variable', br(),
      'Filter using 2 variables', br(),
      '...tests'
    ),
    box(
      h2('Data Filters:'),
      
    )
  ),
  
  # Row for the output violinplot
  fluidRow(
    box(
      width=12
    )
  )
)