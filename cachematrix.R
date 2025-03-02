## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is consist set, get, setinv, and getinv

library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function()x
  setinv <- function(inverse)inv <<- inverse
  getinv <- function() {
    inver <- ginv(x)
    inver%*%x
  }
  list(set = set, get = get,
       setinv = getinv,
       getinv = getinv)
}

## cacheSolve function is to get cache data

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data() <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}