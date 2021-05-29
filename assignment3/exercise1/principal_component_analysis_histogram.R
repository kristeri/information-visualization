library(RColorBrewer)

data <- read.csv("mysticdata.csv", sep=";")
data.pca <- prcomp(data, center=TRUE)
rbPal <- colorRampPalette(c(brewer.pal(n = 9, name = 'RdBu')))
col <- rbPal(10)[as.numeric(cut(data$y, breaks = 10))]

hist(data.pca$x[,1], breaks=75, xlab="PC1", col=col, 
     main = "Histogram of 1D embedding")