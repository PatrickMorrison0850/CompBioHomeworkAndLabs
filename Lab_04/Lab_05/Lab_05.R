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
which((Vect$x == is.na() | Vect$x == 0), arr.ind = TRUE)
#Q2c
#This command creates a list of the positions of all the Vextor$x values above 50
which(Vect$x >= 50) -> Vect50
#This command creates a list of the positions of all the Vextor$x values above 100
which(Vect$x >= 100) -> Vect100
#This command creates an empty vector with a length equal to all the values between 50 and 100
rep(0,(length(Vect50)-length(Vect100))) -> Vect_50_100
1 -> D
#This loop puts all the values between 50 and 100 in the new vector
#for(v in Vect50){
 #if(Vect$x[v] <= 100){
  #  Vect$x[v] -> Vect_50_100[D]
   # D + 1 -> D
#  }
#}
which(Vect$x <= 100) -> Vect_50_100
#Q3
#This command puts the CSV file into a data frame
read.csv("CO2_data_cut_paste.csv") -> Emissions
#Q3a
#This command tells us the first year when gas emissions were greater than zero
which(Emissions$Gas > 0)[1] -> G
print(Emissions$Year[G])
#Q3b
#This command creates a list of the positions of all the Emissions$Total values above 200
which(Emissions$Total >= 200) -> Totally_200
#This command creates a list of the positions of all the Emissions$Total values above 300
which(Emissions$Total >= 300) -> Totall_300
#This command makes an empty vector with the length equal to all the positions of Emissions$Total between 200 and 300
rep(0,(length(Totally_200)-length(Totall_300))) -> Total_E
1 -> C
#This loop fills the vector with the years it was between 200 and 300
which(Emissions$Total <= 300) -> Total_E
#This command creates a new empty vector for what the CO2 emissions were in those years
rep(0, length(Total_E)) -> Years_E
1 -> N
#This loop fills the vector with the appropriate values
for(e in Total_E){
  Emissions$Total[e] -> Years_E[N]
  N + 1 -> N
}
print(Years_E)
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
