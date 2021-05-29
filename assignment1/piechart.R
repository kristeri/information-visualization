library(ggplot2)

simuldata <- data.frame(Category = c("UNDER $100", "ABOUT $100", "$100 TO $200", "$200 TO $300", "MORE THAN $300"), 
                        value = c(22, 26, 39, 10, 3))

piechart <- ggplot(simuldata, aes(x="", y=value, fill=Category)) +
  geom_bar(width=1, stat="identity") +
  coord_polar("y", start=0) +
  xlab("") +
  ylab("") +
  theme(axis.text.x=element_blank(),axis.ticks.x=element_blank()) +
  theme(axis.text.y=element_blank(),axis.ticks.y=element_blank())

piechart +
geom_text(aes(label = paste0(scales::percent(value / sum(value)))),
          position = position_stack(vjust = 0.5))