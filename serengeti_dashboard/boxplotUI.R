
source('boxplotGenerate.R')

boxplotTab <- tabItem(
  tabName <- 'boxplot',
  
  # Row for description and data filters
  fluidRow(
    box(
      h2('Activity:'),
      'Add an activity or exercise description here', br(),
    ),
    box(
      h2('Data Filters'),
      selectInput(inputId = "x_input", 
                  label = "x-axis", 
                  choices = categorical_vars,
                  selected = "Habitat"),
      selectInput(inputId = "y_input", 
                  label = "y-axis", 
                  choices = continuous_vars,
                  selected = "Distance_to_River_m"),
      multiInput(inputId='species_select',
                 label='Select Species (1-5 species):',
                 choices=species_list),
      switchInput(inputId='advanced_options_selected',
                  value=FALSE),
      conditionalPanel(condition='input.advanced_options_selected == true',
                       checkboxGroupInput(inputId = "standing_input",
                                          label = "Standing",
                                          choices = levels(ss_data$Standing),
                                          selected = c("Not standing", "Standing"))
      )
    )
  )
  
)