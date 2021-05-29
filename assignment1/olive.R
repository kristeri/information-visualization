df <- read.csv("olive.csv")

dat <- df[ , c(4:7)]

cols <- c("red", "blue", "green")
par(mar = c(0,0,0,0))
plot(dat, pch=21, 
     cex=1.5, col="black", bg=cols[df$Region])
title(main="", col.main="black", font.main=4, line=0)
#legend("topleft", legend=c("1","2","3"), pch=21, col="black", pt.bg=cols, title="Region")
