#Printing hi as many times as I want 
for (i in seq(1,10) ) {
  print("hi")
}
#How much money Tim has in his piggy bank
#It works
#How much tim has in his piggy bank at the first week
10 -> InitialAmmount
#His weekly allowence
5 -> WeeklyAllowence
#The price of his gum 
1.34 -> GumPrice
#The loop
InitialAmmount -> NewAmmount
for (n in seq(1,8)) {
  (NewAmmount + (WeeklyAllowence - (2 * GumPrice))) -> FirstAmmount
  FirstAmmount -> NewAmmount
  print(NewAmmount)
} 
#Population Decay over time via an exponential function
#It works
#The starting population
2000 -> InitPop
#The size of the population relative to the previous year
.95 -> Decay
InitPop -> FirstPop
#The loop
for (y in seq(1,7)){
  (FirstPop * Decay) -> NewPop  
  NewPop -> FirstPop
}
#Logistic Growth
#The starting population
2500 -> Starting
#The growth rate
.8 -> r
#The carrying capacity
10000 -> k
rep(Starting, 98) -> n
for (t in seq(2,100)){
  n[t] <- n[t - 1] + (r * n[t-1] * (k - n[t-1])/k)
}
print(n[12])
#The population at year 12 is 9999.85 and rounded up it hit 10000
#Part II
#producing a sequence of 18 zeros
rep(0, 18) -> zeros
print(zeros)
#priducing a sequence where the value of an element is equal to its position times 5
for (i in seq(1,18)){
  i*3 -> zeros[i]
}
print(n)
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
2000 -> InitPopx
.95 -> Decayx
rep(1,7) -> popvector
InitPopx -> popvector[1]
for (p in seq(2,7)){
  popvector[p] <- popvector[p-1]*Decayx
}
print(popvector)
#reading a CSV file
#This command puts the total percent change in a new vector
read.csv("CO2_data_cut_paste.csv") -> CarbonDioxide
#These commands puts the percent change from year to year of the Total
CarbonDioxide[1,8]
Len <- length(CarbonDioxide$Year)
DeltaYear <- CarbonDioxide$Year[2:Len]
DeltaTotal <- rep(0,(Len-1))
DeltaGas <- rep(0,(Len-1))
DeltaLiquids <- rep(0,(Len-1))
DeltaSolids <- rep(0,(Len-1))
DeltaCement <- rep(0,(Len-1))
DeltaFlare <- rep(0,(Len-1))
DeltaCO2 <- data.frame(DeltaYear,DeltaTotal,DeltaGas,DeltaLiquids,DeltaSolids,DeltaCement,DeltaFlare)
for(c in seq(2,7)){
  for(o in seq(2,Len)){
  DeltaCO2[o-1,c] <- (CarbonDioxide[o,c] - CarbonDioxide[o-1,c])
  }
}
#Because deividing by 0 gives NaNs, I used the total change instead of percent
#These commands gives names to the rows 
names(DeltaCO2[1]) -> "Year"
names(DeltaCO2[2]) -> "Change in Total"
names(DeltaCO2[3]) -> "Change in Gas"
names(DeltaCO2[4]) -> "Change in Liquids"
names(DeltaCO2[5]) -> "Change in Solids"
names(DeltaCO2[6]) -> "Change in Cement"
names(DeltaCO2[7]) -> "Change in Flare"
write.csv(DeltaCO2,"DeltaCO2.csv")
