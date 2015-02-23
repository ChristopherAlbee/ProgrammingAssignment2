## The functions makeCacheMatrix() and cacheSolve() provide a means for 
## a user to cache the inverse of a matrix and so avoid a potentially
## costly computation if the cache has been initialized and the matrix
## has not changed.

## The following function creates an object (i.e. a List) whose members 
## can cache a matrix and its inverse, and retrieve them also.
makeCacheMatrix <- function(mat = matrix()) {
    ## Initialize the cache for the inverse matrix.
    inv <- NULL
    
    ## Overwrite the existing matrix; set inverse matrix to null.
    fn_set <- function(y) {  
        mat <<- y
        inv <<- NULL
    }
    
    ## Return the matrix.
    fn_get <- function() {
        mat
    }
    
    ## Set the inverse matrix.
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
cacheSolve <- function(x, matNew = matrix(), ...) {
    ## Read the cached matrix and its inverse from makeCacheMatrix
    matCached <- x$get()
    invCached <- x$getinverse()
    
    ## Has the inverse already been calculated, and is the matrix
    ## the same? Then return the inverse from cache.
    if(!is.null(invCached) && identical(matNew, matCached)) { 
        message("getting cached inverse matrix")
        return(invCached)     # we're done here.
    }
    
    ## Otherwise calculate the inverse for the new matrix and return it.
    inv  <- solve(matNew, ...)
    message("calculating new inverse matrix")
    inv
}
