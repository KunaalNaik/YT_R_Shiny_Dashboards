setwd("D:/GitHub/YT_R_Shiny_Dashboards/1 Basic App")
#https://www.r-graph-gallery.com/48-grouped-barplot-with-ggplot2.html
#https://www.r-graph-gallery.com/index.html
library(shiny)
library(dplyr)
library(ggplot2)
library(viridis)
library(hrbrthemes)

sales = read.csv("Sales_Sample.csv", header = TRUE,  sep = ",")

#4 Basic Bar Plot
barplot(sales$Sales)

#4 Basic Bar Plot with Group By
df <- sales %>% group_by(QTR) %>% summarise(Sales = sum(Sales))
barplot(df$Sales)
g <- ggplot(df, aes( y = Sales, x = QTR))
g+geom_bar(stat = "sum")


#GGPLOT , Reactive and Render
df <- sales %>% filter(SalesRep %in% c("Amy")) 
sales %>% filter(SalesRep %in% input$sel_SalesRep) %>% select(Units_Sold)

g <- ggplot(df, aes( y = Units_Sold, x = Region))
g+geom_bar(stat = "sum")


            