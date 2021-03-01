# given values for matrices
A <- matrix(1:100, nrow=10)
B <- matrix(1:1000, nrow=10)
d# transpose matrix A
Atran <- matrix(1:100, nrow=10, byrow=T) #or
Atran <- t(A)
# randomize values in matrix A
A2 <- matrix(sample(A),nrow=10)
# assign randomized matrix
A3 <- matrix(A2,nrow=10)
# transpose matrix A3
t(A3)
# find determinate of matrix
det(A3)
# find inverse of matrix
solve(A3)
