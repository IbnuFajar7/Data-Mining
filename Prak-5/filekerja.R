dataKNNibnu = read.csv("D:/File Kuliah Semester 5/Penambangan Data/Prak-5/glass.csv")
data.training <- dataKNNibnu[,1:9]    
kelas <- as.factor(dataKNNibnu[,10])
View(dataKNNibnu)
str(dataKNNibnu)

kelas <- as.factor(dataKNNibnu[,10])
amatan.baru <- c(1.51, 14.12, 1.78, 1.79, 73.1, 0.0, 8.70, 0.76, 0.0)
library(class)
knn(data.training, amatan.baru, kelas, k=1)

amatan.baru2 <- c(1.51, 13.12, 1.78, 1.0, 73.1, 0.2, 7.70, 0.76, 0.0)
knn(data.training, amatan.baru2, kelas, k=5)

dataku=iris
library(ggplot2)
ggplot(dataku, aes(x=Petal.Length, y=Petal.Width)) + geom_point()

kelas <- as.factor(dataku[,4])
pengamatan.baru <- c(3.8, 1.5)
library(class)
data.training <- dataku[,3:4]
kelas <- as.factor(dataku[,5])
knn(data.training, pengamatan.baru, kelas, k=5)

x <- seq(1.00, 6.00, by=0.2)
y <- seq(0.00, 2.50, by=0.05)
grid <- NULL
for (i in x) {
  for (j in y) {
    grid <- rbind(grid, c(i, j))}}
datagambar <- data.frame(grid)
datagambar

qplot(datagambar$X1, datagambar$X2)
prediksi <- knn(data.training, datagambar, kelas, k = 5)
plot (datagambar[,1], datagambar[,2],col=ifelse(prediksi == "versicolor", "cyan", "orange"), pch=ifelse(prediksi == "versicolor", 6, 5))

dataKNNibnu = read.csv("D:/File Kuliah Semester 5/Penambangan Data/Prak-5/tugasprak5.csv", sep=";")
dataKNNibnu
View(dataKNNibnu)
str(dataKNNibnu)
library(class)
kelas <- as.factor(dataKNNibnu[,3])
data.training <- dataKNNibnu[,1:2]
amatan.baru <- c(4.2, 3.7)
knn(data.training, amatan.baru, kelas, k=3)

