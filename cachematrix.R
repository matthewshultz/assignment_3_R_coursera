## Put comments here that give an overall description of what your
## functions do

## I have pretty much copied the makeVector function and replaced the "mean" 
## function with "solve" function so it will work the same way

##The first function, CacheMatrix creates a special "matrix", which is really a 
##list containing a function to:

##set the value of the matrix
##get the value of the matrix
##set the value of the inversed matrix
##get the value of the inversed matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function
## function calculates the inverse of the special "matrix" created with the above 
## function. However, it first checks to see if the inverse has already been 
## calculated. If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse 
## in the cache via the setsolve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
