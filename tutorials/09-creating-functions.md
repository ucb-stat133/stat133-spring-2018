Getting started with functions
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Define a function that takes arguments
> -   Return a value from a function
> -   Test a function
> -   Set default values for function arguments
> -   Documenting a function

------------------------------------------------------------------------

Motivation
----------

-   R comes with many functions (and packages) that let us perform a wide variety of tasks.
-   Most of the things we do in R is via calling some function.
-   Sometimes, however, there's no function to do what we want to achieve.
-   When that's the case, you will want to write your own functions.

So far you've been using a number of functions in R. Now it's time to see how you can create and use your own functions.

Consider the data set `starwars` that comes in the package `"dplyr"`

``` r
starwars
```

    ## # A tibble: 87 x 13
    ##    name     height  mass hair_color skin_color eye_color birth_year gender
    ##    <chr>     <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> 
    ##  1 Luke Sk…    172  77.0 blond      fair       blue            19.0 male  
    ##  2 C-3PO       167  75.0 <NA>       gold       yellow         112   <NA>  
    ##  3 R2-D2        96  32.0 <NA>       white, bl… red             33.0 <NA>  
    ##  4 Darth V…    202 136   none       white      yellow          41.9 male  
    ##  5 Leia Or…    150  49.0 brown      light      brown           19.0 female
    ##  6 Owen La…    178 120   brown, gr… light      blue            52.0 male  
    ##  7 Beru Wh…    165  75.0 brown      light      blue            47.0 female
    ##  8 R5-D4        97  32.0 <NA>       white, red red             NA   <NA>  
    ##  9 Biggs D…    183  84.0 black      light      brown           24.0 male  
    ## 10 Obi-Wan…    182  77.0 auburn, w… fair       blue-gray       57.0 male  
    ## # ... with 77 more rows, and 5 more variables: homeworld <chr>,
    ## #   species <chr>, films <list>, vehicles <list>, starships <list>

Let's focus on the variable `height`, more specifically on the first 10 values:

``` r
ht10 <- starwars$height[1:10]
ht10
```

    ##  [1] 172 167  96 202 150 178 165  97 183 182

The values of `height` (and `ht10`) are expressed in centimeters, but what if we wanted to obtain values in inches? The conversion formula is 1 cm = 0.3937 in.

``` r
# height in inches
ht10 * 0.3937
```

    ##  [1] 67.7164 65.7479 37.7952 79.5274 59.0550 70.0786 64.9605 38.1889
    ##  [9] 72.0471 71.6534

This works. But what if you had more data sets, all of them containing `height` values in cms, and you needed to convert those cms into inches? Wouldn't be nice to have a dedicated function `cm2in()`?

``` r
cm2in(ht10)
```

R does not have a built-in function `cm2in()` but we can create one. Let's see how to do it "logically" step by step:

``` r
# 1) concrete example
ht10 * 0.3937

# 2) make it more general
x <- ht10
y <- x * 0.3937

# 3) encapsulate code with an R expression
{
  y <- x * 0.3937
}

# 4) create function
cm2in <- function(x) {
  y <- x * 0.3937
  return(y)
}

# 5) test it
cm2in(ht10)

# 6) keep testing
cm2in(starwars$height)
```

-   To define a new function in R you use the function `function()`.
-   You need to specify a name for the function, and then assign `function()` to the chosen name.
-   You also need to define optional arguments (i.e. inputs).
-   And of course, you must write the code (i.e. the body) so the function does something when you use it:

------------------------------------------------------------------------

Anatomy of a function
---------------------

``` r
# anatomy of a function
some_name <- function(arguments) {
  # body of the function
}
```

-   Generally, you give a name to a function.
-   A function takes one or more inputs (or none), known as *arguments*.
-   The expressions forming the operations comprise the **body** of the function.
-   Usually, you wrap the body of the functions with curly braces.
-   A function returns a single value.

A less abstract function could have the following structure:

``` r
some_name <- function(arg1, arg2, etc) 
{
  expression_1
  expression_2
  ...
  expression_n
}
```

------------------------------------------------------------------------

### Scale Transformations

Let's see another example. Often, we need to transform the scale of one or more variables. Perhaps the most common type of transformation is when we *standardize* a variable, that is: mean-center and divide by its standard deviation:

![standard score](https://wikimedia.org/api/rest_v1/media/math/render/svg/5ceed701c4042bb34618535c9a902ca1a937a351)

R has the function `scale()` that can be used to perform this operation, but let's pretend for a minute that there's no function in R to calculate standard scores. Here are the primary steps to compute such score:

-   compute the mean
-   compute the standard deviation
-   calculate deviations from mean
-   divide by standard deviation

``` r
x <- ht10
x_mean <- mean(x)
x_sd <- sd(x)
x_centered <- x - x_mean
z <- x_centered / x_sd
z
```

    ##  [1]  0.3584311  0.2184189 -1.7697535  1.1985040 -0.2576224  0.5264457
    ##  [7]  0.1624141 -1.7417511  0.6664578  0.6384554

Having the code of the body, we can encapsulate it with a function:

``` r
# first round
standardize <- function(x) {
  x_mean <- mean(x)
  x_sd <- sd(x)
  x_centered <- x - x_mean
  z <- x_centered / x_sd
  return(z)
}
```

And now we can test it:

``` r
standardize(ht10)
```

    ##  [1]  0.3584311  0.2184189 -1.7697535  1.1985040 -0.2576224  0.5264457
    ##  [7]  0.1624141 -1.7417511  0.6664578  0.6384554

What about applying `standardize()` on the entire column `height`:

``` r
standardize(starwars$height)
```

    ##  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [24] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [47] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [70] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

Ooops! Because `starwars$height` contains missing values, our `standardize()` function does not know how to deal with them.

### Dealing with missing values

How to deal with `NA`'s? Many functions in R like `sum()`, `mean()`, and `median()` have the so-called `na.rm` argument to specify if missing values should be removed before any computation this feature. We can take advantage of `na.rm = TRUE`:

``` r
# second round
standardize <- function(x) {
  x_mean <- mean(x, na.rm = TRUE)
  x_sd <- sd(x, na.rm = TRUE)
  x_centered <- x - x_mean
  z <- x_centered / x_sd
  return(z)
}

standardize(ht10)
```

    ##  [1]  0.3584311  0.2184189 -1.7697535  1.1985040 -0.2576224  0.5264457
    ##  [7]  0.1624141 -1.7417511  0.6664578  0.6384554

``` r
standardize(starwars$height)
```

    ##  [1] -0.06781696 -0.21161731 -2.25358235  0.79498517 -0.70053852
    ##  [6]  0.10474347 -0.26913745 -2.22482228  0.24854382  0.21978375
    ## [11]  0.39234418  0.16226361  1.54274702  0.16226361 -0.03905689
    ## [16]  0.01846326 -0.12533710  0.16226361 -3.11638448 -0.12533710
    ## [21]  0.24854382  0.73746503  0.44986432  0.07598340  0.01846326
    ## [26]  0.16226361 -0.70053852          NA -2.48366292 -0.41293781
    ## [31]  0.53614453  0.47862439 -0.12533710  0.62242475  1.42770673
    ## [36]  0.91002546  0.24854382 -1.07441944 -1.79342122  0.24854382
    ## [41] -0.32665760  0.01846326  0.16226361  0.10474347 -2.31110250
    ## [46] -1.50582051 -0.32665760  0.39234418  0.67994489  0.62242475
    ## [51] -0.09657703  0.27730389  0.39234418  2.57810957  0.39234418
    ## [56]  0.62242475  0.30606397 -0.49921802  0.24854382  0.24854382
    ## [61] -0.12533710 -0.24037738 -0.26913745  0.53614453  0.47862439
    ## [66]  0.24854382 -0.18285724  0.67994489  1.57150709  1.11134595
    ## [71] -0.21161731 -2.74250356 -2.25358235  0.53614453  0.47862439
    ## [76]  0.10474347  1.19762617  1.71530744  0.39234418  0.10474347
    ## [81]  0.91002546          NA          NA          NA          NA
    ## [86]          NA -0.26913745

Now `standardize()` is able to return a more useful output by removing missing values. However, we should let the user decide if `NA`'s must be removed. We can include an argument in `standardize()` to indicate if missing values are to be removed:

``` r
# third round
standardize <- function(x, na_rm = FALSE) {
  x_mean <- mean(x, na.rm = na_rm)
  x_sd <- sd(x, na.rm = na_rm)
  x_centered <- x - x_mean
  z <- x_centered / x_sd
  return(z)
}

# default call
standardize(starwars$height)
```

    ##  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [24] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [47] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [70] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

``` r
# removing NAs
standardize(starwars$height, na_rm = TRUE)
```

    ##  [1] -0.06781696 -0.21161731 -2.25358235  0.79498517 -0.70053852
    ##  [6]  0.10474347 -0.26913745 -2.22482228  0.24854382  0.21978375
    ## [11]  0.39234418  0.16226361  1.54274702  0.16226361 -0.03905689
    ## [16]  0.01846326 -0.12533710  0.16226361 -3.11638448 -0.12533710
    ## [21]  0.24854382  0.73746503  0.44986432  0.07598340  0.01846326
    ## [26]  0.16226361 -0.70053852          NA -2.48366292 -0.41293781
    ## [31]  0.53614453  0.47862439 -0.12533710  0.62242475  1.42770673
    ## [36]  0.91002546  0.24854382 -1.07441944 -1.79342122  0.24854382
    ## [41] -0.32665760  0.01846326  0.16226361  0.10474347 -2.31110250
    ## [46] -1.50582051 -0.32665760  0.39234418  0.67994489  0.62242475
    ## [51] -0.09657703  0.27730389  0.39234418  2.57810957  0.39234418
    ## [56]  0.62242475  0.30606397 -0.49921802  0.24854382  0.24854382
    ## [61] -0.12533710 -0.24037738 -0.26913745  0.53614453  0.47862439
    ## [66]  0.24854382 -0.18285724  0.67994489  1.57150709  1.11134595
    ## [71] -0.21161731 -2.74250356 -2.25358235  0.53614453  0.47862439
    ## [76]  0.10474347  1.19762617  1.71530744  0.39234418  0.10474347
    ## [81]  0.91002546          NA          NA          NA          NA
    ## [86]          NA -0.26913745

### Simplifying the body

So far we have a working function `standardize()` that does the job and takes care of potential missing values. We can take a further step and review the code of the body. Let's go back to the initial code:

``` r
x <- ht10
x_mean <- mean(x)
x_sd <- sd(x)
x_centered <- x - x_mean
z <- x_centered / x_sd
```

The code above works, but it is very "verbose". We can take advantage of R's functional behavior to shorten the computation of the standard scores in one line:

``` r
x <- ht10
z <- (x - mean(x)) / sd(x)
z
```

    ##  [1]  0.3584311  0.2184189 -1.7697535  1.1985040 -0.2576224  0.5264457
    ##  [7]  0.1624141 -1.7417511  0.6664578  0.6384554

Having simplified the code, we can simplify our function:

``` r
# fifth round
standardize <- function(x, na_rm = FALSE) {
  z <- (x - mean(x, na.rm = na_rm)) / sd(x, na.rm = na_rm)
  return(z)
}

standardize(tail(starwars$height, n = 10), na_rm = TRUE)
```

    ##  [1]  1.4840831 -0.2311888 -0.6040740  0.4400046         NA         NA
    ##  [7]         NA         NA         NA -1.0888248

------------------------------------------------------------------------

Documenting Functions
=====================

The examples of functions in this tutorial are simple, and fairly understandble (I hope so). However, you should strive to always include *documentation* for your functions. What does this mean? Documenting a function involves adding descriptions for the purpose of the function, the inputs it accepts, and the output it produces.

-   Description: what the function does
-   Input(s): what are the inputs or arguments
-   Output: what is the output (returned value)

You can find some inspiration in the `help()` documentation when your search for a given function's description.

There are several approaches for writing documentation of a function. I will show you how to use what are called **roxygen comments** to achieve this task. While not used by most useRs, they are great when you want to take your code and make a package out of it.

Here's an example of documentation for `standardize()`

``` r
#' @title Standardize
#' @description Transforms values in standard units (i.e. standard scores)
#' @param x numeric vector
#' @param na_rm whether to remove missing values
#' @return standardized values
#' @examples
#'   standardize(rnorm(10))
standardize <- function(x, na_rm = FALSE) {
  z <- (x - mean(x, na.rm = na_rm)) / sd(x, na.rm = na_rm)
  return(z)
}
```

-   Roxygen comments are R comments formed by the hash symbol immediately followed by an apostrophe: `#'`

-   You specify the label of a field with `@` and a keyword: e.g. `@title`

-   The syntax highlighting of RStudio recognizes this type of comments and labels

-   Typical roxygen fields:

| label          | meaning     | description                |
|----------------|-------------|----------------------------|
| `@title`       | title       | name of your function      |
| `@description` | description | what the function does     |
| `@param input` | parameter   | describe `input` parameter |
| `@return`      | output      | what is the returned value |

------------------------------------------------------------------------

### General Strategy for Writing Functions

-   Always start simple with test toy-values.
-   Get what will be the body of the function working first.
-   Check out each step of the way.
-   Don't try and do too much at once.
-   Create (encapsulate body) the function once everything works.
-   Optional: after you have a function that works, you may worry about "elegance", "efficiency", "cleveness", etc
-   Include documentation; we suggest using Roxygen comments.
