#' Ages of members of Congress
#'
#' Ages of individual members of Congress, taken from the fivethirtyeight
#' package. Ages are provided as-of the start of each two year Congressional
#' term.
#'
#' @format A tibble with 18,635 observations and 7 variables:
#' \describe{
#'   \item{year}{Starting year of two-year Congressional term}
#'   \item{part}{Political party of the member}
#'   \item{firstname}{First name of member}
#'   \item{lastname}{Last name of member}
#'   \item{age}{numeric variable for age at start of term}
#'   \item{incumbent}{flogical variable indicating whether or not member was in previous Congress}
#'   \item{chamber}{house or senate}
#' }
#' @source \url{https://CRAN.R-project.org/package=fivethirtyeight}
#'
"congress"
