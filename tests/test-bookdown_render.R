
testthat::test_that("Bookdown renders without error.", {
  withr::local_options(
    rlang_interactive = FALSE
  )
  expect_no_error(
    bookdown::render_book("../")
  )
})
