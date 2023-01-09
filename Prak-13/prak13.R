library(arules)
install.packages("arulesViz")
library(arulesViz)
dataku=read.delim("clipboard")
dataku
categoric<- c("perusahaan", "sebab", "hasil")

transactions <- as(dataku[, categoric], "transactions") 
itemFrequencyPlot(transactions, topN = 7)


rules <- apriori(transactions,parameter = list(minlen=3, supp=0.10, conf=0.7), appearance = list(rhs=c("hasil=Semua Selamat","hasil=Sebagian Selamat","hasil=Tidak Selamat")))

inspect(rules)

plot(rules, method="graph")


plot(rules, method="graph", engine = "interactive")


##################################
library(arules)
library(arulesViz)

#memanggil data
latihan=read.delim("clipboard") 
latihan

#analisis data
latihan1<-split(latihan$Peristiwa,latihan$Kejadian)
latihan2<-as(latihan1,"transactions")
latihan2

rules<-apriori(latihan2,parameter=list
               (supp=0.04,conf=0.9,minlen=3))

inspect(rules)

itemFrequencyPlot(latihan2, topN = 7)

plot(rules, method="graph")

######################################
dataibnu=read.delim("clipboard")
dataibnu
categoric<- c("Graduate", "Skill", "Wellfare", "Personality", "Credit.History")

transactions <- as(dataibnu[, categoric], "transactions") 
itemFrequencyPlot(transactions, topN = 5)


rules <- apriori(transactions,parameter = list(minlen=3, supp=0.10, conf=0.7), appearance = list(rhs=c("Credit.History=Succeed","Credit.History=Not Succeed")))

inspect(rules)

plot(rules, method="graph")


plot(rules, method="graph", engine = "interactive")

