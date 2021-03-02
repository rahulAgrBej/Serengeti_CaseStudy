
source('helpers.R')

# File containing all functions that create plots

# Creates violin plots
plotViolin <- function(data) {
  
  p <- ggplot(data, 
         (aes(x=Species, y = Time_24_hour, color=Species, fill=Species))) +
        geom_violin() +
        scale_color_manual(values = cbPalette) +
        scale_fill_manual(values = cbPalette) +
        ylab("Time of Day of Observation (ignore date)") +
        ggtitle("Species Activity by Time")
  
  return (p)
}