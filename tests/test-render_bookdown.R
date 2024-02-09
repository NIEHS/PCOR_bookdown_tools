
testthat::test_that("Bookdown renders without error.", {
  withr::local_options(
    rlang_interactive = FALSE
  )
  withr::local_package("testthat")
  withr::local_package("bookdown")
  testthat::expect_no_error(
    bookdown::render_book("../")
  )
})
