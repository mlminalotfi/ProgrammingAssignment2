makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
  x <<- y
  inv <<- NULL
  }
  
  get <- function() {
   return(x)
  }
  
  setInverse <- function(inverse) {
   inv <<- inverse
   }
    getInverse <- function() {
      return(inv)
    }
     list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


# Create a matrix object with caching capabilities
 m <- makeCacheMatrix(matrix(1:4, 2, 2))
# Set a new matrix
 m$set(matrix(c(5, 6, 7, 8), 2, 2))
 # Get the matrix
 print(m$get())
 # [,1] [,2]
  #[1,]    5    7
  #[2,]    6    8

  # Compute and set the inverse of the matrix (if necessary)
 inv_matrix <- solve(m$get())
 m$setInverse(inv_matrix)
 # Retrieve the inverse from cache
  print(m$getInverse())
 # [,1] [,2]
 #    [1,]   -4  3.5
 #    [2,]    3 -2.5

