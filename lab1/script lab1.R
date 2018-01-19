library(tidyverse)
library(stargazer)
library(knitr)
library(lubridate)
library(plm)

setwd("D:/ASUS WebStorage/R Data Folder/ECN431/lab1")
rossmann <- read.csv('rossmann.csv')

View(rossmann)

count(rossmann, storetype)
count(rossmann, assortment)

rossmann <- rossmann %>% mutate (
  salest = sales/1000,
  customerst = customers/1000,
  compdistkm = compdist/1000
) 

View(rossmann)

salereg_storetype <- lm(salest ~ storetype, data = rossmann)

summary(salereg_storetype)
stargazer(salereg_storetype, type = 'text')

ggplot(data = rossmann, mapping = aes(x=storetype, y=open))+stat_summary(fun.y = 'sd', geom='bar')+xlab('Store concept') + ylab('Share of days open')

ggplot(rossmann) + stat_summary(mapping=aes(x=storetype,y=open),fun.y='var', geom='bar')+labs(x='Store concept',y='Share of days open')


