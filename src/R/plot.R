# Simple R template program to generate basic X-Y plots
# the input dataset by reading data from the dataset
# The program removes missing values/na values from
# the input dataset brefore plotting


# open new file device for storing output of plot
library (imputeTS)
jpeg ("rplot.jpg", width = 650, height = 550)

metric = "METRIC"


# read csv file
metricfile = "METRICFILE"
rawdata = read.csv (metricfile)

# extract COUNTRY's data from csv
metricdata = rawdata$'COUNTRY'


if ( sum(is.na(metricdata) ) > 5 ) {
	print ("Too many missing values, cannot forecast reliably")
	stopifnot (TRUE)
}
metricdata = na.interpolation (metricdata,option="linear")

if ( metric == "Access to Electricity(%)" ) {
    startval = 1990
    offset = 27
} else if ( metric == "GDP") {
    offset = length(metricdata)
    startval = 1970
    endval = 2017
} else if ( metric == "Agriculture value (% of GDP)") {
	offset = length(metricdata)
	startval = 1970
	endval = 2016
} else if ( metric == "Agricultural Land(%)") {
	offset = length (metricdata)
	startval = 1970
	endval = 2015
} else if ( metric == "Agricultural Land Area") {
	offset = length (metricdata)
	startval = 1970
	endval = 2015
} else if ( metric == "CO2 Emissions" ) {
	offset = length (metricdata)
	startval = 1970
	endval = 2014
} else if ( metric == "Female Population") {
	offset = length (metricdata)
	startval = 1970
	endval = 2019
} else if ( metric == "Infant Mortality Rate") {
	offset = length (metricdata)
	startval = 1970
	endval = 2017
} else if ( metric == "National Income" ) {
	offset = length (metricdata)
	startval = 1970
	endval = 2016
} else if ( metric == "Population Density") {
	offset = length (metricdata)
	startval = 1970
	endval = 2017
} else if ( metric == "Female Population(%)" ) {
	offset = length (metricdata)
	startval = 1970
	endval = 2019
} else if ( metric == "Male Population(%)") {
	offset = length (metricdata)
	startval = 1970
	endval = 2019
} else if ( metric == "Male Population") {
	offset = length (metricdata)
	startval = 1970
	endval = 2019
} else if (metric == "Total Population") {
	offset = length (metricdata)
	startval = 1970
	endval = 2019
}



# display summary of data
#print (summary (metricdata))


# generate timeseries object from dataframe object
metricdatats = ts (metricdata,frequency=1,start= startval)
print (metricdatats)

# plot timeseries object
plot.ts(metricdatats,xlab="Time",ylab="METRIC")
dev.off()
