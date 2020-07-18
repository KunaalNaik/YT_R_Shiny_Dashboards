setwd("D:/GitHub/YT_R_Shiny_Dashboards/1 Basic App")
library(shiny)
library(dplyr)

server <- function(input, output, session) {

  sales = read.csv("Sales.csv", header = TRUE,  sep = ",")
  
  data <- reactive({
    req(input$sel_SalesRep)
    sales %>% filter(SalesRep %in% input$sel_SalesRep)
  })
  
  output$plot <- renderPlot({
    g <- ggplot(data(), aes( y = Units_Sold, x = Region))
    g+geom_bar(stat = "sum")
  })
}

ui <- basicPage(
  h1("Using Reactive"),
  selectInput(inputId = "sel_SalesRep",
              label = "Choose SalesRep",
              list("Amy","Bob")),
  plotOutput("plot")
)

shinyApp(ui = ui, server = server)



#Make List Dynamic
#https://stackoverflow.com/questions/40152857/how-to-dynamically-populate-dropdown-box-choices-in-shiny-dashboard