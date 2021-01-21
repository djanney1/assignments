assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22) 
   # Input values for "assignment2"
myMean <- function(assignment2) { return(sum(assignment)/length(someData)) }
   # Input function for testing
   # Right away I see there will be an error because "assignment" and "someData"
   # have not been given any values
   # Test function:
myMean(assignment2) 
   # Returns "Error in myMean(assignment2) : object 'assignment' not found"
   # If the mean of "assignment2" is the intention of the function, 
   # then insert "assignment2" in both sum() and length()
myMean <- function(assignment2) { return(sum(assignment2)/length(assignment2)) }
myMean(assignment2) # Returns mean of "assignment2"
[1] 19.25
