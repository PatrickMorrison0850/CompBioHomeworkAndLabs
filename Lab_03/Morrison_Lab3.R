#Lab step 3: Assigning variable names
Chips <- 5
Guests <- 8
#How many bags of chips each person will eat
Average <- .4
#Total number of people including myself
Total <- Guests + 1
Leftover <- (Chips - (Total * Average))
#There are 1.4 bags leftover, my cockatiels are going to be happy tonight
#Now I start the second exercise
Self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)
PennyIV <- Penny[4]
#This is the sum of the rankings
SumRankings <- cbind(Self, Penny, Jenny, Lenny, Stewie)
str(PennyIV)
str(Penny)
str(SumRankings)
TotalRankings <- data.frame(Self, Penny, Jenny, Lenny, Stewie)
as.data.frame(SumRankings)
#cbind puts the vectors into a matrix
#data.frame() shows what the matrix looks like
#str() gives you additional info about matrix like number of rows and columns
EpisodeNames <- c("I", "II", "III", "IV", "V", "VI", "VII")
#Tells you what ranking each episode got
row.names(TotalRankings) <- EpisodeNames
str(TotalRankings)
#Everyone's ranking for episode III
TotalRankings[3,]
#Lenny's Rankings
TotalRankings[,4]
#Penny's ranking of episode II
TotalRankings["II", "Penny"]
#Everyones ranking of IV to VI
TotalRankings[c(4:6),]
#All rankings for II, V and VII
TotalRankings[c(2, 5, 7),]
#Penny, Jenny, Stewie Ranking for Episodes IV and VI
TotalRankings[c(4,6), c("Penny", "Jenny", "Stewie")]
PJS46 <- TotalRankings[c(4,6), c("Penny", "Jenny", "Stewie")]
ii <- TotalRankings["II", "Lenny"]
#Instead of 23>>25>>26, I did 25>>26>>23
#Switch episodes 2 and 5 rankings
TotalRankings["II", "Lenny"] <- TotalRankings["V", "Lenny"]
TotalRankings["V", "Lenny"] <- ii
#Undo switch
TotalRankings$Lenny
TotalRankings$Lenny[2]
v <- TotalRankings$Lenny[5]
TotalRankings$Lenny[5] <- TotalRankings$Lenny[2]
TotalRankings$Lenny[2] <- v
#redo switch
two <- TotalRankings[2, 4]
TotalRankings[2, 4] <- TotalRankings[5, 4]
TotalRankings[5, 4] <- two
#Done :)