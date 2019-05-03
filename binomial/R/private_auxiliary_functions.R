# private function that computes the mean of a binomial distribution
aux_mean <- function(trials, prob){
  return(trials*prob)
}

# private function that computes the variance of a binomial distribution
aux_variance <- function(trials, prob){
  return(trials*prob*(1-prob))
}

# private function that computes the mode of a binomial distribution
aux_mode <- function(trials, prob){
  m <- trials*prob+prob
  if (is.integer(m)==TRUE){
    return(c(m,m-1))
  }else{
    return(as.integer(m))
  }
}


# private function that computes the skewness of a binomial distribution
aux_skewness <- function(trials, prob){
  return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}


# private function that computes the kurtosis of a binomial distribution
aux_kurtosis <- function(trials, prob){
  return((1-6*prob*(1-prob))/(trials*prob*(1-prob)))
}
