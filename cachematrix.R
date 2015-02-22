## The functions makeCacheMatrix() and cacheSolve() provide a means for 
## a user to cache the inverse of a matrix and so avoid a potentially
## costly computation if the cache has been initialized and the matrix
## has not changed.

## The following function creates an object (i.e. a List) whose members 
## can cache a matrix and its inverse, and retrieve them also.
makeCacheMatrix <- function(mat = matrix()) {
    inv <- NULL          ## inv = the inverse of the matrix
    
    ## Overwrite the existing matrix; set inverse to null.
    fn_set <- function(y) {  
        mat <<- y
        inv <<- NULL
    }
    
    ## Return the matrix.
    fn_get <- function() {
        mat
    }
    
    ## Set the inverse.
    fn_setinverse <- function(inverse) {
        inv <<- inverse
    }
    
    ## Return the inverse.
    fn_getinverse <- function() {
        inv
    }
    
    ## Return a list.
    list(
        set        = fn_set, 
        get        = fn_get,
        setinverse = fn_setinverse,
        getinverse = fn_getinverse
    )
}


## The following function calculates the inverse of the matrix 
## returned by makeCacheMatrix. If the inverse has been calculated
## already and the matrix has not changed, then it returns the inverse
## from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    1
}
