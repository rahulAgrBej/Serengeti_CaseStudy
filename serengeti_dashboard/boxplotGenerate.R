
# Rearranging and adapting code snippet from the boxplot app.R written by Sadie Herbert

ss_data <- getSerengetiData('../../Full_Serengeti_Data.csv')
species_list <- levels(ss_data$Species)

boxplotCreate <- function(
  species_input,
  standing_input,
  resting_input,
  moving_input,
  eating_input,
  interacting_input,
  babies_input,
  habitat_input,
  date_input,
  x_input,
  y_input) {
  
  ss_data_box <- getSerengetiData('../../Full_Serengeti_Data.csv')
  ss_data_filtered <- ss_data_box %>% 
    filter(Species %in% species_input) %>%
    filter(Standing %in% standing_input) %>% 
    filter(Resting %in% resting_input) %>%
    filter(Moving %in% moving_input) %>%
    filter(Eating %in% eating_input) %>%
    filter(Interacting %in% interacting_input) %>%
    filter(Babies %in% babies_input) %>%
    filter(Habitat %in% habitat_input) %>%
    filter(Date >= date_input[1] & Date <= date_input[2])
  
  p <- ss_data_filtered %>%
    ggplot(aes_string(x = x_input, y = y_input)) +
    geom_boxplot(aes(color = Species)) +
    scale_color_manual(values = cbPalette) +
    theme_minimal() +
    scale_x_discrete(labels = label_wrap(10)) +
    theme(axis.title = element_text(face = "bold", size = 24),
          axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)),
          axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)),
          axis.text.x = element_text(size = 20),
          axis.text.y = element_text(size = 20),
          legend.text = element_text(size = 20),
          legend.title = element_text(face = "bold", size = 24),
          plot.margin = unit(c(1,1,1,1), "cm"))
  
  return(p)
}

#============================================================================


