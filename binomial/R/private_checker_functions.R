# private function to test if an input is a valid probability value(0<p<1).
check_prob <- function(prob){
  if (prob<1&prob>0){
    return(TRUE)
  }else{
    stop("p has to be a number between 0 and 1")
  }
}

# private function to test if an input is a valid value for number of trials (non-negative).
check_trials <- function(trials){
  if (trials < 0){
    stop("invalid trials value")
  }else if (as.integer(trials)!=trials){
    stop("invalid trials value")
  }else{
    return(TRUE)
  }
}

# private function to test if an input success is a valid value for number of successes (i.e. 0<=k<=n).
check_success <- function(success,trials){
  if (sum(success >= 0)!=length(success)){
    stop("invalid success value")
  } else if (sum(as.integer(success)==success)!=length(success)){
    stop("invalid success value")
  } else if (sum(success<=trials)!=length(success)){
    stop("success cannot be greater than trials")
  }else{
    return(TRUE)
  }
}

