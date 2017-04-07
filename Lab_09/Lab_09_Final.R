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

#This function calculates the time difference between two points 
calctimedifference <- function(T1 = 3, T2 = 4){
  Dif <- Mins[T2] - Mins[T1] 
  return(Dif)
}
calctimedifference()
#This function will generate a vector with all the intervals at which an animal was sighted during a specific season, position and placement
calc_time_difference = function(Species = "Elephant", Season = "D", Station = 1, Placement = "Random"){
  p <- Species
  e <- Season
  t <- Station
  l <- Placement
  X <- 0
  for(c in seq(1, length(Mins))){
    if(Cusack$Species[c] == p){
      if(Cusack$Season[c] == e){
        if(Cusack$Station[c] == t){
          if(Cusack$Placement[c] == l){
            X <- X + 1
          }
        }
      }
    }    
  }
  Intervals <- rep(0, (length(X)))
  V <- 1
  for(d in seq(1,length(Mins))){
    if(Cusack$Species[d] == p){
      if(Cusack$Season[d] == e){
        if(Cusack$Station[d] == t){
          if(Cusack$Placement[d] == l){
            Intervals[V] <- Cusack$DateTime[d]
            V <- V + 1
          }
        }
      }
    }    
  }
  Interval_Times <- rep(1, (length((X)-1)))
  for(y in seq(2, length(X))){
    Interval_Times[y-1] <- Intervals[y] - Intervals[y-1]  
  }
  return(Interval_Times)
}
calc_time_difference()
