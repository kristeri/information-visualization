library(RColorBrewer)
library(vegan)

data <- read.csv("mysticdata.csv", sep=";")

dis <- vegdist(data)

ISO <- isomap(dis, k=5)

rbPal <- colorRampPalette(c(brewer.pal(n = 9, name = 'RdBu')))
col <- rbPal(10)[as.numeric(cut(data$y, breaks = 10))]

hist(ISO$points, breaks=55, xlab="points", col=col, 
     main = "ISOMAP")