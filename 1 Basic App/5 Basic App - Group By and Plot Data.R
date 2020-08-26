library(shiny)
library(dplyr)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    sales = read.csv("Sales_Sample.csv", header = TRUE,  sep = ",")
    
    #Summarize Data and Plot Chart
    df <- sales %>% group_by(QTR) %>% summarize(Sales = sum(Sales))
    
    #Plot 
    barplot(df$Sales)
  })
}

ui <- basicPage(
  h1("Summarize data and Plot"),
  plotOutput("plot")
)

shinyApp(ui = ui, server = server)