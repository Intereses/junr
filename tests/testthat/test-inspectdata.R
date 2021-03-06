library(junr)
context("inspect data")

base_url <- "http://api.datosabiertos.presidencia.go.cr/api/v2/datastreams/"
api_key <- "0bd55e858409eefabc629b28b2e7916361ef20ff"

test_dimensions <- get_dimensions(base_url, api_key)

# get_dimensions
test_that("The dimensions are correct", {
    expect_that(as.numeric(test_dimensions$NROW[1])*as.numeric(test_dimensions$NCOL[1]),
                equals(as.numeric(test_dimensions$DIM[1])))
})

test_that("The dimensions are numeric columns", {
    expect_true(is.numeric(test_dimensions$NROW[1]))
    expect_true(is.numeric(test_dimensions$NCOL[1]))
    expect_true(is.numeric(test_dimensions$DIM[1]))
})

test_that("We geta warning when there is no url", {
  expect_warning(get_dimensions(api_key = api_key),
                 "Please add a valid base URL")
})

test_that("We geta warning when there is no api_key", {
  expect_warning(get_dimensions(base_url = base_url),
       "Please add a valid API key for the base URL you are trying to access")
})
