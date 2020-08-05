server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    sales = read.csv("Sales_Sample.csv", header = TRUE,  sep = ",")
    
    #Summarize Data and then Plot
    df <- sales %>% group_by(QTR) %>% summarise(Sales = sum(Sales))
    
    #Plot 
    g <- ggplot(df, aes( y = Sales, x = QTR))
    g+geom_bar(stat = "sum")
  })
}

ui <- basicPage(
  h1("R Shiny Bar Plot using ggplot"),
  plotOutput("plot")
)

shinyApp(ui = ui, server = server)