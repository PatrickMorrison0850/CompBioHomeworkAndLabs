**Camera Trap Analysis** 

The purpose of this analysis was three fold. It was to first translate the dates into minutes starting from the first animal caught by the camer trap.
The second was to create a vector that showed the time intervals between each trap.
The third phase of the analysis was to parse out the individal species under specific circumstancers and create a vector that had the intervals for the given species.

**Turning the dates and times into minutes.**

This part of the script used the as.POSIXct() function and the %d/%m/%y %H:%M fromat to determine what was what in the original data set. Then, a loop was used to remove any values that were NAs because different format for the date enetering was used.

**Finding the time intervals.**

To calculate the time intervals, a vector was made with the length one less than the column length. Then a loop was ran that subtracted the time at the current iteration from the time of the last itteration.

**Finding the time intervals between specific species**

To calculate the ammount of time between specific species setting off a camera traps, a seriers of if statements in a loop was used to determine how many of the trap triggerings were under the specified condition and another vector was the indexes. A second loop went through the indexed values and calculated the difference.