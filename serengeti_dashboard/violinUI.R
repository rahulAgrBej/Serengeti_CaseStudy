
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
      multiInput(inputId='species_select',
                         label='Select Species (1-5 species):',
                         choices=speciesList),
      radioButtons(inputId='juvenile_option',
                   label='Filter based on whether juveniles were present of not:',
                   choices=list('All'=1, 'With_Juveniles'=2, 'Without_Juveniles'=3),
                   selected=1),
      checkboxGroupInput(inputId='habitat_select',
                         label='Filter based on type of habitat:',
                         choices=c('optionA','optionB','optionC')),
      dateRangeInput(inputId='date_select',
                     label='Filter based on Date Range:',
                     start='2010-08-01',
                     end='2012-05-29')
    )
  ),
  
  # Row for the output violinplot
  fluidRow(
    box(
      width=12,
      plotOutput('violinPredPrey')
    )
  )
)
