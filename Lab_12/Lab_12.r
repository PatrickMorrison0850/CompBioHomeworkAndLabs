#This function generates a vector containing the population data over time with a stochastic element
#The lambda value is the expected population of each generation which is used to give a stochastically determined population for the next generation
Stoch_Pop_Growth <- function(n_1=10, r=.1, k=100, gens=100 ){
  n <- rep(n_1,gens)
  for(i in seq(2,length(n))){
    expect_pop <- n[i-1] + r * n[i-1] * (k - n[i-1])/k
    n[i] <- rpois(n = 1, lambda = expect_pop)
  }
  return(n)
}
#This command creates a plot of the data with four repetitions
par(mfrow = c(2,2)) 
for ( i in 1:4 ) {
  gens <- 100
  n <- Stoch_Pop_Growth(gens = gens)
  plot(1:gens, n, type = "l", xlab = "generation", ylab = "population", ylim = c(0,160))
}
#These lines ascribe values to the variables 
n_1 <- 10  
r <- .1
k <- 100 
#This calculates the lambda value for the second generation
pop_2_exp <- n_1 + r * n_1 * (k - n_1)/k
#This calculates the probablity given the lambda value ascribed (and prints it)
n_2_prob <- dpois(x = n_1, lambda = pop_2_exp)
print(n_2_prob)
#This calculates the probability of the population going under 10 given the previously calulated lambda value
prob_u_10 <- ppois(q = (n_1 - 1), lambda = pop_2_exp)
print(prob_u_10)
#This calculates the probability of the population going above 10 given the previously calulated lambda value
prob_a_10 <- 1 - ppois(q = n_1, lambda = pop_2_exp)
P_a_10_alt <- ppois(q = n_1, lambda = pop_2_exp, lower.tail = F)
Summation <- prob_u_10 + n_2_prob + prob_a_10
if (Summation != 1) {  
  cat(paste("the sum is not one", Summation, "\n"))
} else {
  cat("the sum is one")
}
#This calculates the probability of the population going between 15 and 25 given the previously calulated lambda value
Prob_15_to_25 <- sum(dpois(x = 15:25, lambda = pop_2_exp))
print(Prob_15_to_25)
#this calculates the probability of extinction given the previous value
prob_ext <- dpois(x = 0, lambda = pop_2_exp)
print(prob_ext) 
#4. Verbally, using just your intuition, what is your expectation about the long run average (expected value) of n in this model?
#I predict that the population after increasing will go up and down with an average slightly below the carrying capacity
#5. This creates a matrix where each iteration of the original function is a repition
Rep_stoch_function <- function(r = 0.1, k = 100, n_1 = 10, gens = 100, nreps = 1000) {
  Repititions <- matrix(data = NA, nrow = nreps, ncol = gens)
  for ( i in 1:nreps ) {
    Repitions[i,] <- Stoch_Pop_Growth(r = r, k = k, n_1 = n_1, gens = gens)
  }
  return(Repititions)
  Reps <- Repititions
}
nreps = 1000)
Repititions <- matrix(data = NA, nrow = nreps, ncol = gens)
for ( i in 1:nreps ) {
  Repititions[i,] <- Stoch_Pop_Growth(r = r, k = k, n_1 = n_1, gens = gens)
}
#This assigns values to the variables
r <- 0.1 
k <- 100 
n_1 <- 10 
gens <- 100 
nreps <- 1000 
#This command finds the mean population sizes of all the repeats
Mean_Pop <- colMeans(Repititions)
print(Mean_Pop)
#This command plotes the results
plot(1:gens, Mean_Pop, xlab = "generation number", ylab = "average abundance", type = "l", col = "blue", ylim = c(0, 1.5*k))
#this gives a dashed line where the carrying capacity
abline(h = k, lty = 2)
#This command sums all of the reptitions that went extinct after generation 25 
#The 25th column is the 25th generation and 0 denotes there is no individuals
Prob_ext_25Gens <- sum(Repitions[,25] == 0) / nreps
print(Prob_ext_25Gens)
#This command calculates the number of reps that after all generations, have a population equal to or greater than the carrying capacity
Prob_More_than_half_K <- sum(Repitions[,gens] >= (k/2)) / nreps
print(Prob_More_than_half_K)
#This creates a vector of the 2.5-97.5% confidence intervals
probabilities <- c(0.025, 0.975)
# This creates a vector to store the quantities where the # of rows is the confidence intervals and the # of columns is the # of generations
quantiles <- matrix(nrow = length(probabilities), ncol = gens)
# This loop puts the values in the matrix
for (i in 1:gens ) {
  quantiles[,i] <- quantile(x = Repititions[,i], probabilities = probabilities)
}
plot(1:gens, Mean_Pop, xlab = "generation number", ylab = "average abundance", type = "l", col = "blue", ylim = c(0, 1.5*k))
lines(1:gens, quantile[1,], lty = 3, col = "green")
lines(1:gens, quantile[2,], lty = 3, col = "red")