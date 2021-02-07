# data values for 10 hospital patients:
# frequency to hospital over 12 months, blood pressure, first
# doctor assessment, second doctor assessment, final decision by head of ER
# 0=good/low, 1=bad/high
Frequency <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)
BP <- c(103,87,32,42,59,109,78,205,135,176)
First <- c(1,1,1,1,0,0,0,0,NA,1)
Second <- c(0,0,1,1,0,0,1,1,1,1)
FinalDecision <- c(0,1,0,1,0,1,0,1,1,1)
# matrix and data.frame
assessments <- cbind(Frequency,BP,First,Second,FinalDecision)
assessments.df <- data.frame(Frequency,BP,First,Second,FinalDecision)
# boxplot of BP values
BPboxplot <- boxplot(BP, horizontal = TRUE,xlab="Blood Pressure (BP)")
# boxplots comparing BP to assessments
boxplot1 <- boxplot(BP~First,
            data=assessments.df,
            main="BP and First boxplot",
            xlab="Risk",
            ylab="Blood Pressure")
boxplot2 <- boxplot(BP~Second,
            data=assessments.df,
            main="BP and Second boxplot",
            xlab="Risk",
            ylab="Blood Pressure")
boxplot3 <- boxplot(BP~FinalDecision,
            data=assessments.df,
            main="BP and Final Decision boxplot",
            xlab="Risk",
            ylab="Blood Pressure")
# histograms
freq_hist <- hist(Frequency,
                  xlab = "Frequency of Hospital Visits per Year",
                  ylab = "Number of Patients")
BP_hist <- hist(BP,
                ylab = "Number of Patients",
                breaks = 5)
