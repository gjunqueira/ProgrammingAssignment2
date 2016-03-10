## Function that creates an "object" representation on a Matrix
## with cache features and helper "methods".
makeCacheMatrix <- function(theMatrix = matrix()) {
    inverseMatrix <- NULL
    
    # Definition of helper method for seting the matrix
    set <- function(y) {
        theMatrix <<- y
        inverseMatrix <<- NULL
    }
    
    # Definition of helper method for getting the matrix
    get <- function() {
        theMatrix  
    } 
    
    # Definition of helper method for seting the inverse matrix
    setInverse <- function(m){
        inverseMatrix <<- m 
    }
    
    # Definition of helper method for getting the inverse matrix
    getInverse <- function() {
        inverseMatrix
    }
    
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## Function that takes a cacheable matrix created with makeCacheMatrix
## and returns the cached inverse matrix, if applicable 
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
