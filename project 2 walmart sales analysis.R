walmart_data

```{r}
#loading data set
walmart_data <-read.csv("C:/Users/Monesh Raja/Downloads/Walmart_Sales.csv")
walmart_data
head(walmart_data)
```

```{r}
#check data types:
str(walmart_data)

#change data type of date column from character to date
walmart_data$Date<-as.Date(walmart_data$Date, format="%d-%m-%Y")
head(walmart_data)

```

```{r}
# check and remove duplicate records

#check it
sum(duplicated(walmart_data))

#remove it
walmart_data<-walmart_data[!duplicated(walmart_data), ]
walmart_data

```

```{r}
#detect and remove Outliers(weekly_sales column) 
#visualize boxplot
boxplot(walmart_data$Weekly_Sales, main="weeklysales outliers", col="lightblue")
#remove extreme outliers top and bottom 5%:
q<-quantile(walmart_data$Weekly_Sales, probs = c(0.05, 0.95))
walmart_data<-walmart_data[walmart_data$Weekly_Sales >=q[1] & walmart_data$Weekly_Sales <= q[2], ]
```

```{r}

#final opening of data to check:
walmart_data

```

```{r}
#save cleaned data
write.csv(walmart_data, "cleaned_walmart_sales.csv", row.names = FALSE)
```
