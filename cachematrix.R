## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## MakeCacheMatrix return a list of 4 functions
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL                           
    set <- function(y) {
    x <<- y                                 ## superassign the variable x
    m <<- NULL                              ## superassign the variable m
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve ## superassign the variable m 
    getsolve <- function() m
    list(set = set, get = get,              ## returns a list
         setsolve = setsolve,
        getsolve = getsolve)
}


## Write a short comment describing this function
## Return a matrix that is the inverse of the matrix that is passed like argument at function "makeCacheMatrix
cacheSolve <- function(x, ...) {            ## argument "x" is a list of functions
    m <- x$getsolve()
    if(!is.null(m)) {                       ## when m is not null return cache inverse matrix and skip the function
        message("getting cached data")
        return(m)                       
    }
    data <- x$get()
    m <- solve(data, ...)                   ## calc the inverse matrix
    x$setsolve(m)
    m                                           
}

