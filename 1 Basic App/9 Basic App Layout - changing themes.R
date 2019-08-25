server <- function(input, output, session) {}

library(shinythemes) # adding the shinythemese package

ui <- fluidPage(themeSelector(), # displaying the different themes, replace this line when publishing with theme = shinytheme("darkly")
                
                titlePanel(strong("This is the STRONG tag on the Title")), # using strong as a direct tag
                
                sidebarLayout(
                  
                  sidebarPanel(
                    withTags(
                      div(
                        b("bold text: here you see a line break, a horizontal line and some code"),
                        br(),
                        hr(),
                        code("plot(lynx)")
                      ))),
                  
                  mainPanel(
                    tabsetPanel(
                      tabPanel("Weblinks with direct tag a", a(href="www.r-tutorials.com", "r-tutorials")),
                      tabPanel(tags$b("Using b for bold text"), tags$b("a bold text")),
                      tabPanel("Citations with the blockquote tag", tags$blockquote("R is Great", cite = "R Programmer"))
                    )
                  )
                ))

shinyApp(ui = ui, server = server)