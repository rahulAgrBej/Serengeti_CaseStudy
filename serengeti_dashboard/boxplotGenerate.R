
# Rearranging and adapting code snippet from the boxplot app.R written by Sadie Herbert

getSerengetiData <- function(fp) {
  
  data <- read_csv(fp) 
  
  
  names(data) <- gsub(" ", "_", names(data))
  names(data) <- gsub("\\(", "", names(data))
  names(data) <- gsub("\\)", "", names(data))
  
  data <- data %>% 
    mutate(Date = mdy(Date),
           Species = factor(Species),
           Standing = factor(Standing,
                             levels = c(0, 1),
                             labels = c("Not standing", "Standing")),
           Resting = factor(Resting,
                            levels = c(0, 1),
                            labels = c("Not resting", "Resting")),
           Moving = factor(Moving,
                           levels = c(0, 1),
                           labels = c("Not moving", "Moving")),
           Eating = factor(Eating,
                           levels = c(0, 1),
                           labels = c("Not eating", "Eating")),
           Interacting = factor(Interacting,
                                levels = c(0, 1),
                                labels = c("Not interacting", "Interacting")),
           Babies = factor(Babies,
                           levels = c(0, 1),
                           labels = c("No babies", "Babies")),
           Habitat = factor(Habitat),
           Log_Number_Of_Animals = log(Number_Of_Animals),
           Log_Longitude_m = log(Longitude_m),
           Log_Latitude_m = log(Latitude_m),
           Log_Amount_of_Shade = log(Amount_of_Shade),
           Log_Distance_to_River_m = log(Distance_to_River_m),
           Log_Distance_to_Confluence_m = log(Distance_to_Confluence_m),
           Log_Distance_to_Kopje_m = log(Distance_to_Kopje_m),
           Log_Tree_Density_Measure = log(Tree_Density_Measure),
           Log_Lion_Risk_Wet = log(Lion_Risk_Wet),
           Log_Lion_Risk_Dry = log(Lion_Risk_Dry),
           Log_Greeness_Wet = log(Greeness_Wet),
           Log_Greeness_Dry = log(Greeness_Dry))
  
  return(data)
}

ss_data <- getSerengetiData('../../Full_Serengeti_Data.csv')

# A colorblind-friendly palette with grey:
cbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#999999")

continuous_vars <- c("Amount_of_Shade",
                     "Distance_to_Confluence_m",
                     "Distance_to_Kopje_m",
                     "Distance_to_River_m",
                     "Greeness_Dry",
                     "Greeness_Wet",
                     "Latitude_m",
                     "Lion_Risk_Dry",
                     "Lion_Risk_Wet",
                     "Longitude_m",
                     "Number_Of_Animals",
                     "Tree_Density_Measure",
                     "Log_Amount_of_Shade",
                     "Log_Distance_to_Confluence_m",
                     "Log_Distance_to_Kopje_m",
                     "Log_Distance_to_River_m",
                     "Log_Greeness_Dry",
                     "Log_Greeness_Wet",
                     "Log_Latitude_m",
                     "Log_Lion_Risk_Dry",
                     "Log_Lion_Risk_Wet",
                     "Log_Longitude_m",
                     "Log_Number_Of_Animals",
                     "Log_Tree_Density_Measure")


categorical_vars <- c("Babies",
                      "Eating",
                      "Habitat",
                      "Interacting",
                      "Moving",
                      "Resting",
                      "Standing")

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


