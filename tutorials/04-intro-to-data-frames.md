Introduction to Data Frames
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Understand Data Frames
> -   Importing
> -   Exporting
> -   Basic Manipulation with `[ , ]`

------------------------------------------------------------------------

Manipulating Data Frames
------------------------

The most common format/structure for a data set is a tabular format: with row and columns (like a spreadsheet). When your data is in this shape, most of the time you will work with R **data frames** (or similar rectangular structures like a `"matrix"`, `"table"`, etc).

Learning how to manipulate data tables is among the most important *data computing* basic skills. The traditional way of manipulating data frames in R is based on bracket notation, e.g. `dat[ , ]`, to select specific rows, columns, or cells. Also, the use of the dollar `$` operator to handle columns is fundamental. In this part of the lab, you will practice a wide array of data wrangling tasks with the so-called bracket notation, and the dollar operator.

I should say that there are alternative ways for manipulating tables in R. Among the most recent paradigms, there is the **plying** framework devised by Hadley Wickham. From his doctoral research, the first *plyr* tools were available in the packages `"plyr"` and `"reshape"`. Nowadays we have the `"reshape2"`package, and the extremely popular package `"dplyr"` (among other packages). You will have time to learn more about `"dplyr"` in the next weeks. In the meantime, take some time to understand more about the bracket notation.

R Data Frames
-------------

A data frame is a special type of R list, in which each column is an R vector (or a factor).

When working with data frames, you should always spend some time inspecting the contents, and checking how R is handling the data types. It is in these early stages of data exploration that you can catch potential issues in order to avoid disastrous consequences or bugs in subsequent stages.

What `str()` returns is a display of the dimensions of the data frame, and then a list with the name of all the variables, and their data types (e.g. `chr` character, `num` real, etc). The argument `vec.len = 1` indicates that just the first element in each column should be displayed.

Creating data frames
--------------------

Most of the (raw) data tables you will be working with will already be in some data file. However, from time to time you will face the need of creating some sort of data table in R. In these situations, you will likely have to create such table with a data frame. So let's look at various ways to "manually"" create a data frame.

**Option 1**: The primary option to build a data frame is with `data.frame()`. You pass a series of vectors (or factors), of the same length, separated by commas. Each vector (or factor) will become a column in the generated data frame. Preferably, give names to each column, like `col1`, `col2`, and `col3`, in the example below:

``` r
# creating a basic data frame
my_table1 <- data.frame(
  col1 = LETTERS[1:5],
  col2 = seq(from = 10, to = 50, by = 10),
  col3 = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)

my_table1
```

    ##   col1 col2  col3
    ## 1    A   10  TRUE
    ## 2    B   20  TRUE
    ## 3    C   30 FALSE
    ## 4    D   40  TRUE
    ## 5    E   50 FALSE

**Option 2**: Another way to create data frames is with a `list` containing vectors or factors (of the same length), which then you convert to a data.frame with `data.frame()`:

``` r
# another way to create a basic data frame
my_list <- list(
  col1 = LETTERS[1:5],
  col2 = seq(from = 10, to = 50, by = 10),
  col3 = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)

my_table2 <- data.frame(my_list)

my_table2
```

    ##   col1 col2  col3
    ## 1    A   10  TRUE
    ## 2    B   20  TRUE
    ## 3    C   30 FALSE
    ## 4    D   40  TRUE
    ## 5    E   50 FALSE

Remember that a `data.frame` is nothing more than a `list`. So as long as the elements in the list (vectors or factors) are of the same length, we can simply convert the list into a data frame.

By default, `data.frame()` converts character vectors into factors. You can check that by exmining the structure of the data frame with `str()`:

``` r
str(my_table2)
```

    ## 'data.frame':    5 obs. of  3 variables:
    ##  $ col1: Factor w/ 5 levels "A","B","C","D",..: 1 2 3 4 5
    ##  $ col2: num  10 20 30 40 50
    ##  $ col3: logi  TRUE TRUE FALSE TRUE FALSE

To prevent `data.frame()` from converting strings into factors, you must use the argument `stringsAsFactors = FALSE`

``` r
# strings as strings (not as factors)
my_table3 <- data.frame(
  col1 = LETTERS[1:5],
  col2 = seq(from = 10, to = 50, by = 10),
  col3 = c(TRUE, TRUE, FALSE, TRUE, FALSE),
  stringsAsFactors = FALSE
)

str(my_table3)
```

    ## 'data.frame':    5 obs. of  3 variables:
    ##  $ col1: chr  "A" "B" "C" "D" ...
    ##  $ col2: num  10 20 30 40 50
    ##  $ col3: logi  TRUE TRUE FALSE TRUE FALSE

Basic Operations with Data Frames
---------------------------------

Now that you have seen some ways to create data frames, let's discuss a number of basic manipulations of data frames. I will show you some examples and then you'll have the chance to put in practice the following operations:

-   Selecting table elements:
    -   select a given cell
    -   select a set of cells
    -   select a given row
    -   select a set of rows
    -   select a given column
    -   select a set of columns
-   Adding a new column
-   Deleting a new column
-   Renaming a column
-   Moving a column
-   Transforming a column

Let's say you have a data frame `tbl` with the lineup of the Golden State Warriors:

        player position   salary points  ppg rookie
    1 Thompson       SG 16663575   1742 22.3  FALSE
    2    Curry       PG 12112359   1999 25.3  FALSE
    3    Green       PF 15330435    776 10.2  FALSE
    4   Durant       SF 26540100   1555 25.1  FALSE
    5 Pachulia        C  2898000    426  6.1  FALSE

### Selecting elements

The data frame `tbl` is a 2-dimensional object: the 1st dimension corresponds to the rows, while the 2nd dimension corresponds to the columns. Because `tbl` has two dimensions, the bracket notation involves working with the data frame in this form: `tbl[ , ]`. In other words, you have to specify values inside the brackets for the 1st index, and the 2nd index: `tbl[index1, index2]`.

``` r
# select value in row 1 and column 1
tbl[1,1]
```

    ## [1] "Thompson"

``` r
# select value in row 2 and column 5
tbl[2,5]
```

    ## [1] 25.3

``` r
# select values in these cells
tbl[1:3,3:5]
```

    ##     salary points  ppg
    ## 1 16663575   1742 22.3
    ## 2 12112359   1999 25.3
    ## 3 15330435    776 10.2

If no value is specified for `index1` then all rows are included. Likewise, if no value is specified for `index2` then all columns are included.

``` r
# selecting first row
tbl[1, ]
```

    ##     player position   salary points  ppg rookie
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE

``` r
# selecting third row
tbl[3, ]
```

    ##   player position   salary points  ppg rookie
    ## 3  Green       PF 15330435    776 10.2  FALSE

``` r
# selecting second column
tbl[ ,2]
```

    ## [1] "SG" "PG" "PF" "SF" "C"

``` r
# selecting columns 3 to 5
tbl[ ,3:5]
```

    ##     salary points  ppg
    ## 1 16663575   1742 22.3
    ## 2 12112359   1999 25.3
    ## 3 15330435    776 10.2
    ## 4 26540100   1555 25.1
    ## 5  2898000    426  6.1

### Adding a column

Perhaps the simplest way to add a column is with the dollar operator `$`. You just need to give a name for the new column, and assign a vector (or factor):

``` r
# adding a column
tbl$new_column <- c('a', 'e', 'i', 'o', 'u')
tbl
```

    ##     player position   salary points  ppg rookie new_column
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE          a
    ## 2    Curry       PG 12112359   1999 25.3  FALSE          e
    ## 3    Green       PF 15330435    776 10.2  FALSE          i
    ## 4   Durant       SF 26540100   1555 25.1  FALSE          o
    ## 5 Pachulia        C  2898000    426  6.1  FALSE          u

Another way to add a column is with the *column binding* function `cbind()`:

``` r
# vector of weights
weight <- c(215, 190, 230, 240, 270)

# adding weights to tbl
tbl <- cbind(tbl, weight)
tbl
```

    ##     player position   salary points  ppg rookie new_column weight
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE          a    215
    ## 2    Curry       PG 12112359   1999 25.3  FALSE          e    190
    ## 3    Green       PF 15330435    776 10.2  FALSE          i    230
    ## 4   Durant       SF 26540100   1555 25.1  FALSE          o    240
    ## 5 Pachulia        C  2898000    426  6.1  FALSE          u    270

### Deleting a column

The inverse operation of adding a column consists of **deleting** a column. This is possible with the `$` dollar operator. For instance, say you want to remove the column `new_column`. Use the `$` operator to select this column, and assign it the value `NULL` (think of this as *NULLifying* a column):

``` r
# deleting a column
tbl$new_column <- NULL
tbl
```

    ##     player position   salary points  ppg rookie weight
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE    215
    ## 2    Curry       PG 12112359   1999 25.3  FALSE    190
    ## 3    Green       PF 15330435    776 10.2  FALSE    230
    ## 4   Durant       SF 26540100   1555 25.1  FALSE    240
    ## 5 Pachulia        C  2898000    426  6.1  FALSE    270

### Renaming a column

What if you want to rename a column? There are various options to do this. One way is by changing the column`names` attribute:

``` r
# attributes
attributes(tbl)
```

    ## $names
    ## [1] "player"   "position" "salary"   "points"   "ppg"      "rookie"  
    ## [7] "weight"  
    ## 
    ## $row.names
    ## [1] 1 2 3 4 5
    ## 
    ## $class
    ## [1] "data.frame"

which is more commonly accessed with the `names()` function:

``` r
# column names
names(tbl)
```

    ## [1] "player"   "position" "salary"   "points"   "ppg"      "rookie"  
    ## [7] "weight"

Notice that `tbl` has a list of attributes. The element `names` is the vector of column names.

You can directly modify the vector of `names`; for example let's change `rookie` to `rooky`:

``` r
# changing rookie to rooky
attributes(tbl)$names[6] <- "rooky"

# display column names
names(tbl)
```

    ## [1] "player"   "position" "salary"   "points"   "ppg"      "rooky"   
    ## [7] "weight"

By the way: this way of changing the name of a variable is very low level, and probably unfamiliar to most useRs.

### Moving a column

A more challenging operation is when you want to move a column to a different position. What if you want to move `salary` to the last position (last column)? One option is to create a vector of column names in the desired order, and then use this vector (for the index of columns) to reassign the data frame like this:

``` r
reordered_names <- c("player", "position", "points", "ppg", "rooky", "weight", "salary")

# moving salary at the end
tbl <- tbl[ ,reordered_names]
tbl
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16663575
    ## 2    Curry       PG   1999 25.3 FALSE    190 12112359
    ## 3    Green       PF    776 10.2 FALSE    230 15330435
    ## 4   Durant       SF   1555 25.1 FALSE    240 26540100
    ## 5 Pachulia        C    426  6.1 FALSE    270  2898000

### Transforming a column

A more common operation than deleting or moving a column, is to transform the values in a column. This can be easily accomplished with the `$` operator. For instance, let's say that we want to transform `salary` from dollars to millions of dollars:

``` r
# converting salary in millions of dollars
tbl$salary <- tbl$salary / 1000000
tbl
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE    190 12.11236
    ## 3    Green       PF    776 10.2 FALSE    230 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE    240 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE    270  2.89800

Likewise, instead of using the `$` operator, you can refer to the column using bracket notation. Here's how to transform weight from pounds to kilograms (1 pound = 0.453592 kilograms):

``` r
# weight in kilograms
tbl[ ,"weight"] <- tbl[ ,"weight"] * 0.453592
tbl
```

    ##     player position points  ppg rooky    weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE  97.52228 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE  86.18248 12.11236
    ## 3    Green       PF    776 10.2 FALSE 104.32616 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE 108.86208 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE 122.46984  2.89800

There is also the `transform()` function which transform values *interactively*, that is, temporarily:

``` r
# transform weight to inches
transform(tbl, weight = weight / 0.453592)
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE    190 12.11236
    ## 3    Green       PF    776 10.2 FALSE    230 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE    240 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE    270  2.89800

`transform()` does its job of modifying the values of `weight` but only temporarily; if you inspect `tbl` you'll see what this means:

``` r
# did weight really change?
tbl
```

    ##     player position points  ppg rooky    weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE  97.52228 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE  86.18248 12.11236
    ## 3    Green       PF    776 10.2 FALSE 104.32616 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE 108.86208 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE 122.46984  2.89800

To make the changes permanent with `transform()`, you need to reassign them to the data frame:

``` r
# transform weight to inches (permanently)
tbl <- transform(tbl, weight = weight / 0.453592)
tbl
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE    190 12.11236
    ## 3    Green       PF    776 10.2 FALSE    230 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE    240 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE    270  2.89800
