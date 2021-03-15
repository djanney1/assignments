# import "wmurders" dataset from 
# https://vincentarelbundock.github.io/Rdatasets/datasets.html
# Dataset description:
# Annual female murder rate (per 100,000 standard population) in the USA. 1950-2004.
# standard R graphs
plot(wmurders)
# assign dataset columns to variables
Year <- wmurders$time
Rate <- wmurders$value
# plot basic
plot(Year,Rate)
# or
plot(wmurders$time,wmurders$value)
# execute par() to see following six plots together
par(mfrow = c(3,2))
# plot points
plot(Year,Rate,type="p",col="red",
     main = "Annual female murder rate per 100,000 standard population")
# plot lines
plot(Year,Rate,type="l",col="red",
     main = "Annual female murder rate per 100,000 standard population") 
# plot both points and lines
plot(Year,Rate,type="b",col="red",
     main = "Annual female murder rate per 100,000 standard population")
# plot overlayed 
plot(Year,Rate,type="o",col="red",
     main = "Annual female murder rate per 100,000 standard population")
# plot histogram-like
plot(Year,Rate,type="h",col="red",
     main = "Annual female murder rate per 100,000 standard population")
# plot steps
plot(Year,Rate,type="s",col="red",
     main = "Annual female murder rate per 100,000 standard population")
# I want to create a barplot of the decade average rates
# assign variables to divide data by decade
Fifties <- subset(wmurders,grepl("195",wmurders$time))
Sixties <- subset(wmurders,grepl("196",wmurders$time))
Seventies <- subset(wmurders,grepl("197",wmurders$time))
Eighties <- subset(wmurders,grepl("198",wmurders$time))
Nineties <- subset(wmurders,grepl("199",wmurders$time))
Twothousand <- subset(wmurders,grepl("200",wmurders$time))
# assign variables to mean murder rate by decade
Average50s <- mean(Fifties$value)
Average60s <- mean(Sixties$value)
Average70s <- mean(Seventies$value)
Average80s <- mean(Eighties$value)
Average90s <- mean(Nineties$value)
Average00s <- mean(Twothousand$value)
# create dataframe of mean rates by decade
Decades <- c("1950s","1960s","1970s","1980s","1990s","2000s")
Average_by_Decade <- c(Average50s,Average60s,Average70s,Average80s,Average90s,Average00s)
Averages <- data.frame(Decade,Average_by_Decade)
# barplot
barplot(Average_by_Decade, main="Average female murder rate (per 100,000 standard population) by decade",
        xlab="Decades",ylab="Rate", names.arg=c("1950s","1960s","1970s","1980s","1990s","2000s"), 
        border="red3", density=c(10,20,30,40,50))
# can I add the decade averages to the original dataset?
# create vector of decades
time_dec <- rep(x= c(1950,1960,1970,1980,1990,2000), each=10)
# remove excess values that would represent 2005-2009
time_dec <- time_dec[-(56:60)]
# add new column to dataset
wmurders <- cbind(wmurders, time_dec = time_dec)
# assign name for labeling purposes
Decade <- wmurders$time_dec
# dplyr method to find the mean rate per decade
altAverages <- wmurders %>% group_by(time_dec) %>% summarise(mean = mean(value))
# barplot using altAverages
barplot(altAverages$mean,main="Average female murder rate per 100,000 standard population (by decade)",
        xlab="Decade",ylab="Rate",names.arg=c("1950s","1960s","1970s","1980s","1990s","2000s"),col="red3")
# simple histograms of frequency
hist(Rate, main="Frequency of female murder rates (per 100,000 standard population): 1950-2004")
hist(Average_by_Decade, main="Frequency of averages of female murder rate (per 100,000 standard population) by decades 1950-2000")
# pie charts
pie(Average_by_Decade) #basic
pie(Average_by_Decade, main="Average female murder rate by decade", 
    col=heat.colors(length(Average_by_Decade)),
    labels=c("1950s","1960s","1970s","1980s","1990s","2000s"))
murder_labels <- round(Average_by_Decade/sum(Average_by_Decade) * 100, 1)
murder_labels <- paste(murder_labels, "%", sep="")
pie(Average_by_Decade, main="Average female murder rate by decade", 
    col=heat.colors(length(Average_by_Decade)), labels=murder_labels)
legend("right",c("1950s","1960s","1970s","1980s","1990s","2000s"), cex = 0.8,
       fill = heat.colors(length(Average_by_Decade)))
# boxplot
boxplot(Rate~time_dec, main="Average female murder rate by decade
        (per 100,000 standard population): 1950-2000",col=heat.colors(length(Average_by_Decade)),
        xlab="Decade",ylab="Rate")
###
# lattice package
# scatterplot
xyplot(Rate ~ Year, wmurders, grid = TRUE)
xyplot(Rate ~ Year, wmurders, grid = TRUE, type=c("p","r"))
xyplot(Rate ~ Year, wmurders, grid = TRUE, type=c("p","smooth"))
# shows decade rates plotted in separate frames
xyplot(Rate ~ Year | Decade, wmurders, group = time_dec, grid = TRUE)
# density plot
densityplot(~Rate)
# create factor with value labels
decade.f<-factor(Decade,levels=c(1950,1960,1970,1980,1990,2000),
               labels=c("1950s","1960s","1970s","1980s","1990s","2000s"))
densityplot(~Rate|decade.f)
# histogram
histogram(~Rate)
histogram(~Average_by_Decade)
# boxplot
bwplot(decade.f~Rate)
###
# ggplot2 package
# points
ggplot(wmurders, aes(Year, Rate, colour = Rate)) + 
    geom_point()
# add title and subtitle
ggplot(wmurders, aes(Year, Rate, colour = Rate)) + 
    geom_point() + labs(title="Annual female murder rate", 
                subtitle="per 100,000 standard population")
# jitter things up
ggplot(wmurders, aes(Year, Rate, colour = Rate)) + 
    geom_point() + geom_jitter()
# dots
ggplot(wmurders, aes(x = Rate)) + geom_dotplot()
ggplot(wmurders, aes(x = Rate)) + geom_dotplot(binwidth = .1)
ggplot(wmurders, aes(x = Rate)) + geom_dotplot(binwidth = .1) + scale_y_continuous(NULL, breaks = NULL)
