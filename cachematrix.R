## I use two functions, one to create a object, with methods. The second one uses the methods of the first one
## It's a really OOP approach



## input is a matrix. Original matrix is strored and its mean (intially set at NULL) too.
## get, setsolve and getsolve methods are used by cacheSolve function
## we use  <<- operator to assign a value to an object in an environment that is different from the current environment

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


## The input is an object created by makeCacheMatrix
## If the mean() was previously calculated, cached data is used (getsolve). Else solve() is used and the result is stored (setsolve)

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
