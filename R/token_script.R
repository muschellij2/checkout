#' @title Stripe Checkout Token Script
#' @description Wraps JS for the token script for Stripe
#'
#' @param id Shiny id for the output token
#' @param publickey Stripe API key
#' @param image Image on the checkout app
#'
#' @return The result is a character of JavaScript
#' @export
token_script = function(id, publickey, image) {
  res = c("var handler = StripeCheckout.configure({",
          paste0("key: '", publickey, "',"),
          paste0("image: '", image, "',"),
          "locale: 'auto',",
          "token: function(token) {",
          "//console.log('token is');",
          "//console.log(token.id);",
          paste0("Shiny.onInputChange('", id, "', token);"),
          "}",
          "});")
  res = paste(res, collapse = "\n")

}
