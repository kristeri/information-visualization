library(RColorBrewer)
library(vegan)
library(scales)
# Metric MDS

data <- read.csv("population_data.csv", sep=";", encoding = "UTF-8")

dis <- vegdist(data[c(2:21)])
MMDS <- cmdscale(dis)

nof_countries <- 310
palette_cols <- palette(rainbow(nof_countries))

plot(MMDS, pch=21, cex=1.5, xlab="x", ylab="y", col=alpha(palette_cols, 0.5),
     bg=alpha(palette_cols, 0.6), 
     main = "Metric multidimensional scaling (MMDS)")

# Annotate capital cities of regions in Finland

text(x=MMDS[35,1],y=MMDS[35,2],labels=data$Area[35], cex=0.6, offset = 10)
text(x=MMDS[269,1],y=MMDS[269,2],labels=data$Area[269], cex=0.6, offset = 10)
text(x=MMDS[277,1],y=MMDS[277,2],labels=data$Area[277], cex=0.6, offset = 10)
text(x=MMDS[181,1],y=MMDS[181,2],labels=data$Area[181], cex=0.6, offset = 10)
text(x=MMDS[64,1],y=MMDS[64,2],labels=data$Area[64], cex=0.6, offset = 10)
text(x=MMDS[115,1],y=MMDS[115,2],labels=data$Area[115], cex=0.6, offset = 10)
text(x=MMDS[202,1],y=MMDS[202,2],labels=data$Area[202], cex=0.6, offset = 10)
text(x=MMDS[124,1],y=MMDS[124,2],labels=data$Area[124], cex=0.6, offset = 10)
text(x=MMDS[244,1],y=MMDS[244,2],labels=data$Area[244], cex=0.6, offset = 10)
text(x=MMDS[289,1],y=MMDS[289,2],labels=data$Area[289], cex=0.6, offset = 10)
text(x=MMDS[230,1],y=MMDS[230,2],labels=data$Area[230], cex=0.6, offset = 10)
text(x=MMDS[108,1],y=MMDS[108,2],labels=data$Area[108], cex=0.6, offset = 10)
text(x=MMDS[109,1],y=MMDS[109,2],labels=data$Area[109], cex=0.6, offset = 10)
text(x=MMDS[43,1],y=MMDS[43,2],labels=data$Area[43], cex=0.6, offset = 10)
text(x=MMDS[56,1],y=MMDS[56,2],labels=data$Area[56], cex=0.6, offset = 10)
text(x=MMDS[158,1],y=MMDS[158,2],labels=data$Area[158], cex=0.6, offset = 10)
text(x=MMDS[130,1],y=MMDS[130,2],labels=data$Area[130], cex=0.6, offset = 10)
text(x=MMDS[70,1],y=MMDS[70,2],labels=data$Area[70], cex=0.6, offset = 10)
text(x=MMDS[102,1],y=MMDS[102,2],labels=data$Area[102], cex=0.6, offset = 10)



