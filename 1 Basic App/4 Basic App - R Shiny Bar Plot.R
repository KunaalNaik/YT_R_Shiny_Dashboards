library(shiny)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    sales = read.csv("Sales_Sample.csv", header = TRUE,  sep = ",")
    
    #Plot
    barplot(sales$Sales)
  })
}

ui <- basicPage(
  h1("R Shiny Bar Plot"),
  plotOutput("plot")
)

shinyApp(ui = ui, server = server)