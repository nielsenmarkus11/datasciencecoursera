# Notes from week 3:

## sapply slides:

This is the same as lapply but simplifies the result to an array or vector if it can.

## apply slides:

* it is not really faster than looping explicitly.

* more efficient functions than using apply()
rowSums()
rowMeans()
colSums()
colMeans()

## mapply slides:

* used to apply multiple arguments to the same function.

## tapply slides:

Used to apply a function over subsets(factor variables) of a vector.
* there is no simplification

## split slides:

Nice thing is split can be used to subset data for use with the lapply and sapply functions.

Example:

    library(datasets)
    s <- split(airquality,airquality$Month)
    sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm=T))

Use `interaction()` (or `split(x,list(lev1,lev2),drop=T)`) to split on more than one level.

## Debugging Slides 2

`traceback` prints out function call stack after it occurs.
`debug` flags a function and allows you to step through execution one line at a time.
`browser` is like `debug` but it stops only at the lines specified.
`trace` allows you to insert debugging code without changing the function.
`recover` allows you to stop the function when it hits the error.

Examples:

    mean(x)
    traceback()
    
    lm(y~x)
    traceback()
    
    debug(lm)
    lm(y~x)

    options(error=recover)
    