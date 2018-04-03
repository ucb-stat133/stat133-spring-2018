#' @title Toss
#' @description Simulates tossing a coin 
#' @param x a coin object (i.e. vector)
#' @param times number of tosses
#' @param prob optional probability vector
#' @return vector of tosses
toss <- function(x, times = 1, prob = NULL) {
  sample(x, size = times, replace = TRUE, prob = prob)
}
