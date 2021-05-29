library(RColorBrewer)
library(vegan)
library(scales)
library(MASS)
# Shepard plot

data <- read.csv("population_data.csv", sep=";", encoding = "UTF-8")

dis <- vegdist(data[c(2:21)])
mds <- isoMDS(dis)
shepard_data <- Shepard(dis, mds$points)

plot(shepard_data, pch=21, cex=0.6, xlab="Input distance", ylab="Output distance",
     col="blue", main = "Shepard plot")
lines(shepard_data$x, shepard_data$yf, type = "S", lwd=2.0, col="red")
