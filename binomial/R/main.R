
#' @title Bin Choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return the number of combinations of n choose k
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5,0)
#' bin_choose(5, 1:3)
bin_choose <- function(n, k){
  if (sum(k > n)!=0){
    stop("k cannot be greater than n")
  }
  return(factorial(n)/(factorial(k)*factorial(n-k)))
}




#' @title Bin Probability
#' @description calculates the probability in which successes can occur in trials
#' @param trials number of trials
#' @param success number of successes
#' @param prob probability of success
#' @return the probability
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success,trials)
  q<-1-prob
  binprob<- bin_choose(k = success, n = trials)*(prob^success)*(q^(trials-success))
  return(binprob)
}



#' @title Bin Distribution
#' @description calculates the probability of binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return  a data frame with the binomial distribution
#' @export
#' @examples
#' bin_distribution(trials=5, prob = 0.5)
#'
bin_distribution <- function(trials, prob){
  success<-c(0:trials)
  probability<-bin_probability(success, trials, prob)
  df<-data.frame(success, probability)
  class(df)<-c("bindis","data.frame")
  return(df)
}

#' @export
#' @example
#' dis1 <- bin_distribution(trials = 5, prob = 0.5)
#' plot(dis1)
plot.bindis <- function(df,...){
  barplot(height = df[,2], xlab = "Successes", ylab = "Probability")
}




#' @title Binomial Cumulative
#' @description calculates the cumulative probability of a binomial distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return  a data frame with the cumulative probability of binomial distribution
#' @export
#' @examples
#' bin_cumulative(trials=5, prob = 0.5)
#'
bin_cumulative <- function(trials, prob){
  success<-c(0:trials)
  probability<-bin_probability(success, trials, prob)
  cumulative <- vector("numeric", trials)
  for (i in success){
    cumulative[i+1] <- sum(bin_probability(c(0:i), trials, prob) )
  }
  df<-data.frame(success, probability, cumulative)
  class(df)<-c("bincum","data.frame")
  return(df)
}

#' @export
#' @example
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis2)
plot.bincum <- function(df,...){
  plot(x = df[,1], y = df[,3], type = "o", xlab = "successes", ylab = "probability")
}





#' @title Binomial Variable
#' @description gives the binomial variables
#' @param trials number of trials
#' @param prob probability of success
#' @return a list of binomial variable
#' @export
#' @examples
#' bin_variable(trials = 10, p = 0.3)
#'
bin_variable<- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  object <- list(trials, prob)
  names(object) <- c("trials","prob")
  class(object) <- "binvar"
  return(object)
}

#' @export
#' @example
#' bin1<-bin_variable(trials = 10, p = 0.3)
#' bin1
print.binvar <- function(x,...){
  cat('"Binomial variable"\n\n')
  cat('Parameters\n')
  cat("- number of trials: ",x$trials,"\n")
  cat("- prob of success: ",x$prob)
}

#' @export
#' @example
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' binsum1 <- summary(bin1)
#' binsum1
summary.binvar <- function(x,...){
  mean<-aux_mean(trials = x$trials, prob = x$prob)
  var<-aux_variance(trials = x$trials, prob = x$prob)
  mode<-aux_mode(trials = x$trials, prob = x$prob)
  skewness<-aux_skewness(trials = x$trials, prob = x$prob)
  kurtosis <- aux_kurtosis(trials = x$trials, prob = x$prob)
  object<-list(x$trials, x$prob, mean, var, mode, skewness, kurtosis)
  names(object) <- c("trials","prob","mean","variance","mode","skewness","kurtosis")
  class(object) <- "summary.binvar"
  return(object)
}



#' @export
#' @example
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' binsum1 <- summary(bin1)
#' binsum1
print.summary.binvar <- function(x,...){
  cat('"Summary Binomial"\n\n')
  cat('Parameters\n')
  cat("- number of trials: ",x$trials,"\n")
  cat("- prob of success: ",x$prob,"\n\n")
  cat('Measures\n')
  cat("- mean: ",x$mean,"\n")
  cat("- variance: ",x$variance,"\n")
  cat("- mode: ",x$mode,"\n")
  cat("- skewness: ",x$skewness,"\n")
  cat("- kurtosis: ",x$kurtosis,"\n")
}





#' @title Binomial Mean
#' @description calculates mean
#' @param trials number of trials
#' @param prob probability of success
#' @return the mean of a binomial distribution
#' @export
#' @examples
#' bin_mean(10,0.3)
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials,prob))
}

#' @title Binomial Variance
#' @description calculates variance
#' @param trials number of trials
#' @param prob probability of success
#' @return the variance of a binomial distribution
#' @export
#' @examples
#' bin_variance(10,0.3)
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials,prob))
}


#' @title Binomial Mode
#' @description calculates mode
#' @param trials number of trials
#' @param prob probability of success
#' @return the mode of a binomial distribution
#' @export
#' @examples
#' bin_mode(10,0.3)
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials,prob))
}


#' @title Binomial Skewness
#' @description calculates skewness
#' @param trials number of trials
#' @param prob probability of success
#' @return the skewness of a binomial distribution
#' @export
#' @examples
#' bin_skewness(10,0.3)
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials,prob))
}


#' @title Binomial Kurtosis
#' @description calculates kurtosis
#' @param trials number of trials
#' @param prob probability of success
#' @return the kurtosis of a binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10,0.3)
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials,prob))
}

