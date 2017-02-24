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
  i*3 -> n[i]
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
Fibonacci[3:18] -> fibonacci
for(f in seq(3,18)){
  Fibonacci[f-2] + Fibonacci[f-1] -> fibonacci[f-2]
  fibonacci[f-2] -> Fibonacci[f]
}
print(Fibonacci)
#Repeat of the population decay experiment but putting the populations in each year in elements of a vector
2000 -> InitPopx
.95 -> Decayx
rep(1,7) -> popvector
InitPopx -> FirstPopx
for (p in seq(1,7)){
  (FirstPopx * Decayx) -> NewPopx
  NewPopx -> FirstPopx
  NewPopx -> popvector[p]
}
print(popvector)
#reading a CSV file
#This command puts the total percent change in a new vector
read.csv("CO2_data_cut_paste.csv") -> CarbonDioxide
#These commands puts the percent change from year to year of the Total
DeltaTotal <- rep(0,(length(CarbonDioxide$Total)-1))
for(t in seq(2,length(CarbonDioxide$Total))){
  ((CarbonDioxide$Total[t] - CarbonDioxide$Total[t-1])/CarbonDioxide$Total[t-1]) -> DeltaTotal[t-1]
}
#These commands puts the percent change from year to year of the gas
DeltaGas <- rep(0,(length(CarbonDioxide$Gas)-1))
for(g in seq(2,length(CarbonDioxide$Gas))){
  ((CarbonDioxide$Gas[g] - CarbonDioxide$Gas[g-1])/CarbonDioxide$Gas[g-1]) -> DeltaGas[g-1]
}
#These commands puts the percent change from year to year of the liquids
DeltaLiquids <- rep(0,(length(CarbonDioxide$Liquids)-1))
for(l in seq(2,length(CarbonDioxide$Liquids))){
  ((CarbonDioxide$Liquids[l] - CarbonDioxide$Liquids[l-1])/CarbonDioxide$Liquids[l-1]) -> DeltaLiquids[l-1]
}
#These commands puts the percent change from year to year of the solids
DeltaSolids <- rep(0,(length(CarbonDioxide$Solids)-1))
for(s in seq(2,length(CarbonDioxide$Solids))){
  ((CarbonDioxide$Solids[s] - CarbonDioxide$Solids[s-1])/CarbonDioxide$Solids[s-1]) -> DeltaSolids[s-1]
}
#These commands puts the percent change from year to year of the cement
DeltaCement <- rep(0,(length(CarbonDioxide$CementProduction)-1))
for(c in seq(2,length(CarbonDioxide$CementProduction))){
  ((CarbonDioxide$CementProduction[c] - CarbonDioxide$CementProduction[c-1])/CarbonDioxide$CementProduction[c-1]) -> DeltaCement[c-1]
}
#These commands puts the percent change from year to year of the flares
DeltaFlare <- rep(0,(length(CarbonDioxide$GasFlaring)-1))
for(f in seq(2,length(CarbonDioxide$GasFlaring))){
  ((CarbonDioxide$GasFlaring[f] - CarbonDioxide$GasFlaring[f-1])/CarbonDioxide$GasFlaring[f-1]) -> DeltaFlare[f-1]
}
#These commands puts the vectors created into a matrix 
matrix(c(CarbonDioxide$Year[2:263], DeltaTotal, DeltaCement, DeltaGas, DeltaSolids, DeltaLiquids, DeltaFlare), nrow=262) -> DeltaCO2
#These commands gives names to the rows 
names(DeltaCO2[1]) -> Year
names(DeltaCO2[2]) -> Delta_Total
names(DeltaCO2[3]) -> Delta_Cement
names(DeltaCO2[4]) -> Delta_Gas
names(DeltaCO2[5]) -> Delta_Solids
names(DeltaCO2[6]) -> Delta_Liquids
names(DeltaCO2[7]) -> Delta_Flare
#This writes the matrix into a csv file
write.csv(DeltaCO2, file="Percent_Change_CO2.csv")
