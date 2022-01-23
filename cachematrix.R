## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a special matrix object that caches its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) m <<- inverse #assigns the input argument inverse to m
  getinverse <- function() m  
  ## returns a list containing the 4 functions created within the makeCacheMatrix object environment 
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## cacheSolve is a function that computes the inverse of a matrix which is invertible;
#If the inverse has already been calculated then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m) # returns the inverse matrix previously calculated retrieved from cache
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m) ##returns a matrix that is the inverse of 'x' 
  i
}
