#Question 1
#The first input is the starting value and the second is the number of iterations
FiboFunct <- function(number = 0, iterations = 10){
  fib <- rep(number, iterations)
  fib[2] <- 1
  #This tells you if you have too few iterations
  if(iterations <= 3){
    return("You need at least three iterations for a Fibonacci sequence")
  }
  #This fills the vecotr with the number of iterations
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
#r id the growth rate
#K is the carrying capacity
ExpGrowthFunct <- function(I = 2000, G = 12, r = .8, K = 10000){
  #This creates a vector for the population size to be stored in
  n <- rep(I,G)
  #This loop puts the values in the vector
  for(t in seq(2,G)){
    n[t] <- n[t-1] + (r * n[t-1] * (K - n[t-1])/K)
  }
  #This generates a plot
  Gen_Time <- seq(2,G)
  plot(Gen_Time, n, xlab = "Generation", ylab = "Population")
  return(n)
}
#Question 3
#This makes the CSV file a variable
AdjacencyMatrix <- read.csv("LargeAdjacencyMatrix.csv")
#This command generates the function that should be used 
#The first variable is the name of the data frame
#The second variable is the number that you're looking for
Matrix_Generator <- function(Matrix = AdjacencyMatrix, Number = 1){
  #This determines the frequency of the number that you're looking for in the function
  a <- length(which(Matrix == Number))
  #This counts the number of columns in the Matrix
  ncol(Matrix) -> N_Col
  #This counts te number of rows in the matrix
  nrow(Matrix) -> N_Row
  #This creates the vector where the position of the columns with the value in question are present
  Column <- rep(0, a)
  #This creates the vector where the position of the rows with the value in question are present
  Row <- rep(0,a)
  #This creates the vector where the value in question is stored
  Value <- rep(Number,a)
  #This puts the vectors together in a data frame
  Adjacency <- data.frame(Column,Row,Value)
  #This creates a counter variable for the loop
  x <- 1
  #This loop runs through all the columns
  for(o in seq(1,N_Col)){
    #This loop runs through all of the rows
    for(u in seq(1,N_Row)){
      #This determines if the value in question is in the rows
      if(Matrix[u,o] == Number){
        #This puts the position of the value in the column section
        Adjacency$Column[x] <- u
        #This puts the position of the value in the row section
        Adjacency$Row[x] <- o
        #This increases the counter variable by one each time the system goes through the loop
        x <- x + 1
      }
    }
  }
  return(Adjacency) 
}
Matrix_Generator()
Matrix_Generator(Number = 0)

