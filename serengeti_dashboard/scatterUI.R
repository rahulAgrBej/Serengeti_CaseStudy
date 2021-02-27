
source('scatterGenerate.R')

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
      h2('Data Filters:'),
      selectInput(inputId = "x_scatter", 
                  label = "x-axis", 
                  choices = continuous_vars,
                  selected = "Amount_of_Shade"),
      selectInput(inputId = "y_scatter", 
                  label = "y-axis", 
                  choices = continuous_vars,
                  selected = "Distance_to_Confluence_m"),
      multiInput(inputId = "species_scatter", 
                         label = "Species (select up to five)", 
                         choices = levels(ss_data$Species),
                         selected = c("aardvark")),
      switchInput(inputId='advanced_options_selected_scatter',
                  label='Show Advanced options',
                  value=FALSE),
      
      conditionalPanel(condition='input.advanced_options_selected_scatter == true',
                       checkboxGroupInput(inputId = "standing_scatter",
                                          label = "Standing",
                                          choices = levels(ss_data$Standing),
                                          selected = c("Not standing", "Standing")),
                       checkboxGroupInput(inputId = "resting_scatter",
                                          label = "Resting",
                                          choices = levels(ss_data$Resting),
                                          selected = c("Not resting", "Resting")),
                       checkboxGroupInput(inputId = "moving_scatter",
                                          label = "Moving",
                                          choices = levels(ss_data$Moving),
                                          selected = c("Not moving", "Moving")),
                       checkboxGroupInput(inputId = "eating_scatter",
                                          label = "Eating",
                                          choices = levels(ss_data$Eating),
                                          selected = c("Not eating", "Eating")),
                       checkboxGroupInput(inputId = "interacting_scatter",
                                          label = "Interacting",
                                          choices = levels(ss_data$Interacting),
                                          selected = c("Not interacting", "Interacting")),
                       checkboxGroupInput(inputId = "babies_scatter",
                                          label = "Babies",
                                          choices = levels(ss_data$Babies),
                                          selected = c("No babies", "Babies")),
                       checkboxGroupInput(inputId ="habitat_scatter",
                                          label = "Habitat (select any or all)",
                                          choices = levels(ss_data$Habitat),
                                          selected = c("Dense Woodland",
                                                       "Grassland w/Trees",
                                                       "Open Grassland",
                                                       "Open Woodland/Shrubs")),
                       dateRangeInput(inputId ="date_scatter",
                                      label = "Select date range",
                                      start  = min(ss_data$Date),
                                      end    = max(ss_data$Date),
                                      min    = min(ss_data$Date),
                                      max    = max(ss_data$Date),
                                      format = "mm/dd/yy",
                                      separator = " - "))
    )
  ),
  
  # Row for the output scatterplot
  fluidRow(
    box(width=12,
        h2('Output:'),
        plotOutput('scatterplotRender')
    )
  )
)
