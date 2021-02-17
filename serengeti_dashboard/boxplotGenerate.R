
# Code from the boxplot app.R written by Sadie Herbert

# A colorblind-friendly palette with grey:
cbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#999999")

ss_data <- read_csv("../../Full_Serengeti_Data.csv")

names(ss_data) <- gsub(" ", "_", names(ss_data))
names(ss_data) <- gsub("\\(", "", names(ss_data))
names(ss_data) <- gsub("\\)", "", names(ss_data))

ss_data <- ss_data %>% 
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
#============================================================================

species_list <- levels(ss_data$Species)
