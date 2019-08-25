server <- function(input,output, session) {
}

ui <-   basicPage(
  h1("textInput and checkboxInput"),
  textInput("mystring", "Write here"),
  checkboxInput("mycheckbox", "Factor Y")
)

shinyApp(ui = ui, server = server)