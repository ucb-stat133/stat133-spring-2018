Testing functions
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Introduction to the R package "testthat"
> -   Write simple functions and their unit tests
> -   Test your code

R package `"testthat"`
----------------------

`"testthat"` is one of the packages in R that helps you write tests for your functions. One of the main references is the paper *testthat: Get Started with Testing* by Hadley Wickham (see link below). This paper clearly describes the philisoply and workflow of `"testthat"`. But keep in mind that since the introduction of the package, many more functions haven been added to it.

<https://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf>

About `"testthat"`
------------------

-   `"testthat"` provides a testing framework for R that is easy to learn and use
-   `"testthat"` has a hierarchical structure made up of:
    -   expectations
    -   tests
    -   contexts
-   A **context** involves **tests** formed by groups of **expectations**
-   Each structure has associated functions:
    -   `expect_that()` for expectations
    -   `test_that()` for groups of tests
    -   `context()` for contexts

``` r
# remember to install "testthat"
install.packages("testthat")

# load it
library(testthat)
```

### List of common expectation functions

| Function                  | Description                                   |
|---------------------------|-----------------------------------------------|
| `expect_true(x)`          | expects that `x` is `TRUE`                    |
| `expect_false(x)`         | expects that `x` is `FALSE`                   |
| `expect_null(x)`          | expects that `x` is `NULL`                    |
| `expect_type(x)`          | expects that `x` is of type `y`               |
| `expect_is(x, y)`         | expects that `x` is of class `y`              |
| `expect_length(x, y)`     | expects that `x` is of length `y`             |
| `expect_equal(x, y)`      | expects that `x` is equal to `y`              |
| `expect_equivalent(x, y)` | expects that `x` is equivalent to `y`         |
| `expect_identical(x, y)`  | expects that `x` is identical to `y`          |
| `expect_lt(x, y)`         | expects that `x` is less than `y`             |
| `expect_gt(x, y)`         | expects that `x` is greater than `y`          |
| `expect_lte(x, y)`        | expects that `x` is less than or equal to `y` |
| `expect_gte(x, y)`        | expects that `x` is greater than or equal `y` |
| `expect_named(x)`         | expects that `x` has names `y`                |
| `expect_matches(x, y)`    | expects that `x` matches `y` (regex)          |
| `expect_message(x, y)`    | expects that `x` gives message `y`            |
| `expect_warning(x, y)`    | expects that `x` gives warning `y`            |
| `expect_error(x, y)`      | expects that `x` throws error `y`             |

------------------------------------------------------------------------

Motivation
----------

To understand how `"testthat"` works, let's start with the `standardize()` function that we've discussed a couple of times during class:

``` r
#' @title Standardize
#' @description Computes z-scores (scores in standard units)
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return vector of standard scores
#' @examples 
#'  a <- runif(5)
#'  z <- standardize(a)
#'  mean(z)
#'  sd(z)
standardize <- function(x, na.rm = FALSE) {
  z <- (x - mean(x, na.rm = na.rm)) / sd(x, na.rm = na.rm)
  return(z)
}
```

When writing a function, we typically test it like this:

``` r
a <- c(2, 4, 7, 8, 9)
z <- standardize(a)
z
```

    ## [1] -1.3719887 -0.6859943  0.3429972  0.6859943  1.0289915

We can check the mean and standard deviation of `z` to make sure `standardize()` works correctly:

``` r
# zero mean
mean(z)
```

    ## [1] 0

``` r
# unit std-dev
sd(z)
```

    ## [1] 1

Then we keep testing a function with more extreme cases:

``` r
y <- c(1, 2, 3, 4, NA)
standardize(y)
```

    ## [1] NA NA NA NA NA

``` r
standardize(y, na.rm = TRUE)
```

    ## [1] -1.1618950 -0.3872983  0.3872983  1.1618950         NA

and even more cases:

``` r
alog <- c(TRUE, FALSE, FALSE, TRUE)
standardize(alog)
```

    ## [1]  0.8660254 -0.8660254 -0.8660254  0.8660254

------------------------------------------------------------------------

Writing Tests
-------------

Instead of writing a list of more or less informal test, we are going to use the functions provide by `"testthat"`.

To lear about the testing functinos, we'll consider the following testing vectors:

-   `x <- c(1, 2, 3)`
-   `y <- c(1, 2, NA)`
-   `w <- c(TRUE, FALSE, TRUE)`
-   `q <- letters[1:3]`

### Testing with "normal" input

The core of `"testthat"` consists of **expectations**; to write expectations you use functions of the form `expect_xyz()` such as `expect_equal()`, `expect_integer()` or `expect_error()`.

``` r
x <- c(1, 2, 3)
z <- (x - mean(x)) / sd(x)

expect_equal(standardize(x), z)
expect_length(standardize(x), length(x))
expect_type(standardize(x), 'double')
```

Notice that when an expectation runs successfully, nothing appears to happen. But that's good news. If an expectation fails, you'll typically get an error, here are some failed tests:

``` r
# different expected output
expect_equal(standardize(x), x)
```

    ## Error: standardize(x) not equal to `x`.
    ## 3/3 mismatches (average diff: 2)
    ## [1] -1 - 1 == -2
    ## [2]  0 - 2 == -2
    ## [3]  1 - 3 == -2

``` r
# different expected length
expect_length(standardize(x), 2)
```

    ## Error: standardize(x) has length 3, not length 2.

``` r
# different expected type
expect_type(standardize(x), 'character')
```

    ## Error: standardize(x) has type `double`, not `character`.

### Testing with "missing values"

Let's include a vector with missing values

``` r
y <- c(1, 2, NA)
z1 <- (y - mean(y, na.rm = FALSE)) / sd(y, na.rm = FALSE)
z2 <- (y - mean(y, na.rm = TRUE)) / sd(y, na.rm = TRUE)

expect_equal(standardize(y), z1)
expect_length(standardize(y), length(y))
expect_equal(standardize(y, na.rm = TRUE), z2)
expect_length(standardize(y, na.rm = TRUE), length(y))
expect_type(standardize(y), 'double')
```

### Testing with "logical" input

Let's now test `standardize()` with a logical vector:

``` r
w <- c(TRUE, FALSE, TRUE)
z <- (w - mean(w)) / sd(w)

expect_equal(standardize(w), z)
expect_length(standardize(w), length(w))
expect_type(standardize(w), 'double')
```

------------------------------------------------------------------------

Function `test_that()`
----------------------

Now that you've seen how the expectation functions work, the next thing to talk about is the function `test_that()` which you'll use to group a set of expectations

Looking at the previous test examples with the "normal" input vector, all the expectations can be wrapped inside a call to `test_that()` like this:

``` r
test_that("standardize works with normal input", {
  x <- c(1, 2, 3)
  z <- (x - mean(x)) / sd(x)

  expect_equal(standardize(x), z)
  expect_length(standardize(x), length(x))
  expect_type(standardize(x), 'double')
})
```

Likewise, all the expectations with the vector contaiing missing values can be wrapped inside another call to `test_that()` like this:

``` r
test_that("standardize works with missing values", {
  y <- c(1, 2, NA)
  z1 <- (y - mean(y, na.rm = FALSE)) / sd(y, na.rm = FALSE)
  z2 <- (y - mean(y, na.rm = TRUE)) / sd(y, na.rm = TRUE)
  
  expect_equal(standardize(y), z1)
  expect_length(standardize(y), length(y))
  expect_equal(standardize(y, na.rm = TRUE), z2)
  expect_length(standardize(y, na.rm = TRUE), length(y))
  expect_type(standardize(y), 'double')
})
```

And last, but not least, the expectations with the logical vector can be grouped in a `test_that()` call:

``` r
test_that("standardize handles logical vector", {
  w <- c(TRUE, FALSE, TRUE)
  z <- (w - mean(w)) / sd(w)
  
  expect_equal(standardize(w), z)
  expect_length(standardize(w), length(w))
  expect_type(standardize(w), 'double')
})
```

------------------------------------------------------------------------

Testing Structure
-----------------

As we mentioned in the introduction, there is a hierarchical structure for the tests that is made of *expectations* that are grouped in *tests*, which are in turn considered to be part of some *context*. In other words:

> A **context** involves **tests** formed by groups of **expectations**

The formal way to implement the tests is to include them in a separate `R` script file, e.g. `tests.R`.

Suppose you are working on a project with some file structure like the one below. You could have a `code/` directory containing your functions, the tests for the functions, and maybe some scripts:

       project/
          code/
             functions.R
             tests.R
             scripts.R
          data/
          images/
          report/
          ...

The content of `tests.R` may look like this:

``` r
# load the source code of the functions to be tested
source("functions.R")

# context with one test that groups expectations
context("Tests for Standardize")


test_that("standardize works with normal input", {
  x <- c(1, 2, 3)
  z <- (x - mean(x)) / sd(x)

  expect_equal(standardize(x), z)
  expect_length(standardize(x), length(x))
  expect_type(standardize(x), 'double')
})


test_that("standardize works with missing values", {
  y <- c(1, 2, NA)
  z1 <- (y - mean(y, na.rm = FALSE)) / sd(y, na.rm = FALSE)
  z2 <- (y - mean(y, na.rm = TRUE)) / sd(y, na.rm = TRUE)
  
  expect_equal(standardize(y), z1)
  expect_length(standardize(y), length(y))
  expect_equal(standardize(y, na.rm = TRUE), z2)
  expect_length(standardize(y, na.rm = TRUE), length(y))
  expect_type(standardize(y), 'double')
})


test_that("standardize handles logical vector", {
  w <- c(TRUE, FALSE, TRUE)
  z <- (w - mean(w)) / sd(w)
  
  expect_equal(standardize(w), z)
  expect_length(standardize(w), length(w))
  expect_type(standardize(w), 'double')
})
```

### Runing the tests

If your working directory is the `code/` directory, then you could run the tests in `tests.R` from the R console using the function `test_file()`

``` r
# (assuming that your working directory is "code/")
# run from R console
library(testthat)
test_file("tests.R")
```

If all tests are okay, you should be able to see some output similar to the screenshot below:

![Basic R-GUI console](14-images/test-report.png)
