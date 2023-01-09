library(RMySQL)
library(nnfor)
library(dplyr)
library(hydroGOF)
library(e1071)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'factharga', host = 'localhost')
dbListTables(con) 
myQuery <- "select * from fact_harga;"
df <- dbGetQuery(con, myQuery)
#Latihan 1.1.1
df1<-filter(df,SK_RICE_TYPE==9, SK_DATE>=20180101, SK_DATE<=20181231, SK_MARKET==0)
View(df1)
dim(df1)

myts=ts(df1$PRICE)
myts

X=c(1:243) #sesuaikan jumlah observasinya
#Regression with SVM
modelsvm = svm(df1$PRICE~X,data=df1)
modelsvm

#Predict using SVM regression
predYsvm = predict(modelsvm, data=df1)

#Overlay SVM Predictions on Scatter Plot
plot(X, predYsvm, col = "red", pch=16)
points(X,df1$PRICE, col="blue", pch=16)

#Calculate RMSE 
RMSEsvm=rmse(predYsvm,df1$PRICE)
RMSEsvm
#Overlay SVM Predictions on Scatter Plot
X=c(1:273)

fit2 <- mlp(myts)
plot(fit2, col = "red", pch=16)
points(df1$PRICE, col="blue", pch=16)




#Latihan 1.1.2
library(statsr)
library(RMySQL)
library(dplyr)
con = dbConnect(MySQL(), user = 'root', password = '', dbname = 'dbpasokanberas', host = 'localhost')
dbListTables(con)
myQuery <- "select * from fact_price;"
df <- dbGetQuery(con, myQuery)
df1<-filter(df,id_rice_type==10, id_date>=20170101,id_date<=20171231)
df2<- df1[order(df1$id_date),] 
View(df1)

myts=ts(df1$harga)
myts

X=c(1:365) #sesuaikan jumlah observasinya
#Regression with SVM
modelsvm = svm(df1$harga~X,data=df1)
modelsvm

#Predict using SVM regression
predYsvm = predict(modelsvm, data=df1)

#Overlay SVM Predictions on Scatter Plot
plot(X, predYsvm, col = "red", pch=16)
points(X,df1$harga, col="blue", pch=16)

#Calculate RMSE 
RMSEsvm=rmse(predYsvm,df1$harga)
RMSEsvm
#Overlay SVM Predictions on Scatter Plot
X=c(1:273)

fit2 <- mlp(myts)
plot(fit2, col = "red", pch=16)
points(df1$harga, col="blue", pch=16)
