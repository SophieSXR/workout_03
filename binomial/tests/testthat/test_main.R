# load the source code of the functions to be tested
source('~/binomial/R/main.R')

context("Test main functions")

test_that("Bin choose works",{
  expect_equal(bin_choose(n = 5, k = 2),10)
  expect_error(bin_choose(k = 3,n = 2))
  expect_length(bin_choose(5, 1:3),3)
})

test_that("Bin Probability works",{
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_length(bin_probability(success = 0:2, trials = 5, prob = 0.5),3)
  expect_equal(bin_probability(success = 55, trials = 100, prob = 0.45),0.01075277)
})

test_that("Bin Distribution Works",{
  expect_is(bin_distribution(trials=5, prob = 0.5),c("bindis","data.frame"))
  expect_length(bin_distribution(trials=5, prob = 0.5),2)
  expect_error(bin_distribution(trials=-5, prob = 0.5))
})

test_that("Bin cumulative works",{
  expect_is(bin_cumulative(trials=5, prob = 0.5),c("bincum","data.frame"))
  expect_length(bin_cumulative(trials=5, prob = 0.5),3)
  expect_error(bin_cumulative(trials = -5, prob = 0.5))
})



