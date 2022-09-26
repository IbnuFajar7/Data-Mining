library(rpart)
library("readxl")
library(rpart.plot)
dataku_ibnu <-read_excel("D:/File Kuliah Semester 5/Penambangan Data/Prak-3/car_evaluation.xlsx")
View(dataku_ibnu)
colnames(dataku_ibnu) <- c('buying', 'maint', 'doors', 'persons', 'lug_boot', 'safety', 'class')
pohon <- rpart(class~.,data = dataku_ibnu, method = "class", control=rpart.control(minsplit = 1, cp= 0))
prp(pohon,extra = 1)

install.packages("tree")
library(tree)
dataku2_ibnu = read_excel("D:/File Kuliah Semester 5/Penambangan Data/Prak-3/data1.xlsx")
dataku2_ibnu$bermain = as.factor(dataku2_ibnu$bermain)
dataku2_ibnu
sample=dataku2_ibnu
samplegolf<-sample(1:nrow(sample),0.80*nrow(sample)) 
traininggolf<-data.frame(sample)[samplegolf,]
testinggolf<-data.frame(sample)[-samplegolf,]
pohongolf <- rpart(bermain ~ cuaca + suhu + kelembaban + berangin,data=traininggolf, method = "class", control = rpart.control(minsplit = 5, cp = 0))
prp(pohongolf,extra=4,box.col=c("pink","red","blue"))

prediksi=predict(pohongolf,testinggolf)
pred.respon<- colnames(prediksi)[max.col(prediksi, ties.method = c("random"))]
pred.respon
class=table(pred.respon,testinggolf$bermain)
class

