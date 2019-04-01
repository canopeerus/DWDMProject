
# Fill missing values with column median
```R
#convert each NA to median value from the column
indiagdp[is.na(indiagdp)] = median(indiagdp,na.rm = TRUE)
```
