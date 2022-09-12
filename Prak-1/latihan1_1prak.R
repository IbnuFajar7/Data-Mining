dataku_ibnu=read.csv("D:/File Kuliah Semester 5/Penambangan Data/train1.csv")
head(dataku_ibnu)

library("readxl")
dataku_ibnu=read_excel("D:/File Kuliah Semester 5/Penambangan Data/train.xlsx")
head(dataku_ibnu)
str(dataku_ibnu)
is.na(dataku_ibnu)
apply(is.na(dataku_ibnu), 2, which)
data_drop = na.omit(dataku_ibnu)
View(data_drop)
hist(dataku_ibnu$Age, main = "Histogram Passange", 
     xlab = "Usia",xlim=c(0,100), ylim = c(0,250), col="blue")
boxplot(dataku_ibnu$Age, main = "Boxplot Age")
mean(dataku_ibnu$Age)
mean(dataku_ibnu$Age, na.rm = 'TRUE')

dataku_ibnu$Age = ifelse(is.na(dataku_ibnu$Age),ave(dataku_ibnu$Age, FUN = function(x) mean(x, na.rm = 'TRUE')), dataku_ibnu$Age)
head(dataku_ibnu)

dataku_ibnu<- read_excel("D:/File Kuliah Semester 5/Penambangan Data/latihan1.xlsx")
head(dataku_ibnu)
str(dataku_ibnu)
is.na(dataku_ibnu)
apply(is.na(dataku_ibnu), 2, which)
data_drop = na.omit(dataku_ibnu)
View(data_drop)
hist(dataku_ibnu$age, main = "Histogram Passange", 
     xlab = "Usia",xlim=c(0,100), ylim = c(0,250), col="blue")
boxplot(dataku_ibnu$age, main = "Boxplot Age")
mean(dataku_ibnu$age)
mean(dataku_ibnu$age, na.rm = 'TRUE')

dataku_ibnu$age = ifelse(is.na(dataku_ibnu$age),ave(dataku_ibnu$age, FUN = function(x) mean(x, na.rm = 'TRUE')), dataku_ibnu$age)
head(dataku_ibnu)

hist(dataku_ibnu$salary, main = "Histogram Passange", 
     xlab = "Usia",xlim=c(0,100), ylim = c(0,250), col="blue")
boxplot(dataku_ibnu$salary, main = "Boxplot Age")
mean(dataku_ibnu$salary)
mean(dataku_ibnu$salary, na.rm = 'TRUE')

dataku_ibnu$salary = ifelse(is.na(dataku_ibnu$salary),ave(dataku_ibnu$salary, FUN = function(x) mean(x, na.rm = 'TRUE')), dataku_ibnu$salary)
head(dataku_ibnu)
