# Simple R template program to generate basic X-Y plots
# the input dataset by reading data from the dataset
# The program removes missing values/na values from
# the input dataset brefore plotting

library(imputeTS)

# open new file device for storing output of plot
jpeg ("rplot.jpg", width = 550, heigh = 550)


# read csv file
metricfile = "METRICFILE"
rawdata = read.csv (metricfile)

# extract COUNTRY's data from csv
metricdata = rawdata$'COUNTRY'

# replace missing values(na) with imputeTS interpolation
#metricdata = metricdata[!is.na(metricdata)]
metricdata = na.interpolation(metricdata)

# generate timeseries object from dataframe object
metricdatats = ts (metricdata,frequency=1,start=c(1970,1))
print (metricdatats)

# plot timeseries object
plot.ts(metricdatats,xlab="Time",ylab="METRIC")
dev.off()
