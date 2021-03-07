"Assignment 6 Dataset.txt"
# install/select plyr package
install.packages("plyr")
library(plyr)
# import data
# get average grade by sex
StudentGradeAverage = ddply(Assignment.8.Dataset,"Sex",transform,Grade.Average=mean(Grade))
# get average age by sex
StudentAgeAverage = ddply(Assignment.8.Dataset, "Sex",transform,Age.Average=mean(Age))
# write tables to file
write.table(StudentGradeAverage,"Grade_Average_by_Sex")
write.table(StudentAgeAverage, "Age_Average_by_Sex")
# write tables to CSV (Comma Separated Values)
write.table(StudentGradeAverage,"Grade_Average_by_Sex",sep=",")
write.table(StudentAgeAverage, "Age_Average_by_Sex",sep=",")
# dplyr package aggregation for fun
GradeAveSex <- Assignment.8.Dataset %>% group_by(Sex) %>% summarize(GradeAveSex = mean(Grade))
AgeAveSex <- Assignment.8.Dataset %>% group_by(Sex) %>% summarize(AgeAveSex = mean(Age))
# create table of names containing letter I/i
i_students = subset(Assignment.8.Dataset,grepl("i",Assignment.8.Dataset$Name,ignore.case=TRUE))
# write "i" students to file
write.table(i_students,"i_students")
# write "i" students to CSV
write.table(i_students,"i_students",sep=",")
# dplyr alternative for "i" students
students_with_i <- Assignment.8.Dataset %>% filter(grepl("i",Name,ignore.case = TRUE))