# Define the UI
ui <- bootstrapPage(
  checkoutInput(id = "shinytoken", publickey = "pk_test_6pRNASCoBOKtIshFeQd4XMUh"),
  # an element for unformatted text
  verbatimTextOutput("results")
)


# Define the server code
server <- function(input, output) {
  output$results = renderPrint({
    input$shinytoken
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)