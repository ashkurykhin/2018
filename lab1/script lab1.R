library(tidyverse)
library(stargazer)
library(knitr)
library(lubridate)
library(plm)

setwd("D:/ASUS WebStorage/R Data Folder/ECN431/lab1")
rossmann <- read.csv('rossmann.csv')

view(rossmann)

count(rossmann, storetype)

rossmann <- rossmann %>% mutate (
  salest = sales/1000,
  customerst = customers/1000,
  compdistkm = compdist/1000
) 

view(rossmann)

salereg_storetype <- lm(salest ~ storetype, data = rossmann)

summary(salereg_storetype)
stargazer(salereg_storetype, type = 'text')
