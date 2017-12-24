# Syllabus, Stat 133

- __Notes__:
    + Tentative calendar (weekly topics), subject to changes depending on 
    the pace of the course.
    + Vitamins (:pill:) involve coding examples that you should practice on your own.
    + Reading (:books:) is material that you should review on your own.
    + Lecture (:book:) involves supporting material discussed in class.


-----


## 0. Course Introduction

- :calendar: __Dates__: Jan 17-19
- :pushpin: __Topics__: Introduction, policies/logistics, and course in a nutshell.
- :book: __Lecture__:
    + [About the Course](../slides/00-about-course.pdf) (slides)
    + [Introduction: Big Picture](../slides/01-big-picture.pdf) (slides)
- :microscope: __Lab__: No lab
- :books: __Reading__:
    + [Course policies](policies.md), and [FAQs](faqs.md)
    + [What is Data Science?](../papers/what-is-data-science.pdf)
- :speaker: __To Do__: 
    + Install [__R__](https://cran.cnr.berkeley.edu/) 
    + Install [RStudio](https://www.rstudio.com/products/rstudio/download/#download) Desktop (open source version, free)


-----


## 1. R Survival Skills

- :calendar: __Dates__: Jan 22-26:
- :pushpin: __Topics__: "Mise en place" for data analysis projects, getting started with R, overall review of the RStudio workspace.
- :book: __Lecture__:
    + Before you start: "Mise en place"
    + [First contact with R](../tutorials/01-intro-to-R.md) (tutorial)
    + [Intro to Rmd files](../tutorials/02-intro-to-Rmd-files.md) (tutorial)
- :microscope: __Lab__:
    + [Getting started with R and RStudio](../labs/lab01-R-basics.md)
- :books: __Reading__:
    + [Introduction to R Markdown](http://rmarkdown.rstudio.com/lesson-1.html) by RStudio
- :pill: __Vitamins__:
    + [www.markdowntutorial.com](http://www.markdowntutorial.com)
    + [Markdown tutorial](http://commonmark.org/help/tutorial) by CommonMark
- :mag: __Cheat sheet__: 
    + [RStudio cheat sheet](../cheatsheets/rstudio-IDE-cheatsheet.pdf)
    + [R markdown cheat sheet](../cheatsheets/rmarkdown-cheatsheet-2.0.pdf)
- :large_blue_circle: __WARM-UP 1__:
    + [Markdown practice](../hws/up01-markdown.md) (due Feb-02)


-----


## 2. Data Types, Vectors, Arrays, and Lists

- :calendar: __Dates__: Jan 29-Feb 02
- :pushpin: __Topics__: Getting to know R vectors and concepts like atomicity, vectorization, recycling, and subsetting.
- :book: __Lecture__:
    + [Data Types and Vectors](../slides/03-R-vector-types.pdf) (slides)
    + [Arrays and Factors](../slides/04-arrays-factors.pdf) (slides)
    + [Lists](../slides/05-lists.pdf) (slides)
- :microscope: __Lab__:
    + [Getting started with vectors, factors, and lists](../labs/lab02-vector-basics.md)
- :books: __Reading__:
    + [chapter 20: Vectors](http://r4ds.had.co.nz/vectors.html) from _R for Data Science_ by Grolemund and Wickham.
- :pill: __Vitamins__:
    + [Intro to vectors](../tutorials/03-intro-to-vectors.md) (tutorial)
    + [Arrays and Factors](../slides/04-arrays-factors.pdf) (slides)
- :mag: __Cheat sheet__: 
    + [Base R](../cheatsheets/base-r-cheatsheet.pdf)
- :large_blue_circle: __WARM-UP 2__:
    + [Vectors and Factors](../hws/up02-vector-basics.md) (due Feb-09)


-----


## 3. Housekeeping: Filesystem, Bash, Git, Github

- :calendar: __Dates__: Feb 05-09
- :pushpin: __Topics__: Fundamental low-level stuff for the rest of the course.
- :book: __Lecture__:
    + [Filesystem Basics](../slides/06-filesystem-basics.pdf) (slides)
    + [Shell Basics](../slides/07-shell-basics.pdf) (slides)
    + [Git Basics](../slides/08-git-basics.pdf) (slides)
- :microscope: __Lab__:
    + [Command Line Basics](../labs/lab03-command-line-basics.md)
- :books: __Reading__:
    + Read sections 4 to 9 in Part I [Installation](http://happygitwithr.com/installation-pain.html) from _Happy Git and GitHub for the useR_ by Jenny Bryan et al.
- :pill: __Vitamins__:
    + [The Unix Shell](http://swcarpentry.github.io/shell-novice/) lessons 1-3 (by Software Carpentry).
    + [Linux Tutorial](https://ryanstutorials.net/linuxtutorial/) lessons 1-5 (by Ryan Chadwick).
- :mag: __Cheat sheet__:
    + [command line cheat sheet](../cheatsheets/command-line-cheatsheet.pdf)
    + [git cheat sheet](../cheatsheets/git-cheatsheet.pdf)


-----


## 4. Basics of Tabular Data

- :calendar: __Dates__: Feb 12-16
- :pushpin: __Topics__: Data Tables, typical storage formats, and relation with data frames.
- :book: __Lecture__:
    + [Data Tables](../slides/09-data-tables.pdf) (slides)
    + [Importing Tables in R](../slides/10-importing-tables.pdf) (slides)
    + [Data Frames](../slides/11-data-frame-basics.pdf) (slides)
- :microscope: __Lab__:
    + [Basic manipulation of data frames](../labs/lab04-data-frame-basics.md)
- :books: __Reading__:
    + [Organizing data in spreadsheets](http://kbroman.org/dataorg/) by Karl Broman
- :mag: __Cheat sheet__:
    + [Data import cheat sheet](../cheat-sheets/data-import-cheatsheet.pdf)
- :large_blue_circle: __HW 1__: due Feb-23
    + [More Vectors](../hws/hw01-more-vectors.pdf)
 

-----


## 5. Wrangling and Exploring Tables (part 1)

- :calendar: __Dates__: Feb 19-23 _(Holiday Feb-19)_
- :pushpin: __Topics__: Data wrangling (reshaping, aggregating) with `"dplyr"`, and 
graphs with `"ggplot2"`.
- :book: __Lecture__:
    + [Introduction to the R package `"dplyr"`](../slides/12-dplyr-introduction.pdf) (slides by Hadley Wickham)
    + [Introduction to `"dplyr"`](../tutorials/05-intro-to-dplyr.md) (tutorial)
    + [Introduction to the R package `"ggplot2"`](../slides/13-grammar-graphics.pdf) (slides)
    + ["ggplot2" lecture](../slides/14-ggplot-lecture.pdf) (slides by Karthik Ram)
- :microscope: __Lab__:
    + [Getting started with dplyr and ggplot2](../labs/lab05-dplyr-ggplot-basics.md)
- :books: __Reading__:
    + [Introduction to dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html) introductory vignette by Hadley Wickham
- :mag: __Cheat sheet__:
    + [Data transformation cheat sheet](../cheat-sheets/data-transformation-cheatsheet.pdf)
    + [Data visualization with ggplot2](../cheat-sheets/ggplot2-cheatsheet-2.1.pdf)


-----


## 6. More Wrangling, Graphics (part 2) and PCA

- :calendar: __Dates__: Feb 26-Mar 02
- :pushpin: __Topics__: More `"dplyr"`, `"ggplot2"`, and file structure
- :book: __Lecture__:
    + Data pipelines in `"dplyr"`
    + [Mini project](https://docs.google.com/presentation/d/e/2PACX-1vTMRMIlfZM01jAzaEyrbdar-Qxqips_KZii5hM7Ef90h1gMcDL4APl5LpCYlIQGoBEJNUL6CFrXHckp/pub?start=false&loop=false&delayms=3000) (slides)
    + [Introduction to PCA](../slides/15-principal-components1.pdf) (slides) and live demo.
+ :microscope: __Lab__:
    + [More dplyr, ggplot2, and files' stuff](../labs/lab06-more-dplyr-ggplot.md)
+ :books: __Reading__: 
    + [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) by Hadley Wickham.


