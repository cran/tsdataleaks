## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(tsdataleaks)
library(ggplot2)
library(dplyr)
library(tidyr)
library(viridis)

## ----example, comment=NA------------------------------------------------------
set.seed(2020)
a <- rnorm(15)
d <- rnorm(10)
lst <- list(
  a = a,
  b = c(a[10:15]+rep(8,6), rnorm(10), a[1:5], a[1:5]),
  c = c(rnorm(10), a[1:5]),
  d = d,
  e = d)



## ----comment=NA, message=FALSE, warning=FALSE---------------------------------
# h - I assume test period length is 5 and took that as wind size, h.
f1 <- find_dataleaks(lstx = lst, h=5, cutoff=1) 
f1

## ----comment=NA, message=FALSE, warning=FALSE---------------------------------
viz_dataleaks(f1)

## ----comment=NA, message=FALSE, warning=FALSE, fig.height=5, fig.width=10-----
r1 <- reason_dataleaks(lstx = lst, finddataleaksout = f1, h=5)
r1

