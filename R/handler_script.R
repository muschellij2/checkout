#' @title Stripe Checkout Handler Script
#' @description Wraps JS for the handler script for Stripe
#'
#' @param amount Amount to be charged
#' @param name Name of the organization on the checkout app
#' @param description Description on the checkout app
#' @param button_id JS ID for the button used
#'
#' @return The result is a character of JavaScript
#' @export
handler_script = function(amount,
                          name, description,
                          button_id) {
  res = c(paste0("document.getElementById('", button_id,
                 "').addEventListener('click', function(e) {"),
          "// Open Checkout with further options:",
          "handler.open({",
          paste0("name: '", name, "',"),
          paste0("description: '", description, "',"),
          "zipCode: true,",
          paste0("amount: ", amount),
          "});",
          "e.preventDefault();",
          "});")
  res = paste(res, collapse = "\n")
}