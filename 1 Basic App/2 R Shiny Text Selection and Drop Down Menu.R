library(shiny)

server <- function(input,output, session) {}

ui <-   basicPage(
  h1("R Shiny Text Selection and Drop Down Menu"),
  textInput("region","Enter Region"),
  selectInput("productCategory", "Product Category", c("Category 1","Category 2"))
)

shinyApp(ui = ui, server = server)