# debugging this code
#tukey_multiple <- function(x) {
#  outliers <- array(TRUE,dim=dim(x))
#  for (j in 1:ncol(x))
#  {
#    outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
#  }
#  outlier.vec <- vector(length=nrow(x))
#  for (i in 1:nrow(x))
#  { outlier.vec[i] <- all(outliers[i,]) } return(outlier.vec) }

# original code
tukey_multiple <- function(x) {
    outliers <- array(TRUE,dim=dim(x))
    for (j in 1:ncol(x))
    {
    outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
    }
    outlier.vec <- vector(length=nrow(x))
    for (i in 1:nrow(x))
    { outlier.vec[i] <- all(outliers[i,]) } return(outlier.vec) }

# modified code
tukey_multiple <- function(x) {
    outliers <- array(TRUE,dim=dim(x))
    for (j in 1:ncol(x))
    {
      outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
    }
    outlier.vec <- vector(length=nrow(x))
    for (i in 1:nrow(x))
    { outlier.vec[i] <- all(outliers[i,]) }
    return(outlier.vec) }  # created new line for return()

# created an array
n <- c(5,3,6,7)
m <- c(3535,35,13,99)
nm <- cbind(n,m)

# start debugging
debug(tukey_multiple)
tukey_multiple(nm)

#removed code that contained tukey.outlier
tukey_multiple2 <- function(x) {
  outliers <- array(TRUE,dim=dim(x))
  for (j in 1:ncol(x))
  outlier.vec <- vector(length=nrow(x))
  for (i in 1:nrow(x))
  {outlier.vec[i] <- all(outliers[i,])}
  return(outlier.vec) }
