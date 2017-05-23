# checkout

[![Travis-CI Build Status](https://travis-ci.org/muschellij2/checkout.svg?branch=master)](https://travis-ci.org/muschellij2/checkout)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/muschellij2/checkout?branch=master&svg=true)](https://ci.appveyor.com/project/muschellij2/checkout)

The goal of checkout is to have Stripe Checkout for Shiny.

## Installation

You can install checkout from github with:

``` r
# install.packages("devtools")
devtools::install_github("muschellij2/checkout")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
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
```
