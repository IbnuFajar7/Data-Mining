dataku=read.csv("D:/File Kuliah Semester 5/Data Analitik/Prak-7/titanic.csv", sep = ";")
#analisis group mean (predictor numeric)
dataku$Fare = as.numeric(as.character(dataku$Fare))
str(dataku)
by(dataku$Age, dataku$Survived, mean)
by(dataku$Fare, dataku$Survived, mean)

##analisa cross tabulation (predictor kategorik)
table(dataku$Sex, dataku$Survived)
table(dataku$Pclass, dataku$Survived)


#boxplot
library("ggplot2")
boxplot(dataku$Age~dataku$Survived)
boxplot(dataku$Fare~dataku$Survived)

##ek2
library(rpart)
library(rpart.plot)
library(caret)
head(dataku)
sampleTitanic<-sample(1:nrow(dataku),0.75*nrow(dataku)) 
trainingTitanic<-data.frame(dataku)[sampleTitanic,]
testingTitanic<-data.frame(dataku)[-sampleTitanic,]
pohonTitanic <- rpart(Survived ~ Sex + Age + Fare + Pclass,data=trainingTitanic, method = "class", control = rpart.control(minsplit = 25, cp = 0))
prp(pohonTitanic,extra=4,box.col=c("pink","red","blue"))

prediksi=predict(pohonTitanic,testingTitanic)
pred.respon<- colnames(prediksi)[max.col(prediksi, ties.method = c("random"))]
class=table(pred.respon,testingTitanic$Survived)
class

library(e1071)
View(dataku)
sampleTitanic<-sample(1:nrow(dataku),0.75*nrow(dataku))
trainingTitanic<-data.frame(dataku)[sampleTitanic,]
testingTitanic<-data.frame(dataku)[-sampleTitanic,]
BayesTitanicModel<-naiveBayes(as.factor(Survived)~., trainingTitanic)
BayesPrediction<-predict(BayesTitanicModel, testingTitanic)
summary(BayesPrediction)
output<-data.frame(testingTitanic, BayesPrediction)
str(output)
colnames(output)<-cbind("Survived")
