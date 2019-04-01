
# Fill missing values with column median
```R
#convert each NA to median value from the column
indiagdp[is.na(indiagdp)] = median(indiagdp,na.rm = TRUE)
```

# 3 components of a time series
* Seasonality
* Irregularity (error)
* Trend

***Multiplicative***: 
Y<sub>t</sub> = S<sub>t</sub> * T<sub>t</sub> * e<sub>t</sub>

Similarly for additive it will be sum of 3 terms.

**GDP based time series is generally a multiplicative time series**

