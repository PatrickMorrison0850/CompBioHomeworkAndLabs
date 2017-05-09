#This reads the CSV file and puts it into a data frame
Cusack <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")
#This puts the dates and times into a format that R can easily read
Date <- as.POSIXct(Cusack$DateTime, format = "%d/%m/%y %H:%M")
Dates <- as.POSIXct(Cusack$DateTime, format = "%d/%m/%Y %H:%M")
Dates_Time <- rep(0,length(Date))
for(k in seq(1,length(Dates))){
  if(is.na(Date[k])){
    Dates_Time[k] <- Dates[k]
  }else{
    Dates_Time[k] <- Date[k]
  }
}
#This converts the times into seconds
Dates_Times <- unclass(Dates_Time)
#This loop makes the number of seconds that transpired relative to the first trap
Dates_w <- rep(0, length(Dates_Time))
for(i in seq(1, length(Dates))){
  Dates_w[i] <- Dates_Times[i] - Dates_Times[1]
}
#This converts seconds to minutes
Mins <- rep(0, length(Dates))
for(m in seq(1, length(Dates))){
  Mins[m] <- Dates_w[m]/60
}
#This puts the time in minites in the original data fram
Cusack$DateTime <- Mins
Difference <- rep(1,(1-length(Mins)))
#This function calculates the time difference between two points 
calctimedifference <- function(Time_Vector = Mins){
  for(e in seq(1,length(Difference)))
    Difference[e] <- Mins[e]-Mins[e-1]
}
calctimedifference()
#This function will generate a vector with all the intervals at which an animal was sighted during a specific season, position and placement
calc_time_difference = function(Species = "Elephant", Season = "D", Station = 1, Placement = "Random"){
  p <- Species
  e <- Season
  t <- Station
  l <- Placement
  X <- 0
  position <- 0
  for(c in seq(1, length(Mins))){
    if(Cusack$Species[c] == p){
      if(Cusack$Season[c] == e){
        if(Cusack$Station[c] == t){
          if(Cusack$Placement[c] == l){
            X <- X + 1
            position[X] <- c 
          }
        }
      }
    }    
  }
  Intervals <- rep(0,(X-1))
  for(d in position[2:X]){
    Interval[V] <- Cusack$DateTime[d] - Cusack$DateTime[d-1]
    V <- V + 1
  }    
}
calc_time_difference()
