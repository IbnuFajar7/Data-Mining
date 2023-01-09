library("readxl") 
library("factoextra") 
#my_data <- read_excel(file.choose(), sheet = "",range = "") 
my_data <- read.delim("clipboard")
my_data
print(my_data) 
str(my_data) 
d.euc <- dist(my_data) 
d.euc
d.sqeuc <- d.euc^2 
d.sqeuc
cluster<- hclust(d = d.sqeuc, method = "centroid") 
fviz_dend(cluster, cex = 0.6) 

#if(!require(devtools)) install.packages("devtools") 
#devtools::install_github("kassambara/factoextra") 





klaster <- kmeans(my_data[, 2:3], 3, nstart = 20) 
klaster 
table(klaster$cluster, my_data$observation) 

#EK 2
library(factoextra) 
library(NbClust) 
library(dplyr) 

dataku=read.delim("clipboard") 
dataku
data_latih <-dataku[,c(2,3,4)] 
data_latih_matrix <- as.matrix(scale(data_latih)) 
lnb <- NbClust(data_latih, distance = "euclidean", min.nc = 2,max.nc = 8, method = "complete", index ="all") 

km.res=kmeans(data_latih, 3, nstart=25) 
km.res 

fviz_cluster(km.res, data = data_latih, geom = "point",stand = FALSE, frame.type = "norm") 
fviz_cluster(km.res, data = data_latih) 

df=scale(dataku[,2:4]) 
res.dist <- dist(df, method = "euclidean") 
res.hc <- hclust(d = res.dist, method = "ward.D2") 
library("factoextra") 
fviz_dend(res.hc, cex = 0.5) 
fviz_dend(res.hc, k = 4, cex = 0.5, k_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"), color_labels_by_k = TRUE, rect = TRUE) 


