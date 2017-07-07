## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(m_data = matrix()) {
    m_inverse <- NULL 
    set <- function(y){
        m_data <<- y
        m_inverse <<- NULL
    }
    get <- function() m_data
    setinverse <- function(input) m_inverse<<- input
    getinverse <- function() m_inverse
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}
# the above function returns a list that contains 4 functions:
##set(), which allows you to set the data stored within the created list
##get() which allows you to access the data stored in the list
##setinverse() which allows you to set the inverse of the matrix stored in the list
##getinverse() which allows you to access the inverse of the matrix


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
     m_inv <- x$getinverse()
     if(!is.null(m_inv)){
         message("getting cached inverse")
         return(m_inv)
     }
     m_data <- x$get()
     m_inv <- solve(m_data)
     x$setinverse(m_inv)
     m_inv
}
#this function returns the inverse of the matrix stored in a list object created in 
#the  makeCacheMatrix function defined above, either calculating the inverse and 
#returning it if it has not been previously calculated an stored in the list