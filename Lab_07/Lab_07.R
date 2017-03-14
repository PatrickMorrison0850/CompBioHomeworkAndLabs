#Question 1
FiboFunct <- function(number = 0, iterations = 10){
  fib <- rep(number, iterations)
  fib[2] <- 1
  if(iterations <= 3){
    return("Dumbass, you need at least three iterations for a Fibonacci sequence")
  }
  else{
    for(f in seq(3,iterations)){
      fib[f] <- fib[f-1] + fib[f-2]
    }
    return(fib)
  }  
}
FiboFunct(1,2)
#Question 2
ExpGrowthFunct <- function(I = 2, G = 2, r = 1, K = 1){
  n <- rep(I,G)
  for(t in (2,Gen_Time)){
    n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K)
  }
  return(n)
}
#Question 3













