# load the source code of the functions to be tested
source('~/binomial/R/private_auxiliary_functions.R')

context("Test auxiliary functions")

test_that("aux_mean works",{
  expect_equal(aux_mean(10,0.3),3)
  expect_length(aux_mean(10,0.3),1)
  expect_equal(aux_mean(100,0.3),30)
})

test_that("aux_variance works",{
  expect_equal(aux_variance(10,0.3),2.1)
  expect_length(aux_variance(10,0.3),1)
  expect_equal(aux_variance(100,0.3),21)
})

test_that("aux_mode works",{
  expect_equal(aux_mode(10,0.3),3)
  expect_length(aux_mode(10,0.3),1)
  expect_equal(aux_mode(100,0.3),30)
})

test_that("aux_skewness works",{
  expect_lt(aux_skewness(10,0.3),0.3)
  expect_length(aux_skewness(10,0.3),1)
  expect_lt(aux_skewness(100,0.3),0.09)
})

test_that("aux_kurtosis works",{
  expect_length(aux_kurtosis(10,0.7),1)
  expect_length(aux_kurtosis(10,0.3),1)
  expect_lt(aux_kurtosis(100,0.3),0)
})
