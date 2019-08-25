server <- function(input, output, session) {}

ui <- fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      "my sidebar"
    ),
    
    mainPanel(
      "my mainpanel"
    )
  )
)

shinyApp(ui = ui, server = server)