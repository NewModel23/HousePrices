library(knitr)
library(ggplot2)
library(plyr)
library(dplyr)
library(corrplot)
library(caret)
library(gridExtra)
library(scales)
library(Rmisc)
library(ggrepel)
library(randomForest)
library(psych)
library(xgboost)

getwd()

setwd("C:/Users/rguerrerop/Documents/house prices")

list.files(getwd())

train <- read.csv("train.csv", stringsAsFactors = F)
test <- read.csv("test.csv", stringsAsFactors = F)

#Getting rid of the IDs but keeping the test IDs in a vector. These are needed to compose the submission file
test_labels <- test$Id
test$Id <- NULL
train$Id <- NULL

test$SalePrice <- NA
all <- rbind(train, test)

dim(all)



ggplot(data=all[!is.na(all$SalePrice),], aes(x=SalePrice)) +
  geom_histogram(fill="blue", binwidth = 10000) +
  scale_x_continuous(breaks= seq(0, 800000, by=100000), labels = comma)


data=all[!is.na(all$SalePrice),]

summary(data$SalePrice)


