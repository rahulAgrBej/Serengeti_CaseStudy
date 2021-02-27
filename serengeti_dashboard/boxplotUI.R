
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
      selectInput(inputId = "x_box", 
                  label = "x-axis", 
                  choices = categorical_vars,
                  selected = "Habitat"),
      selectInput(inputId = "y_box", 
                  label = "y-axis", 
                  choices = continuous_vars,
                  selected = "Distance_to_River_m"),
      multiInput(inputId='species_box',
                 label='Select Species (1-5 species):',
                 choices=species_list,
                 selected=c('aardvark')),
      switchInput(inputId='advanced_options_selected_box',
                  label='Show Advanced options',
                  value=FALSE),
      
      conditionalPanel(condition='input.advanced_options_selected_box == true',
                       checkboxGroupInput(inputId = "standing_box",
                                          label = "Standing",
                                          choices = levels(ss_data$Standing),
                                          selected = c("Not standing", "Standing")),
                       checkboxGroupInput(inputId = "resting_box",
                                          label = "Resting",
                                          choices = levels(ss_data$Resting),
                                          selected = c("Not resting", "Resting")),
                       checkboxGroupInput(inputId = "moving_box",
                                          label = "Moving",
                                          choices = levels(ss_data$Moving),
                                          selected = c("Not moving", "Moving")),
                       checkboxGroupInput(inputId = "eating_box",
                                          label = "Eating",
                                          choices = levels(ss_data$Eating),
                                          selected = c("Not eating", "Eating")),
                       checkboxGroupInput(inputId = "interacting_box",
                                          label = "Interacting",
                                          choices = levels(ss_data$Interacting),
                                          selected = c("Not interacting", "Interacting")),
                       checkboxGroupInput(inputId = "babies_box",
                                          label = "Babies",
                                          choices = levels(ss_data$Babies),
                                          selected = c("No babies", "Babies")),
                       checkboxGroupInput(inputId ="habitat_box",
                                          label = "Habitat (select any or all)",
                                          choices = levels(ss_data$Habitat),
                                          selected = c("Dense Woodland",
                                                       "Grassland w/Trees",
                                                       "Open Grassland",
                                                       "Open Woodland/Shrubs")),
                       dateRangeInput(inputId ="date_box",
                                      label = "Select date range",
                                      start  = min(ss_data$Date),
                                      end    = max(ss_data$Date),
                                      min    = min(ss_data$Date),
                                      max    = max(ss_data$Date),
                                      format = "mm/dd/yy",
                                      separator = " - "))
    )
  ),
  
  # Row for box plot visualization
  fluidRow(
    box(width=12,
        h2('Output:'),
        plotOutput('boxplotRender')
    )
  )
  
)