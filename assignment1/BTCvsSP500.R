library(ggplot2)
library(tidyr)

df <- read.csv("BTCvsSP500.csv")
df$date <- as.Date(df$date, "%Y-%m-%d")

ggplot(data = df, aes(date)) +
  geom_line(aes(y = BTC, colour = "BTC")) + 
  geom_line(aes(y = SP500, colour = "SP500")) +
  theme(legend.title=element_blank()) +
  scale_color_manual(values=c("tomato", "#9999CC")) +
  ylab("Growth log 10") +
  xlab("Time") + 
  scale_y_log10()
