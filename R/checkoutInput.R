#' @title Stripe Checkout Shiny Input
#' @description Form wrapper for Stripe Checkout
#'
#' @param id Shiny id for the output token
#' @param amount Amount to be charged
#' @param name Name of the organization on the checkout app
#' @param description Description on the checkout app
#' @param publickey Stripe API key
#' @param label Label on the Checkout Button
#' @param image Image on the checkout app
#' @param button_id JS ID for the button used
#'
#' @return The result from these functions is a tag object.
#' @export
#' @importFrom shiny tags
checkoutInput = function(id,
                         amount = 100,
                         name = "Stripe.com",
                         description = "",
                         publickey = NULL,
                         label = "Pay with Card",
                         image = paste0("https://stripe.com/img/documentation",
                                        "/checkout/marketplace.png"),
                         button_id = "customButton") {

  tscript = token_script(id = id,
                         publickey = publickey,
                         image = image)

  hscript = handler_script(amount = amount, button_id = button_id,
                           name = name, description = description)

  hclose = c("// Close Checkout on page navigation:",
             "window.addEventListener('popstate', function() {", "handler.close();",
             "});")
  hclose = paste(hclose, collapse = "\n")

  shiny::tags$form(
    shiny::tags$script(src = "https://checkout.stripe.com/checkout.js"),
    shiny::tags$button(id = button_id, label),

    shiny::tags$script(tscript,
                hscript,
                hclose)
    )
}
