library(shiny)

server <- function(input, output, session) {

  output$selected_var <- renderText({
    paste("You have selected", input$region, "and", input$prodCat)
  })
  
}

#Add 2 Drop Down Selection for Region and Product Category
ui <-   basicPage(
  h1("R Shiny selectInput & display text from selectInput"),

  selectInput("region",
              label = "Region",
              choices = c("Region 1", "Region 2"),
              selected = "Region 1"),
  
  selectInput("prodCat",
              label = "Product Category",
              choices = c("Category 1", "Category 2"),
              selected = "Category 1"), 
  
  textOutput("selected_var")
  
)

shinyApp(ui = ui, server = server)