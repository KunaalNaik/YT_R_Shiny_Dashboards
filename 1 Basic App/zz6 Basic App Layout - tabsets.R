server <- function(input, output, session) {}

ui <- fluidPage(
  
  titlePanel("using Tabsets"), # our title
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput(inputId = "s1",
                  label = "My Slider",
                  value = 1, min = 1, max = 20)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Tab1", "First Tab"),
        tabPanel("Tab2", "Second Tab"),
        tabPanel("Tab3", "Third Tab")
      )
    )
  )
)

shinyApp(ui = ui, server = server)