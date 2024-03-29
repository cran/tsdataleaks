#' Correlation calculation based on rolling window with overlapping observations.
#'
#' @param x time series
#' @param y subsection of the time series to map
#' @param cutoff benchmark value for corr, default 1
#' @importFrom slider slide_dbl
#' @importFrom stats cor
#' @importFrom tibble tibble
#' @return Pearson's correlation coefficient between \code{x} and \code{y}
#' @export
#' @examples
#' x <- rnorm(15)
#' y <- -x[6:10]
#' x <- c(x, y)
#' ts.match(x, y, 1)
#' z <- rnorm(5)
#' ts.match(x, z)
ts.match <- function(x, y, cutoff=1){
  slide.size <- length(y)
  fn <- function(x){stats::cor(x, y)}
  match.index <- abs(round(slider::slide_dbl(x, fn, .before = slide.size - 1L, .complete = TRUE), 4))
  index.cutoff.end <- which(match.index >= cutoff)
  index.cutoff.start <- index.cutoff.end - (slide.size-1L)


  if(length(index.cutoff.end) == 0){
    tibble::tibble(start = NA, end = NA)
  } else {
    tibble::tibble(start = index.cutoff.start, end = index.cutoff.end)
  }
}


