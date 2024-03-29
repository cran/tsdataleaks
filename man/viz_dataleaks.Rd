% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/viz_dataleaks.R
\name{viz_dataleaks}
\alias{viz_dataleaks}
\title{Correlation calculation based on rolling window with overlapping observations.}
\usage{
viz_dataleaks(finddataleaksout)
}
\arguments{
\item{finddataleaksout}{list, the output generated from find_dataleaks function}
}
\value{
matrix visualizing the output
}
\description{
Correlation calculation based on rolling window with overlapping observations.
}
\examples{
a = rnorm(15)
lst <- list(
 a = a,
 b = c(a[10:15]+rep(8,6), rnorm(10), a[1:5], a[1:5]),
 c = c(rnorm(10), a[1:5]),
 d = rnorm(10)
)
f1 <- find_dataleaks(lst, h=5)
viz_dataleaks(f1)

a = rnorm(15)
lst <- list(
 x= a,
 y= c(rnorm(10), a[1:5])
)

f2 <- find_dataleaks(lst, h=5)
viz_dataleaks(f2)

# List without naming elements
lst <- list(
 a,
 c(rnorm(10), a[1:5], a[1:5]),
 rnorm(10)
)
f3 <- find_dataleaks(lst, h=5)
viz_dataleaks(f3)
}
