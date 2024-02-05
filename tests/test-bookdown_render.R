
testthat::test_that("Bookdown renders without error.", {
  expect_no_error(
    bookdown::render_book("../")
  )
})