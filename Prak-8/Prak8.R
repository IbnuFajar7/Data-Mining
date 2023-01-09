df=read.csv("D:/File Kuliah Semester 5/Penambangan Data/Prak-8/train_clean.csv") 
df_test=read.csv("D:/File Kuliah Semester 5/Penambangan Data/Prak-8/test_clean.csv")
head(df)
head(df_test)
str(df)
str(df_test)
surviving_female = df[(df['Sex'] == "female") & (df['Survived'] == 1)]
summary(surviving_female)
str(surviving_female)

library(tidyverse)
library(titanic)
tdf <- titanic_train
head(tdf)
tdf %>% summarize(prob = sum(Age >= 35 & Sex == "female", na.rm = TRUE)/sum(Age >= 35,na.rm=TRUE))
