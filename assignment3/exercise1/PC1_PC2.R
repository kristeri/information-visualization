library(RColorBrewer)

data <- read.csv("mysticdata.csv", sep=";")
data.pca <- prcomp(data, center=TRUE)
rbPal <- colorRampPalette(c(brewer.pal(n = 9, name = 'RdBu')))
col <- rbPal(10)[as.numeric(cut(data$y, breaks = 10))]

plot(data.pca$x[,1], data.pca$x[,2], pch=21, 
     cex=1.5, col=col, xlab="PC1", 
     ylab = "PC2", main = "PC1 / PC2 - plot")