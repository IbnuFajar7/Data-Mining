install.packages("tidyverse")
library("tidyverse") #for data wrangling tools
install.packages("titanic")
library("titanic")

tdf <- titanic_train
head(tdf)
tdf %>% 
  summarize(prob = sum(Age >= 35 & Sex == "female", na.rm = TRUE)/sum(Age >= 35, na.rm = TRUE))

#S=True/G=Female
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "female", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/G=Male
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "male", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/C=1
tdf %>% 
  summarize(prob = sum(Survived == "1" & Pclass == "1", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/C=2
tdf %>% 
  summarize(prob = sum(Survived == "1" & Pclass == "2", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/C=3
tdf %>% 
  summarize(prob = sum(Survived == "1" & Pclass == "3", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/G=Female/C=1
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "female" & Pclass == "1", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/G=Female/C=2
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "female" & Pclass == "2", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/G=Female/C=3
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "female" & Pclass == "3", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/G=male/C=1
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "male" & Pclass == "1", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/G=male/C=2
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "male" & Pclass == "2", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))
#S=True/G=male/C=3
tdf %>% 
  summarize(prob = sum(Survived == "1" & Sex == "male" & Pclass == "3", na.rm = TRUE)/sum(Survived == "1", na.rm = TRUE))


# https://www.kaggle.com/brirush/naive-bayes-for-titanic
library(e1071)
ibnu_train <- read.csv("D:/File Kuliah Semester 5/Penambangan Data/Prak-7/train_prak7.csv")
ibnu_test  <- read.csv("D:/File Kuliah Semester 5/Penambangan Data/Prak-7/test_prak7.csv")
BayesTitanicModel<-naiveBayes(as.factor(Survived)~., ibnu_train)
BayesPrediction<-predict(BayesTitanicModel, ibnu_test)
summary(BayesPrediction)
output<-data.frame(ibnu_test$PassengerId, BayesPrediction)
str(output)
colnames(output)<-cbind("PassengerId","Survived")
write.csv(output, file = 'Rushton_Solution.csv', row.names = F)

#TUGAS
excelNaive <- read.delim('clipboard')
excelNaiveTest <- read.delim('clipboard')
excelNaiveModel <- naiveBayes(as.factor(PlayGolf)~., excelNaive)
excelNaivePredic <- predict(excelNaiveModel, excelNaiveTest)
summary(excelNaivePredic)
excelNaiveOutput <- data.frame(excelNaiveTest$id, excelNaivePredic)
str(excelNaiveOutput)
colnames(excelNaiveOutput) <- cbind('id', 'PlayGolf')
write.csv(excelNaiveOutput, file = "rainy.csv", row.names = F)
