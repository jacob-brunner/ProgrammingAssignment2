## These functions cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(mat = matrix()) {
    inverse <- NULL
    set <- function(x) {
        mat <<- x;
        inverse <<- NULL;
    }
    get <- function() return(mat);
    setinv <- function(inv) inverse <<- inv;
    getinv <- function() return(inverse);
    return(list(set = set, get = get, setinv = setinv, getinv = getinv))
}

## This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. If the inverse has already been calculated (and the matrix has not changed), then `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(mat, ...) {
    inverse <- mat$getinv()
    if(!is.null(inverse)) {
        return(inverse)
    }
    d <- mat$get()
    inverse <- solve(d, ...)
    mat$setinv(inverse)
    return(inverse)
}