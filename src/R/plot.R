jpeg ("rplot.jpg", width = 550, heigh = 550)
metricfile = "METRICFILE"
rawdata = read.csv (metricfile)

metricdata = rawdata$'COUNTRY'
metricdata = metricdata[!is.na(metricdata)]
print(metricdata)
metricdatats = ts (metricdata,frequency=1,start=c(1970,1))

plot.ts(metricdatats,xlab="Time",ylab="METRIC")
dev.off()
