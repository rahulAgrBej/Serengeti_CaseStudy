
source('violinGenerate.R')
source('helpers.R')

# violinplot tab
violinplotTab <- tabItem(
  tabName = 'violinplot',
  
  # Row for activity description and for data filters
  fluidRow(
    box(width=4,
      h2('Daily Activity Analysis:'),
      'The daily activity graphs are called “violin” plots because of their shape. This graph is useful for seeing how often an animal is observed by the camera traps at different times during the day.', br(), br(),
      'In a violin plot, the wider the figure, the more photos have been taken of the given animal at that time of day.', br(), br(),
      'You can use the filters to narrow down what photos you are interested in. You can also select multiple species to compare. Species will be plotted alongside each other.', br(),
      h2('Data Filters:'),
      multiInput(inputId='species_violin',
                 label='Select Species (1-5 species):',
                 choices=species_list,
                 selected=c('aardvark', 'aardwolf', 'baboon', 'buffalo')),
      switchInput(inputId='advanced_options_selected_violin',
                  label='Show Advanced options',
                  value=FALSE),
      conditionalPanel(condition='input.advanced_options_selected_violin == true',
                       checkboxGroupInput(inputId = "standing_violin",
                                          label = "Standing",
                                          choices = standing_list,
                                          selected = c("Not standing", "Standing")),
                       checkboxGroupInput(inputId = "resting_violin",
                                          label = "Resting",
                                          choices = resting_list,
                                          selected = c("Not resting", "Resting")),
                       checkboxGroupInput(inputId = "moving_violin",
                                          label = "Moving",
                                          choices = moving_list,
                                          selected = c("Not moving", "Moving")),
                       checkboxGroupInput(inputId = "eating_violin",
                                          label = "Eating",
                                          choices = eating_list,
                                          selected = c("Not eating", "Eating")),
                       checkboxGroupInput(inputId = "interacting_violin",
                                          label = "Interacting",
                                          choices = interacting_list,
                                          selected = c("Not interacting", "Interacting")),
                       checkboxGroupInput(inputId = "babies_violin",
                                          label = "Babies",
                                          choices = babies_list,
                                          selected = c("No babies", "Babies")),
                       checkboxGroupInput(inputId ="habitat_violin",
                                          label = "Habitat (select any or all)",
                                          choices = habitat_list,
                                          selected = c("Dense Woodland",
                                                       "Grassland w/Trees",
                                                       "Open Grassland",
                                                       "Open Woodland/Shrubs")),
                       dateRangeInput(inputId ="date_violin",
                                      label = "Select date range",
                                      start  = startDate,
                                      end    = endDate,
                                      min    = startDate,
                                      max    = endDate,
                                      format = "mm/dd/yy",
                                      separator = " - "))),
    box(width=8,
        h2('Output:'),
        plotOutput('violinplotRender'),
        downloadButton('violinDownload', 'Download')
    )
  )
)
