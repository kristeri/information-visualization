library(RColorBrewer)

data <- read.csv("mysticdata.csv", sep=";")
rbPal <- colorRampPalette(c(brewer.pal(n = 9, name = 'RdBu')))
col <- rbPal(10)[as.numeric(cut(data$y, breaks = 10))]

plot(data, pch=21, 
     cex=1.5, col=col)
title(main="", col.main="black", font.main=4, line=0)
