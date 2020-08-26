setwd("D:/GitHub/YT_R_Shiny_Dashboards/1 Basic App")
library(shiny)
library(dplyr)
library(ggplot2)

server <- function(input, output, session) {
  
  sales = read.csv("Sales_Sample.csv", header = TRUE,  sep = ",")
  
  #Summarize Data and then Plot
  data <- reactive({
    req(input$sel_SalesRep)
    df <- sales %>% filter(SalesRep %in% input$sel_SalesRep) %>%  group_by(QTR) %>% summarise(Sales = sum(Sales))
  })
  
  #Plot 
  output$plot <- renderPlot({
    g <- ggplot(data(), aes( y = Sales, x = QTR))
    g + geom_bar(stat = "sum")
  })
}

ui <- basicPage(
  h1("R Shiny interactive Bar Chart using Reactive and Render"),
  selectInput(inputId = "sel_SalesRep",
              label = "Choose Sales Rep",
              list("Amy","Bob","Chuck","Doug")),
  plotOutput("plot")
)

shinyApp(ui = ui, server = server)



#Make List Dynamic
#https://stackoverflow.com/questions/40152857/how-to-dynamically-populate-dropdown-box-choices-in-shiny-dashboard