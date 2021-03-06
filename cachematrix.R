## below two functions are a pair of functions 
##that cache the inverse of a matrix.

##function makeCacheMatri creates a special "matrix" object
## that can cache its inverse.

makeCacheMatri <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve(x)
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
} 

##Function cacheSolve computes the inverse of the special "matrix" 
##returned by  makeCacheMatrix  above. 
##If the inverse has already been calculated (and the matrix has not changed),
##then  cacheSolve  should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
	##Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}


