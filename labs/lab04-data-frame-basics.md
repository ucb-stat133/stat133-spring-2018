Lab 4: Data Frame Basics
================
Gaston Sanchez

> ### Learning Objectives:
>
> -   Importing Data Tables in R
> -   Default reading-table functions
> -   R package `"readr"`
> -   Get started with data frames
> -   Understand basic operations
> -   Understand bracket and dollar notations

------------------------------------------------------------------------

Abalone Data Set
----------------

The first data set to consider is the **Abalone Data Set** that is part of the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Abalone)

The location of the data file is:

<http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data>

The location of the data dictionary (description of the data) is:

<http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.names>

Look at both the dataset file, and the file with its description, and answer the following questions:

-   What's the character delimiter?
-   Is there a row for column names?
-   Are there any missing values? If so, how are they codified?
-   What is the data type of each column?

One basic way to read this file in R is by passing the url location of the file directly to any of the `read.table()` functions:

``` r
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"
abalone <- read.table(url, sep = ",")
```

### Getting a Local Copy of the Data

My suggestion when reading datasets from the Web, is to always try to get a local copy of the data file in your machine (as long as you have enough free space to save it in your computer). To do this, you can use the function `download.file()` and specify the url address, and the name of the file that will be created in your computer. For instance, to save the abalone data file in **your working directory**, type the following commands:

``` r
# download copy
origin <- 'http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data'
destination <- 'abalone.data'
download.file(origin, destination)
```

Now that you have a local copy of the dataset, you can read it in R with `read.table()` like so:

``` r
# reading data from your working directory
abalone <- read.table("abalone.data", sep = ",")
```

Once you read a data table, you may want to start looking at its contents, usually taking a peek at a few rows. This can be done with `head()` and/or with `tail()`:

``` r
# take a peek of first rows
head(abalone)

# take a peek of last rows
tail(abalone)
```

Likewsie, you may also want to examine how R has decided to take care of the storage details (what data type is used for each column?). Use the function `str()` to check the structure of the data frame:

``` r
# check data frame's structure
str(abalone, vec.len = 1)
```

### Detailed information about the columns

So far we have been able to read the data file in R. But we are missing a few things. First, we don't have names for the columns. Second, it would be nice if we could specify the data types of each column instead of letting R guess how to handle each data type.

According to the description of the Abalone data set, we can assign the following data types to each of the columns as:

| Name           | Data Type  |
|----------------|------------|
| Sex            | character  |
| Length         | continuous |
| Diameter       | continuous |
| Height         | continuous |
| Whole weight   | continuous |
| Shucked weight | continuous |
| Viscera weight | continuous |
| Shell weight   | continuous |
| Rings          | integer    |

Let's create a vector of columns names, and another vector of data types:

``` r
# vector of column names
column_names <- c(
    'sex',
    'length',
    'diameter',
    'height',
    'whole_weight',
    'shucked_weight',
    'viscera_weight',
    'shell_weight',
    'rings'
)

# vector of data types (for each column)
column_types <- c(
    'character',
    'real',
    'real',
    'real',
    'real',
    'real',
    'real',
    'real',
    'integer'   
)
```

Optionally, we could also specify a type "factor" for the variable `sex` since this is supposed to be in nominal scale (i.e. it is a categorical variable). Also note that the variable `rings` is supposed to be integers, therefore we can choose an `integer` vector for this column.

Now we can re-read the table in a more complete (and usually more efficient) way:

``` r
abalone <- read.table(
    'abalone.data',
    col.names = column_names,
    colClasses = column_types,
    sep = ","
)

# check its structure again
str(abalone, vec.len = 1)
```

### Your turn

-   Read the Abalone data with the `read.csv()` function.
-   Use the inputs `col.names` and `colClasses` to specify column names and their data types.
-   Look at the data description in the following link:

<http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.names> and confirm the following statistics:

           Length Diam  Height  Whole  Shucked  Viscera    Shell    Rings
    Min    0.075  0.055 0.000   0.002    0.001    0.001    0.002        1
    Max    0.815  0.650 1.130   2.826    1.488    0.760    1.005       29
    Mean   0.524  0.408 0.140   0.829    0.359    0.181    0.239    9.934
    SD     0.120  0.099 0.042   0.490    0.222    0.110    0.139    3.224

Import Abalone data with `read_csv()`
-------------------------------------

In addition to the built-in functions for importing tables in R, there is also the set of functions from the R package `"readr"`:

-   `read_delim()`
-   `read_csv()`
-   `read_tsv()`
-   `read_csv2()`
-   `read_fwf()`
-   `read_table()`

Take a look at this post for some examples:

<https://blog.rstudio.com/2015/04/09/readr-0-1-0/>

-   Use `read_csv()` to import the abalone data set.
-   Use the argument `col_names` to specify the column names.
-   Learn how to use the argument `col_types` to specify the data type for each column.

------------------------------------------------------------------------

Pittsburgh Bridges Data Set
---------------------------

This data set is part of the UCI Machine Learning Repository:

<http://archive.ics.uci.edu/ml/datasets/Pittsburgh+Bridges>

The data Description is here:

<http://archive.ics.uci.edu/ml/machine-learning-databases/bridges/bridges.names>

The Data file is here:

<http://archive.ics.uci.edu/ml/machine-learning-databases/bridges/bridges.data.version1>

Read the description, and take a look at the data set:

-   Are there column names?
-   What is the field separator?
-   Are there any missing values?
-   What is the character for missing values (if any)?
-   What is the data type of each variable (i.e. column)?
-   Download a copy of the data to your computer (use `download.file()`) and save it in a file named `bridges.data`

### Reading the Data

-   Create a vector of column names
-   Create a vector of column types
-   Use the function `read.table()` to import the data. Name it `bridges1`.
-   Use the function `read.csv()` to import the data. Name it `bridges2`.
-   How would you specify the argument `colClasses` to import just the first five columns? (check the documentation of `?read.table`). Name this data frame `bridges3`.

### Basic Inspection

Use functions to start examining the `bridges1` data frame:

-   `str()`
-   `summary()`
-   `head()` and `tail()`
-   `dim()`
-   `names()`
-   `colnames()`
-   `nrow()`
-   `ncol()`

### Optional: Want to do more?

Write R code to find:

-   Year of the oldest erected bridge
-   Year of the most recent erected bridge
-   Frequency of bridges by purpose
-   Frequency of materials
-   Average length of the bridges

------------------------------------------------------------------------

Creating Data Frames
--------------------

Here's a table with the starting lineup of the Golden State Warriors:

| Player   | Position | Salary     | Points | PPG  | Rookie |
|----------|----------|------------|--------|------|--------|
| Thompson | SG       | 16,663,575 | 1742   | 22.3 | FALSE  |
| Curry    | PG       | 12,112,359 | 1999   | 25.3 | FALSE  |
| Green    | PF       | 15,330,435 | 776    | 10.2 | FALSE  |
| Durant   | SF       | 26,540,100 | 1555   | 25.1 | FALSE  |
| Pachulia | C        | 2,898,000  | 426    | 6.1  | FALSE  |

-   Start by creating vectors for each of the columns.
-   Use the vectors to create a first data frame with `data.frame()`.
-   Check that this data frame is of class `"data.frame"`, and that it is also a list.
-   Create another data frame by first starting with a `list()`, and then passing the list to `data.frame()`.
-   What would you do to obtain a data frame such that when you check its structure `str()` the variables are:
    -   *Player* as character
    -   *Position* as factor
    -   *Salary* as numeric or real (ignore the commas)
    -   *Points* as integer
    -   *PPG* as numeric or real
    -   *Rookie* as logical
-   Find out how to use the *column binding* function `cbind()` to create a tabular object with the vectors created in step 1 (inspect what class of object is obtained with `cbind()`).
-   How could you convert the object in the previous step into a data frame?

------------------------------------------------------------------------

NBA Players Data
----------------

Now that you've seen some of the most basic operations to manipulate data frames, let's apply them on a data set about NBA players. The corresponding data file is `nba2017-players.csv`, located in the `data/` folder of the course github repository. This file contains 15 variables measured on 441 players.

First download a copy of the csv file to your computer.

``` r
# download csv file into your working directory
csv <- "https://github.com/ucb-stat133/stat133-fall-2017/raw/master/data/nba2017-players.csv"
download.file(url = csv, destfile = 'nba2017-players.csv')
```

To import the data in R you can use the function `read.csv()`:

``` r
dat <- read.csv('nba2017-players.csv', stringsAsFactors = FALSE)
```

Notice that I'm specifying the argument `stringsAsFactors = FALSE` to avoid the conversion of characters into R factors. Why do you think this is a good practice?

All the default reading table functions generate a data frame. Typically, everytime I read a new data set which I'm not familiar with, or a data set that I haven't worked on in a long time, I always like to call a couple of functions to inspect its contents:

-   `dim()`
-   `head()`
-   `tail()`
-   `str()`
-   `summary()`

A first check-up is to examine the dimensions of the data frame with `dim()`:

``` r
# dimensions (# of rows, # of columns)
dim(dat)
```

    ## [1] 441  15

If you know in advanced how many rows and columns are in the data table, this is a good way to make sure that R was able to read all the records.

Then, depending on the size of the data, you may want to take a peek at its contents with `head()` or `tail()`, just to get an idea of what the data looks like:

``` r
# display first few rows
head(dat)
```

    ##              player team position height weight age experience
    ## 1        Al Horford  BOS        C     82    245  30          9
    ## 2      Amir Johnson  BOS       PF     81    240  29         11
    ## 3     Avery Bradley  BOS       SG     74    180  26          6
    ## 4 Demetrius Jackson  BOS       PG     73    201  22          0
    ## 5      Gerald Green  BOS       SF     79    205  31          9
    ## 6     Isaiah Thomas  BOS       PG     69    185  27          5
    ##                         college   salary games minutes points points3
    ## 1         University of Florida 26540100    68    2193    952      86
    ## 2                               12000000    80    1608    520      27
    ## 3 University of Texas at Austin  8269663    55    1835    894     108
    ## 4      University of Notre Dame  1450000     5      17     10       1
    ## 5                                1410598    47     538    262      39
    ## 6      University of Washington  6587132    76    2569   2199     245
    ##   points2 points1
    ## 1     293     108
    ## 2     186      67
    ## 3     251      68
    ## 4       2       3
    ## 5      56      33
    ## 6     437     590

For a more detailed description of how R is treating the data type in each column, you should use the structure function `str()`.

``` r
# check the structure
str(dat, vec.len = 1)
```

    ## 'data.frame':    441 obs. of  15 variables:
    ##  $ player    : chr  "Al Horford" ...
    ##  $ team      : chr  "BOS" ...
    ##  $ position  : chr  "C" ...
    ##  $ height    : int  82 81 ...
    ##  $ weight    : int  245 240 ...
    ##  $ age       : int  30 29 ...
    ##  $ experience: int  9 11 ...
    ##  $ college   : chr  "University of Florida" ...
    ##  $ salary    : num  26540100 ...
    ##  $ games     : int  68 80 ...
    ##  $ minutes   : int  2193 1608 ...
    ##  $ points    : int  952 520 ...
    ##  $ points3   : int  86 27 ...
    ##  $ points2   : int  293 186 ...
    ##  $ points1   : int  108 67 ...

This function `str()` displays the dimensions of the data frame, and then a list with the name of all the variables, and their data types (e.g. `chr` character, `num` real, etc). The argument `vec.len = 1` indicates that just the first element in each column should be displayed.

When working with data frames, remember to always take some time inspecting the contents, and checking how R is handling the data types. It is in these early stages of data exploration that you can catch potential issues in order to avoid disastrous consequences or bugs in subsequent stages.

------------------------------------------------------------------------

### Your turn:

Use bracket notation, the dollar operator, as well as concepts of logical subsetting and indexing to:

-   Display the last 5 rows of the data.

-   Display those rows associated to players having height less than 70 inches tall.

-   Of those players that are centers (position `C`), display their names and salaries.

-   Create a data frame `durant` with Kevin Durant's information (i.e. row).

-   Create a data frame `ucla` with the data of players from college UCLA ("University of California, Los Angeles").

-   Create a data frame `rookies` with those players with 0 years of experience.

-   Create a data frame `rookie_centers` with the data of Center rookie players.

-   Create a data frame `top_players` for players with more than 50 games and more than 100 minutes played.

-   What's the largest height value?

-   What's the minimum height value?

-   What's the overall average height?

-   Who is the tallest player?

-   Who is the shortest player?

-   Which are the unique teams?

-   How many different teams?

-   Who is the oldest player?

-   What is the median salary of all players?

-   What is the median salary of the players with 10 years of experience or more?

-   What is the median salary of Shooting Guards (SG) and Point Guards (PG)?

-   What is the median salary of Power Forwards (PF), 29 years or older, and 74 inches tall or less?

-   How many players scored 4 points or less?

-   Who are those players who scored 4 points or less?

-   Who is the player with 0 points?

-   How many players are from "University of California, Berkeley"?

-   Are there any players from "University of Notre Dame"? If so how many and who are they?

-   Are there any players with weight greater than 260 pounds? If so how many and who are they?

-   How many players did not attend a college in the US?

-   Who is the player with the maximum rate of points per minute?

-   Who is the player with the maximum rate of three-points per minute?

-   Who is the player with the maximum rate of two-points per minute?

-   Who is the player with the maximum rate of one-points (free-throws) per minute?

-   Create a data frame `gsw` with the name, height, weight of Golden State Warriors (GSW)

-   Display the data in `gsw` sorted by height in increasing order (hint: see `?sort` and `?order`)

-   Display the data in gsw by weight in decreasing order (hint: see `?sort` and `?order`)

-   Display the player name, team, and salary, of the top 5 highest-paid players (hint: see `?sort` and `?order`)

-   Display the player name, team, and points3, of the top 10 three-point players (hint: see `?sort` and `?order`)

Group By
--------

Group-by operations are very common in data analytics. Without dedicated functions, these operations tend to be very hard (labor intensive).

**Quick try**: Using just bracket notation, try to create a data frame with two columns: the team name, and the team payroll (addition of all player salaries).

So what functions can you use in R to perform group by operations? In base R, the main function for group-by operations is `aggregate()`.

Here's an example using `aggregate()` to get the median salary, grouped by team:

``` r
aggregate(dat$salary, by = list(dat$team), FUN = median)
```

    ##    Group.1       x
    ## 1      ATL 3279291
    ## 2      BOS 4743000
    ## 3      BRK 1790902
    ## 4      CHI 2112480
    ## 5      CHO 6000000
    ## 6      CLE 5239437
    ## 7      DAL 2898000
    ## 8      DEN 3500000
    ## 9      DET 4625000
    ## 10     GSW 1551659
    ## 11     HOU 1508400
    ## 12     IND 4000000
    ## 13     LAC 3500000
    ## 14     LAL 5281680
    ## 15     MEM 3332940
    ## 16     MIA 3449000
    ## 17     MIL 4184870
    ## 18     MIN 3650000
    ## 19     NOP 3789125
    ## 20     NYK 2898000
    ## 21     OKC 3140517
    ## 22     ORL 5000000
    ## 23     PHI 2318280
    ## 24     PHO 2941440
    ## 25     POR 4943123
    ## 26     SAC 5200000
    ## 27     SAS 2898000
    ## 28     TOR 5300000
    ## 29     UTA 2433334
    ## 30     WAS 4365326

The same example above can also be obtained with `aggreagte()` using formula notation like this:

``` r
aggregate(salary ~ team, data = dat, FUN = median)
```

    ##    team  salary
    ## 1   ATL 3279291
    ## 2   BOS 4743000
    ## 3   BRK 1790902
    ## 4   CHI 2112480
    ## 5   CHO 6000000
    ## 6   CLE 5239437
    ## 7   DAL 2898000
    ## 8   DEN 3500000
    ## 9   DET 4625000
    ## 10  GSW 1551659
    ## 11  HOU 1508400
    ## 12  IND 4000000
    ## 13  LAC 3500000
    ## 14  LAL 5281680
    ## 15  MEM 3332940
    ## 16  MIA 3449000
    ## 17  MIL 4184870
    ## 18  MIN 3650000
    ## 19  NOP 3789125
    ## 20  NYK 2898000
    ## 21  OKC 3140517
    ## 22  ORL 5000000
    ## 23  PHI 2318280
    ## 24  PHO 2941440
    ## 25  POR 4943123
    ## 26  SAC 5200000
    ## 27  SAS 2898000
    ## 28  TOR 5300000
    ## 29  UTA 2433334
    ## 30  WAS 4365326

Here's another example using `aggregate()` to get the average height and average weight, grouped by position:

``` r
aggregate(dat[ ,c('height', 'weight')], by = list(dat$position), FUN = mean)
```

    ##   Group.1   height   weight
    ## 1       C 83.25843 250.7978
    ## 2      PF 81.50562 235.8539
    ## 3      PG 74.30588 188.5765
    ## 4      SF 79.63855 220.4699
    ## 5      SG 77.02105 204.7684

The same example above can also be obtained with `aggreagte()` using formula notation like this:

``` r
aggregate(. ~ position, data = dat[ ,c('position', 'height', 'weight')],
          FUN = mean)
```

    ##   position   height   weight
    ## 1        C 83.25843 250.7978
    ## 2       PF 81.50562 235.8539
    ## 3       PG 74.30588 188.5765
    ## 4       SF 79.63855 220.4699
    ## 5       SG 77.02105 204.7684

### Your turn

-   Create a data frame with the average height, average weight, and average age, grouped by position

-   Create a data frame with the average height, average weight, and average age, grouped by team

-   Create a data frame with the average height, average weight, and average age, grouped by team and position.

-   Difficult: Create a data frame with the minimum salary, median salary, mean salary, and maximum salary, grouped by team and position.

------------------------------------------------------------------------
