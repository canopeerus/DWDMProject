# R template program to run forecast model on 
# particular country and metric

library(tseries)
library(forecast)
library(imputeTS)

jpeg ("rforecast.jpg", width = 550, height = 550)

metricfile = "METRICFILE"
metric = "METRIC"
rawdata = read.csv (metricfile)


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
}  else if ( metric == "National Income" ) {
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

metricdata = tail (metricdata,offset) 


metricdatats = ts (metricdata, frequency = 1, start = startval, end = endval)

arimafit = auto.arima (metricdatats, approximation = FALSE,trace = TRUE)
fcast = forecast (object =arimafit, h = 10)
plot (fcast,ylab="Forecast for METRIC")

dev.off()
