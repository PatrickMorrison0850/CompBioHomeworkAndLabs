#Differential Equation Growth Model
#I is the initial population
#G is the number of generations
#r id the growth rate
#K is the carrying capacity
ExpGrowthFunct <- function(I = 2, G = 2, r = 1, K = 1){
  n <- rep(I,G)
  Gen_time <- seq(1,G)
  for(t in seq(2, Gen_Time)){
    n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K)
  }
  plot(Gen_time, n, xlab = "Generation", ylab = "population")
  print(n)
}