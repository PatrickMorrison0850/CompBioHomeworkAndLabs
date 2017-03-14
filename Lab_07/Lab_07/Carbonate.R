Carbonate <- funct(pH = 8.1, pCO2 = .00485, Temp = 25, S = .005){
  Sol <- -160.733 + 215.4152*(100/Temp) + 89.892*log(Temp/100) + -1.47759(Temp/100)^2 + S*(.029941 + -.027455(Temp/100) + .0053407(Temp/100)^2)) 
  Sa <- 2.718^Sol
  H <- 10^-pH
  Corbonate_Concentration <- (Sa*.00025*.0000000000469*pCO2)/(H^2)
  print(Carbonate_Concentration)
}