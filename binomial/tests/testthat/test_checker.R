# load the source code of the functions to be tested
source('~/binomial/R/private_checker_functions.R')

context("Test checker functions")

test_that("check_prob works",{
  expect_error(check_prob(1.1))
  expect_error(check_prob(-0.01))
  expect_true(check_prob(0.33))
  expect_length(check_prob(0.33),1)
})

test_that("check_trials works",{
  expect_error(check_trials(3.3))
  expect_error(check_trials(-3))
  expect_true(check_trials(5))
})

test_that("check_success works",{
  expect_error(check_success(-3,5))
  expect_error(check_success(5,3))
  expect_true(check_success(5,10))
})
