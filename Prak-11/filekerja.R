##ek 1
install.packages("neuralnet")
ind <- sample(2, nrow(iris), replace = TRUE, prob=c(0.7, 0.3))
library(neuralnet)
trainset = iris[ind == 1,]
testset = iris[ind == 2,]
trainset$setosa = trainset$Species == "setosa"
trainset$virginica = trainset$Species == "virginica"
trainset$versicolor = trainset$ Species == "versicolor"
network = neuralnet(versicolor + virginica + setosa~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, trainset, hidden=3)
plot(network)
network$result.matrix
head(network$generalized.weights[[1]])

##tugas ek 1 
data_nama = read.delim("clipboard")
head(data_nama)
ind <- sample(2, nrow(data_nama), replace = TRUE, prob=c(0.7, 0.3))
trainset = data_nama[ind == 1,]
testset = data_nama[ind == 2,]
View(trainset)
View(testset)
trainset$ya = trainset$bermain == "ya"
trainset$tidak = trainset$bermain == "tidak"
network = neuralnet(ya + tidak~ suhu + Kelembaban, trainset, hidden=2)
plot(network)
network$result.matrix
head(network$generalized.weights[[1]])

##ek 2
library(RMySQL)
library(dplyr)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'dbpibcolap', host = 'localhost')
dbListTables(con)
myQuery <- "select * from fact_harga;"
df <- dbGetQuery(con, myQuery)
df1<-filter(df,SK_RICE_TYPE==10, SK_DATE>=20170101,SK_DATE<=20171231, SK_MARKET==0)
df2<- df1[order(df1$SK_DATE),] 
View(df2)
tseries <- ts(df2$PRICE, start = c(2017, 1), frequency = 300)

library(nnfor)
library(forecast)
#MLP
fit<-mlp(tseries)
plot(fit)
f2=forecast(fit, h=90)
plot(f2)
summary(f2)

