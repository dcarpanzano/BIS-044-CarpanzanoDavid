library(data.table)
library(tidyverse)
library(stringr)

DC <- read.csv("USvideos.csv")
attach(DC)

DC$trending_date <- as.Date(DC$trending_date, format="%y.%d.%m")

DC <- DC %>% seperate(col=publish_time,into=c("PDate", "PTime"), "T",extra="merge")
DC$PDate <- as.Date(DC$PDate)

DC$PTime <- substr(DC$PTime,1nchar(DC$PTime)-5)
DC$PTime <- as.POSIXct(paste(DC$PDate, DC$PTime), format="%Y-%m-%d %H:%M:%S")

DC$title <- str_to_title(title)

view(DC)