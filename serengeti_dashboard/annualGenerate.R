
source('helpers.R')

annualplotCreate <- function(
  species_input,
  standing_input,
  resting_input,
  moving_input,
  eating_input,
  interacting_input,
  babies_input,
  habitat_input,
  date_input,
  y_input
) {
  
  summary_data <- filterSerengetiData(
    ss_data,
    species_input,
    standing_input,
    resting_input,
    moving_input,
    eating_input,
    interacting_input,
    babies_input,
    habitat_input,
    date_input)
  
  summary_data <- summary_data %>%
    group_by(Species, !!(as.symbol(x_input))) %>%
    count(name = "Count") %>%
    ungroup() %>%
    group_by(Species) %>%
    complete(!!(as.symbol(x_input)), fill = list(Count = 0)) %>%
    mutate(Frequency = round(Count/sum(Count), 3))
}