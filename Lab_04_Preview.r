for (i in seq(1,10) ) {
  print("hi")
}
#How much money Tim has in his piggy bank
10 -> InitialAmmount
5 -> WeeklyAllowence
1.34 -> GumPrice
InitialAmmount -> NewAmmount
for (n in seq(1,8)) {
  (NewAmmount + (WeeklyAllowence - (2 * GumPrice))) -> FirstAmmount
    FirstAmmount -> NewAmmount
    print(NewAmmount)
} 
#Population Decay
2000 -> InitPop
.95 -> Decay
InitPop -> FirstPop
for (y in seq(1,7)){
  (FirstPop * Decay) -> NewPop  
    NewPop -> FirstPop
    print(FirstPop)
}
#Logistic Growth
2500 -> Starting
.8 -> r
10000 -> k
rep(Starting, 98) -> n
for (t in seq(2,100)){
  n[t] <- n[t - 1] + (r * n[t-1] * (k - n[t-1])/k)
  print(n[12])
} 
#The population at year 12 is 9999.85 and rounded up it hit 10000
#Part II
#1A
rep(0, 18) -> zeros
print(zeros)
#1B
for (i in seq(1,18)){
  i*3 -> n
  print(n)
}
rep(0, 18) -> V
V[1] <- 1
for (i in 2:length(V)){
  Num <- (1 + (V[i-1]*2))
  V <- v
  print(Num)
}