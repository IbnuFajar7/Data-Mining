install.packages('caTools')
library(caTools) 
set.seed(123) 
dataset<- read_excel("D:/File Kuliah Semester 5/Penambangan Data/dataset.xlsx")
split = sample.split(dataset$purchased,SplitRatio = 0.8)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset, split == FALSE)
head (training_set)
head(test_set)
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
training_ibnu<-dataku_ibnu[,c(2,3)]
scale_ibnu<- scale(training_ibnu)
scale_ibnu
