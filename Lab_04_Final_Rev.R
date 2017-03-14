#Printing hi as many times as I want 
for (i in seq(1,10) ) {
  print("hi")
}
#How much money Tim has in his piggy bank
#It works
#How much tim has in his piggy bank at the first week
10 -> InitialAmount
#His weekly allowence
5 -> WeeklyAllowence
#The price of his gum 
1.34 -> GumPrice
#The loop
InitialAmount -> NewAmount
for (n in seq(1,8)) {
  (NewAmount + (WeeklyAllowence - (2 * GumPrice))) -> NewAmount
  print(NewAmount)
} 
#Population Decay over time via an exponential function
#It works
#The starting population
2000 -> InitPop
#The size of the population relative to the previous year
.95 -> Decay
#The loop
for (y in seq(1,7)){
  (InitPop * Decay) -> InitPop  
  print(InitPop)
}
#Logistic Growth
#The starting population
2500 -> Starting
#The growth rate
.8 -> r
#The carrying capacity
10000 -> k
rep(Starting, 12) -> n
for (t in seq(2,12)){
  n[t] <- n[t - 1] + (r * n[t-1] * (k - n[t-1])/k)
}
print(n[12])
#The population at year 12 is 9999.85 and rounded up it hit 10000
#Part II
#producing a sequence of 18 zeros
rep(0, 18) -> zeros
#priducing a sequence where the value of an element is equal to its position times 5
for (i in seq(1,18)){
  i*3 -> zeros[i]
}
print(zeros)
#Producing a sequence of numbers where each element is equal to the value of the previous element mutliplied by two plus one
rep(0, 18) -> V
V[1] <- 1
for (i in 2:length(V)){
    (1 + (V[i-1] * 2)) -> V[i]
}
print(V)
#Producing a sequence of Fibanacci numbers
rep(1, 18) -> Fibonacci
0 -> Fibonacci[1]
for(f in seq(3,18)){
  Fibonacci[f-2] + Fibonacci[f-1] -> Fibonacci[f]
}
print(Fibonacci)
#Repeat of the population decay experiment but putting the populations in each year in elements of a vector
2500 -> Start
#The growth rate
.8 -> R
#The carrying capacity
10000 -> Kary
rep(Start, 12) -> N
Population <- rep(Start,12)
for (t in seq(2,12)){
  N[t] <- N[t - 1] + (R * N[t-1] * (Kary - N[t-1])/Kary)
  Population[t] <- N[t]
}
plot(Population)
#reading a CSV file
#This command puts the total percent change in a new vector
read.csv("CO2_data_cut_paste.csv") -> CarbonDioxide
#These commands create new vectors for the % change data to be put into
Y <- CarbonDioxide$Year[2:263]
t <- rep(1,262)
C <- rep(1,262)
S <- rep(1,262)
L <- rep(1,262)
f <- rep(1,262)
#This command puts the empty vectors in a data frame for the % data to go into
DeltaCO2 <- data.frame(Y,t,C,G,S,L,f)
#This command puts the % change data in the new vector via nested loops
for(c in seq(2,8)){
  for(d in seq(2,263)){
    ((CarbonDioxide[d,c] - CarbonDioxide[d-1,c])/CarbonDioxide[d-1,c]) -> DeltaCO2[d-1,c]
  }
}
#These commands gives names to the rows 
colnames(DeltaCO2) <- colnames(CarbonDioxide)
write.csv(DeltaCO2, file="Percent_Change_CO2.csv")
