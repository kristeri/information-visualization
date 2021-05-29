library(RColorBrewer)
library(vegan)

data <- read.csv("mysticdata.csv", sep=";")

NMDS <- metaMDS(data)

rbPal <- colorRampPalette(c(brewer.pal(n = 9, name = 'RdBu')))
col <- rbPal(10)[as.numeric(cut(data$y, breaks = 10))]

hist(NMDS$points, breaks=55, xlab="points", col=col, 
     main = "Non-metric multidimensional scaling (NMDS)")