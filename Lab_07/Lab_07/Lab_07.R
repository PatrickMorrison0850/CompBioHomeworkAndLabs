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
#I is the initial population
#G is the number of generations
#r is the growth rate
#K is the carrying capacity
ExpGrowthFunct <- function(I = 2500, G = 12, r = .8, K = 10000){
  n <- rep(I,G)
  for(t in seq(2,G)){
    n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
  }
  plot(n)
}
ExpGrowthFunct()
#Question 3













