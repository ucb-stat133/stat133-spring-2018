## Coin Tossing

This shiny app simulates tossing a coin, and visualizing the frequency of `heads`


## Running the app

Assuming that you have both R and RStudio, the other thing you need is the R package `"shiny"`. In case of doubt, run:

```R
install.packages("shiny")
```

The easiest way to run an app is with the `runGitHub()` function from the `"shiny"` package. 

```R
library(shiny)

# Run an app from a subdirectory in the repo
runGitHub("stat133-spring-2018", "ucb-stat133", subdir = "apps/coin-toss")
```
