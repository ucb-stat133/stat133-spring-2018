# Syllabus, Stat 133

- __Notes__:
    + Tentative calendar (weekly topics), subject to changes depending on 
    the pace of the course.
    + Lecture (:file_folder:) involves supporting material discussed in class.
    + Vitamins (:book:) involve coding examples that you should practice on your own.
    + Reading (:newspaper:) is material that you should review on your own.


-----


## 0. Course Introduction

- :card_index: __Dates__: Jan 17-19
- :paperclip: __Topics__: Introduction, policies/logistics, and course in a nutshell.
- :file_folder: __Notes__:
    + [About the Course](../slides/00-about-course.pdf) (slides)
    + [Introduction: Big Picture](../slides/01-big-picture.pdf) (slides)
- :book: __Reading__:
    + [Course policies](policies.md), and [FAQs](faqs.md)
- :microscope: __Lab__: No lab
- :newspaper: __Misc__:
    + [What is Data Science?](../papers/what-is-data-science.pdf)
- :speaker: __To Do__: 
    + Install [__R__](https://cran.cnr.berkeley.edu/) 
    + Install [RStudio](https://www.rstudio.com/products/rstudio/download/#download) Desktop (open source version, free)


-----


## 1. R Survival Skills

- :card_index: __Dates__: Jan 22-26
- :paperclip: __Topics__: "Mise en place" for data analysis projects, getting started with R, overall review of the RStudio workspace.
- :file_folder: __Notes__:
    + Before you start: "Mise en place"
    + [First contact with R](../tutorials/01-intro-to-R.md) (tutorial)
    + [Intro to Rmd files](../tutorials/02-intro-to-Rmd-files.md) (tutorial)
- :book: __Reading__:
    + [www.markdowntutorial.com](http://www.markdowntutorial.com)
    + [Markdown tutorial](http://commonmark.org/help/tutorial) by CommonMark
- :microscope: __Lab__:
    + [Getting started with R and RStudio](../labs/lab01-R-basics.md)
- :newspaper: __Misc__:
    + [Introduction to R Markdown](http://rmarkdown.rstudio.com/lesson-1.html) by RStudio
- :bulb: __Cheat sheet__: 
    + [RStudio cheat sheet](../cheatsheets/rstudio-IDE-cheatsheet.pdf)
    + [R markdown cheat sheet](../cheatsheets/rmarkdown-cheatsheet-2.0.pdf)
- :dart: __WARM-UP 1__:
    + [Markdown practice](../hws/up01-markdown.pdf) (due Feb-02)


-----


## 2. Data Types, Vectors, Arrays, and Lists

- :card_index: __Dates__: Jan 29-Feb 02
- :paperclip: __Topics__: Getting to know R vectors and concepts like atomicity, vectorization, recycling, and subsetting.
- :file_folder: __Notes__:
    + [Data Types and Vectors](../slides/03-R-vector-types.pdf) (slides)
    + [Arrays and Factors](../slides/04-arrays-factors.pdf) (slides)
    + [Base Graphics](../slides/05-base-graphics.pdf) (slides)
- :book: __Reading__:
    + [Intro to vectors](../tutorials/03-intro-to-vectors.md) (tutorial)
- :microscope: __Lab__:
    + [Getting started with vectors, factors, and lists](../labs/lab02-vector-basics.md)
- :newspaper: __Misc__:
    + [chapter 20: Vectors](http://r4ds.had.co.nz/vectors.html) from _R for Data Science_ (by Grolemund and Wickham)
- :bulb: __Cheat sheet__: 
    + [Base R](../cheatsheets/base-r-cheatsheet.pdf)
- :dart: __WARM-UP 2__:
    + [Vectors and Factors](../hws/up02-vector-basics.pdf) (due Feb-09)


-----


## 3. Housekeeping: Filesystem, Bash, Git, Github

- :card_index: __Dates__: Feb 05-09
- :paperclip: __Topics__: Fundamental low-level stuff for the rest of the course.
- :file_folder: __Notes__:
    + [Lists](../slides/05-lists.pdf) (slides)
    + [Filesystem Basics](../slides/06-filesystem-basics.pdf) (slides)
    + [Shell Basics](../slides/07-shell-basics.pdf) (slides)
    + [Git Basics](../slides/08-git-basics.pdf) (slides)
- :book: __Reading__:
    + [The Unix Shell](http://swcarpentry.github.io/shell-novice/) lessons 1-3 (by Software Carpentry)
    + [Linux Tutorial](https://ryanstutorials.net/linuxtutorial/) lessons 1-5 (by Ryan Chadwick)
- :microscope: __Lab__:
    + [Command Line Basics](../labs/lab03-command-line-basics.md)
- :newspaper: __Misc__:
    + Read sections 4 to 9 in Part I [Installation](http://happygitwithr.com/installation-pain.html) from _Happy Git and GitHub for the useR_ by Jenny Bryan et al.
- :bulb: __Cheat sheet__:
    + [command line cheat sheet](../cheatsheets/command-line-cheatsheet.pdf)
    + [git cheat sheet](../cheatsheets/git-cheatsheet.pdf)


-----


## 4. Basics of Tabular Data, and PCA

- :card_index: __Dates__: Feb 12-16
- :paperclip: __Topics__: Data Tables, typical storage formats, and relation with data frames.
- :file_folder: __Notes__:
    + [Data Tables](../slides/09-data-tables.pdf) (slides)
    + [Importing Tables in R](../slides/10-importing-tables.pdf) (slides)
    + [Principal Component Analysis](../tutorials/06-principal-components.md) (tutorial)
- :book: __Reading__:
    + [Basic manipulation of Data Frames](../slides/11-data-frame-basics.pdf) (slides)
- :microscope: __Lab__:
    + [Getting started with data frames](../labs/lab04-data-frame-basics.md)
- :newspaper: __Misc__:
    + [Organizing data in spreadsheets](http://kbroman.org/dataorg/) by Karl Broman
- :bulb: __Cheat sheet__:
    + [Data import cheat sheet](../cheat-sheets/data-import-cheatsheet.pdf)
- :dart: __HW 1__: due Feb-23
    + More Vectors (coming soon)


-----


## 5. Wrangling and Exploring Tables

- :card_index: __Dates__: Feb 19-23 _(Holiday Feb-19)_
- :paperclip: __Topics__: Data wrangling (reshaping, aggregating) with `"dplyr"`, and 
graphs with `"ggplot2"`.
- :file_folder: __Notes__:
    + [Introduction to the R package `"dplyr"`](../slides/12-dplyr-introduction.pdf) (slides by Hadley Wickham)
    + [Introduction to `"dplyr"`](../tutorials/05-intro-to-dplyr.md) (tutorial)
    + [Introduction to the R package `"ggplot2"`](../slides/13-grammar-graphics.pdf) (slides)
- :book: __Reading__:
    + ["ggplot2" lecture](../slides/14-ggplot-lecture.pdf) (slides by Karthik Ram)
- :microscope: __Lab__:
    + [Getting started with dplyr and ggplot2](../labs/lab05-dplyr-ggplot-basics.md)
- :newspaper: __Misc__:
    + [Introduction to dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html) introductory vignette by Hadley Wickham
- :bulb: __Cheat sheet__:
    + [Data transformation cheat sheet](../cheat-sheets/data-transformation-cheatsheet.pdf)
    + [Data visualization with ggplot2](../cheat-sheets/ggplot2-cheatsheet-2.1.pdf)


-----


## 6. Programming Basics for data analysis (part 1)

- :card_index: __Dates__: Feb 26-Mar 02
- :paperclip: __Topics__: Basics of Functions, R expressions, and conditionals.
- :file_folder: __Notes__:
    + [Introduction to functions](../tutorials/06-intro-to-functions.md) (tutorial)
    + [Introduction to R expressions and conditionals](../tutorials/07-intro-to-expressions-conditionals.md) (tutorial)
- :microscope: __Lab__:
    + [Getting started with functions and conditionals](../labs/lab06-simple-functions.md)
- :newspaper: __Misc__: 
    + [chapter 19: Functions](http://r4ds.had.co.nz/functions.html) from _R for Data Science_ (by Grolemund and Wickham)


-----


## 7. Programming Basics for data analysis (part 2)

- :card_index: __Dates__: Mar 05-09
- :paperclip: __Topics__: Basics of loops, and more functions.
- :file_folder: __Notes__:
    + [Introduction to loops](../tutorials/08-intro-to-loops.md) (tutorial)
    + [More about functions](../tutorials/09-more-functions.md) (tutorial)
- :microscope: __Lab__: 
    + [Getting started with loops](../labs/lab07-simple-loops.md)
- :newspaper: __Misc__:
    + [chapter 21: Iteration](http://r4ds.had.co.nz/iteration.html) from _R for Data Science_ (by Grolemund and Wickham)
- :mortar_board: __MIDTERM 1__: Friday Mar-09


-----


## 8. Manipulating Character Strings and Testing Functions

- :card_index: __Dates__: Mar 12-16
- :paperclip: __Topics__: Introduction to character strings, basic manipulation of strings, 
and testing functions.
- :file_folder: __Notes__:
    + [String Basics](../slides/17-strings-basics.pdf) (slides)
    + [Intro to Strings](../tutorials/12-intro-to-strings.md) (tutorial)
    + [Getting started with testing](../papers/testthat-wickham.pdf) by Wickham
- :book: __Reading__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) (by Sanchez)
- :microscope: __Lab__: 
    + [Getting started with strings](../labs/lab08-strings-basics.md)
- :newspaper: __Misc__:
    + [chapter 14: Strings](http://r4ds.had.co.nz/strings.html) from _R for Data Science_ (by Grolemund and Wickham)


-----


## 9. Regular Expressions

- :card_index: __Dates__: Mar 19-23
- :paperclip:  __Topics__: Introduction to Regular Expressions.
- :file_folder: __Notes__:
    + [Introduction to regular expressions](../tutorials/13-intro-to-regex.md)
    + [Regexpal](http://regexpal.com.s3-website-us-east-1.amazonaws.com/) tester tool.
- :book: __Reading__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) (by Sanchez)
- :microscope: __Lab__:
    + TBD
+ __Misc__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) (by Sanchez)
- :bulb: __Cheat sheet__:
    + [Regular Expressions cheat sheet](../cheat-sheets/regular-expressions-cheatsheet.pdf)


-----


## 10. Spring Break

- :card_index: __Dates__: Mar 26-30
- :battery: (Re)charge your batteries!


-----


## 11. Random Numbers and Simulations

- :card_index: __Dates__: Apr 02-06
- :paperclip: __Topics__: TBD
- :file_folder: __Notes__:


-----


## 12. Shiny Apps

- :card_index: __Dates__: Apr 09-13
- :paperclip: __Topics__: TBD
- :file_folder: __Notes__:


-----


## 13. R packaging

- :card_index: __Dates__: Apr 16-20
- :paperclip: __Topics__: TBD
- :file_folder: __Notes__:


-----


## 14. R Packaging

- :card_index: __Dates__: Apr 23-27
- :paperclip: __Topics__: TBD
- :file_folder: __Notes__:


-----


## 15. RRR Week

- :card_index: __Dates__: Apr 30-May 04
- :paperclip: __Topics__: Prepare for final examination
- :file_folder: __Notes__:
    + No lecture. Instructor will hold OH (in 309 Evans)
- :mortar_board: __FINAL__: TBA


-----
