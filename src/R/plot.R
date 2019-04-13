library(ggplot2)
library(tidyverse)
library(ggfortify)

jpeg ("rplot.jpg", width = 550, heigh = 550)
metricfile = "METRICFILE"
rawdata = read.csv (metricfile)

metricdata = rawdata$'COUNTRY'
metricdata = metricdata[!is.na(metricdata)]
metricdatats = ts (metricdata,frequency=1,start=c(1970,1))
print (metricdatats)
#autoplot (metricdatats)
plot.ts(metricdatats,xlab="Time",ylab="METRIC")
dev.off()
