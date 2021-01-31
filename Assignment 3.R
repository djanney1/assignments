# Input data:
Name <- c("Jeb","Donald","Ted","Marco","Carly","Hillary","Bernie")
ABC_political_poll_results <- c(4,62,51,21,2,14,15)
NBC_political_poll_results <- c(12,75,43,19,1,21,19)
# Simplify labels:
ABC <- ABC_political_poll_results
NBC <- NBC_political_poll_results
# Matrix and data.frame:
polls <-cbind(Name,ABC,NBC)
polls.df <- data.frame(Name,ABC,NBC)
# Filter second and third columns of numerical values:
polls.df[,2:3]
# Assign name to numerical values:
polls_only <- polls.df[,2:3]
# Calculate mean for each candidate:
rowMeans(polls_only) # returns:
# [1] 8.0 68.5 47.0 20.0  1.5 17.5 17.0
summary(polls_only) # returns
#      ABC             NBC
# Min.   : 2.00   Min.   : 1.00
# 1st Qu.: 9.00   1st Qu.:15.50
# Median :15.00   Median :19.00
# Mean   :24.14   Mean   :27.14
# 3rd Qu.:36.00   3rd Qu.:32.00
# Max.   :62.00   Max.   :75.00
barplot(cbind(ABC,NBC) ~ Name, data = polls)
