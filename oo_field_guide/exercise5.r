### UseMethod() calls methods in a special way. Predict what the following code will return, then run it and read the help for UseMethod() to figure out what's going on. Write down the rules in the simplest form possible.

y <- 1
g <- function(x) {
  y <- 2
  UseMethod("g")
}
g.numeric <- function(x) y
g(10)
# [1] 2

# It starts looking for y in the environment of the method and it can't find it. Then it moves on to the env of the generic g and finds y <- 2


h <- function(x) {
  x <- 10
  UseMethod("h")
}
h.character <- function(x) paste("char", x)
h.numeric <- function(x) paste("num", x)

h("a")
# [1] "char a"
# It finds x in the environment of the method h.character & h.nuemric respectively

# The point is that there is a hierarchy of environments.  The specific method appropriate to the class will be searched first and then the environment of the generic function itself.  Only if neither environment contains the variable would the global environment be searched.
