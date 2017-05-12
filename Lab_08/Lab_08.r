#Differential Equation Growth Model
#I is the initial population
#G is the number of generations
#r id the growth rate
#K is the carrying capacity
ExpGrowthFunct <- function(I = 10, G = 1000, r = .1, K = 100){
  n <- rep(I,G)
  Gen <- seq(1,G)
  for(t in seq(2,G)){
    n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K)
  }
  plot(Gen, n, xlab = "Generation", ylab = "population")
  print(n)
  Gen_time <- seq(1,G)
  Pop_Over_Time <- data.frame(Gen, n)
  colnames(Pop_Over_Time) <- c("Generation","Abundance")
  return(Pop_Over_Time)
  return(write.csv(Pop_Over_Time, "Pop_Over_Time.csv"))
}
Pop_Over_Time <- ExpGrowthFunct()
write.csv(Pop_Over_Time,"Pop_Over_Time.csv")

