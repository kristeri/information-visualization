library(RColorBrewer)
library(vegan)
library(scales)
library(MASS)
# Sammon mapping

data <- read.csv("population_data.csv", sep=";", encoding = "UTF-8")

dis <- vegdist(data[c(2:21)])
sammon_data <- sammon(dis)

nof_countries <- 310
palette_cols <- palette(rainbow(nof_countries))

plot(sammon_data$points, pch=21, cex=1.5, xlab="x", ylab="y", col=alpha(palette_cols, 0.5),
     bg=alpha(palette_cols, 0.5), 
     main = "Sammon mapping")

# Annotate capital cities of regions in Finland

text(x=sammon_data$points[35,1],y=sammon_data$points[35,2],labels=data$Area[35], cex=0.6, offset = 10)
text(x=sammon_data$points[269,1],y=sammon_data$points[269,2],labels=data$Area[269], cex=0.6, offset = 10)
text(x=sammon_data$points[277,1],y=sammon_data$points[277,2],labels=data$Area[277], cex=0.6, offset = 10)
text(x=sammon_data$points[181,1],y=sammon_data$points[181,2],labels=data$Area[181], cex=0.6, offset = 10)
text(x=sammon_data$points[64,1],y=sammon_data$points[64,2],labels=data$Area[64], cex=0.6, offset = 10)
text(x=sammon_data$points[115,1],y=sammon_data$points[115,2],labels=data$Area[115], cex=0.6, offset = 10)
text(x=sammon_data$points[202,1],y=sammon_data$points[202,2],labels=data$Area[202], cex=0.6, offset = 10)
text(x=sammon_data$points[124,1],y=sammon_data$points[124,2],labels=data$Area[124], cex=0.6, offset = 10)
text(x=sammon_data$points[244,1],y=sammon_data$points[244,2],labels=data$Area[244], cex=0.6, offset = 10)
text(x=sammon_data$points[289,1],y=sammon_data$points[289,2],labels=data$Area[289], cex=0.6, offset = 10)
text(x=sammon_data$points[230,1],y=sammon_data$points[230,2],labels=data$Area[230], cex=0.6, offset = 10)
text(x=sammon_data$points[108,1],y=sammon_data$points[108,2],labels=data$Area[108], cex=0.6, offset = 10)
text(x=sammon_data$points[109,1],y=sammon_data$points[109,2],labels=data$Area[109], cex=0.6, offset = 10)
text(x=sammon_data$points[43,1],y=sammon_data$points[43,2],labels=data$Area[43], cex=0.6, offset = 10)
text(x=sammon_data$points[56,1],y=sammon_data$points[56,2],labels=data$Area[56], cex=0.6, offset = 10)
text(x=sammon_data$points[158,1],y=sammon_data$points[158,2],labels=data$Area[158], cex=0.6, offset = 10)
text(x=sammon_data$points[130,1],y=sammon_data$points[130,2],labels=data$Area[130], cex=0.6, offset = 10)
text(x=sammon_data$points[70,1],y=sammon_data$points[70,2],labels=data$Area[70], cex=0.6, offset = 10)
text(x=sammon_data$points[102,1],y=sammon_data$points[102,2],labels=data$Area[102], cex=0.6, offset = 10)



