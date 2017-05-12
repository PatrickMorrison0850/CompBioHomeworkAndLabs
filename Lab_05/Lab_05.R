#Part I
#Q1a
8 -> x
if(x >= 5){
  print("X is greater than five")
}else{
  (print("x is not greater than 5"))
}
#Q2a
#This reads the CSV file
read.csv("Vector1.csv") -> Vect
#This replaces the values less than ero with NA
for(v in seq(1,length(Vect$x))){
  if(Vect$x[v] < 0){
    Vect$x[v] <- NA
  }
}
#Q2b
#This commands replaces all of the NAs with 0s
Vect$x[is.na(Vect$x)] <- 0
#Q2c
#This loop creates two vectors, one with the positions and the other with the values
#between 50 an 100
Position_Vector <- 0
Value_Vector <- 0
S <- 1
for(k in seq(1,length(Vect$x))){
  if(Vect$x[k] > 50){
    if(Vect$x[k] < 100){
      Position_Vector[S] <- k
      Value_Vector[S] <- Vect$x[k]
      S <- S+1
    }
  }
}
#Q3
#This command puts the CSV file into a data frame
read.csv("CO2_data_cut_paste.csv") -> Emissions
#Q3a
#This command tells us the first year when gas emissions were greater than zero
which(Emissions$Gas > 0)[1] -> G
print(Emissions$Year[G])
#Q3b
#This command creates a list of the positions of all the Emissions$Total values above 200
Years_200_300 <- 0
Total_200_300 <- 0
H <- 1
for(w in seq(1,length(Emissions$Total))){
  if(Emissions$Total[w] > 200){
    if(Emissions$Total[w] < 300){
      Years_200_300[H] <- Emissions$Year[w]
      Total_200_300[H] <- Emissions$Total[w]
      H <- H+1
    }
  }
}
print(Years_200_300)
#Part II
#This command creates a sequence of all the generations 
seq(1,1000) -> Total_Generations
#The next two lines create vectors for the predator and prey populations
rep(100, 1000) -> n
rep(10, 1000) -> p
#The next line denote the attack rate (a), the prey growth rate (r), the predator mortality rate (m) and the predator prey conversion constant (k)
#This loop fills the vecotrs with their appropriate values
for(o in seq(2,1000)){
  n[o-1] + (.2 * n[o-1]) - (.01 * n[o-1] * p[o-1]) -> n[o]
  p[o-1] + (.1 * .01 * n[o-1] * p[o-1]) - (.05 * p[o-1]) -> p[o]
}
#This line creates a new data frame to read with the which command
L_V_frame <- data.frame(n,p)
#This line records the first value where n is less than one (the herbivore went extinct)
which(L_V_frame$n <= 0)[1] -> Extinction
#These commands make new vectore with a duration equal to the duration that the herbivore survived before extinction
N <- rep(0,Extinction)
P <- rep(0,Extinction)
#This command fills the vector with the appropriate values
for(o in seq(2,1000)){
  if(n[o-1] == 0){
    break
  }else{
  n[o-1] + (.2 * n[o-1]) - (.01 * n[o-1] * p[o-1]) -> n[o]
  p[o-1] + (.1 * .01 * n[o-1] * p[o-1]) - (.05 * p[o-1]) -> p[o]
  }
}
#This command creates a data frame of the predator and prey populations before extinction
Lokta_Volterra <- data.frame(N,P)
plot(N, xlab = "Generation Time", ylab = "Popultion", col = "Green", main = "Predator vs Prey Population Size")
lines(P, col = "red")
#This command turns the data frame into a CSV file
write.csv(Lokta_Volterra, "Lokta_Volterra.csv")
