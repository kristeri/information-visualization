library(ggplot2)
library(tidyr)
library(tidyverse)
library(sf)
library(dplyr)
library(scales)
library(rnaturalearth)
library(rnaturalearthdata)

european_countries = c("ALB", "AND", "ARM", "AUT", "AZE", "BLR", "BEL", "BIH",
                       "BGR", "HRV", "CYP", "CZE", "DNK", "EST", "FIN", "FRA",
                       "GEO", "DEU", "GRC", "HUN", "ISL", "IRL", "ITA", "KAZ",
                       "XKX", "LVA", "LIE", "LTU", "LUX", "MLT", "MDA", "MCO",
                       "MNE", "NLD", "MKD", "NOR", "POL", "PRT", "ROU", "RUS",
                       "SMR", "SRB", "SVK", "SVN", "ESP", "SWE", "CHE", "TUR",
                       "UKR", "GBR", "VAT")
# Data source:
# https://data.europa.eu/data/datasets/covid-19-coronavirus-data-weekly-from-17-december-2020?locale=en
df <- read.csv("covid19_data.csv")

df_filtered_cases <- filter(df, year_week == "2021-01" & indicator == "cases" & country_code %in% european_countries)
df_filtered_deaths <- filter(df, year_week == "2021-01" & indicator == "deaths" & country_code %in% european_countries)

covid19_eu_data <- data.frame(
  gu_a3 = df_filtered_cases$country_code,
  name = df_filtered_cases$country,
  cumulative_cases = df_filtered_cases$cumulative_count,
  cumulative_deaths = df_filtered_deaths$cumulative_count
)

# Manually add latitudes and longitudes
covid19_eu_data <- data.frame(latitude = c(41.153332,42.546245,40.069099,47.516231,
                                                  40.143105,53.709807,50.503887,43.915886,
                                                  42.733883,45.1,35.126413,49.817492,
                                                  56.26392,58.595272,61.92411,46.227638,
                                                  42.315407,51.165691,39.074208,47.162494,
                                                  64.963051,53.41291,41.87194,48.019573,
                                                  42.602636,56.879635,47.166,55.169438,
                                                  49.815273,35.937496,47.411631,43.750298,
                                                  42.708678,52.132633,41.608635,60.472024,
                                                  51.919438,39.399872,45.943161,55.751244,
                                                  43.94236,44.016521,48.669026,46.151241,
                                                  40.463667,60.128161,46.818188,41.902916,
                                                  38.963745,48.379433,55.378051),
                                     covid19_eu_data)

covid19_eu_data <- data.frame(longitude = c(20.168331,1.601554,45.038189,14.550072,
                                                   47.576927,27.953389,4.469936,17.679076,
                                                   25.48583,15.2,33.429859,15.472962,
                                                   9.501785,25.013607,25.748151,2.213749,
                                                   43.356892,10.451526,21.824312,19.503304,
                                                   -19.020835,-8.24389,12.56738,66.923684,
                                                   20.902977,24.603189,9.555373,23.881275,
                                                   6.129583,14.375416,28.369885,7.412841,
                                                   19.37439,5.291266,21.745275,8.468946,
                                                   19.145136,-8.224454,24.96676,37.618423,
                                                   12.457777,21.005859,19.699024,14.995463,
                                                   -3.74922,18.643501,8.227512,12.453389,
                                                   35.243322,31.16558,-3.435973),
                                     covid19_eu_data)

covid19_eu_data$gu_a3[25] = "KOS" #XKX TO KOS

world <- ne_countries(scale = "medium", returnclass = "sf")

plot_data <- merge(world, covid19_eu_data, by = "gu_a3")

ggplot(data=plot_data) +
  geom_sf(aes(fill = cumulative_cases)) +
  scale_fill_gradient(low = "#FDEE87", high = "darkred", na.value = NA, labels=comma) +
  geom_point(data = covid19_eu_data, 
             aes(x = longitude, y = latitude, size=cumulative_deaths), 
             alpha = 0.7, shape = 19, color="red") +
  coord_sf(xlim = c(-22, 38), ylim = c(35, 69)) +
  ggtitle("Cumulative COVID-19 Cases and Deaths as of Week 1 2021 in Europe") +
  labs(fill="Cumulative cases", size="Cumulative deaths") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        rect = element_blank()) +
  xlab("") + ylab("")



  