# Syllabus, Stat 133

- __Notes__:
    + Tentative calendar (weekly topics), subject to changes depending on 
    the pace of the course.
    + Notes (:file_folder:) involves material discussed in class.
    + Reading (:book:) involves material that expands lecture topics, as well as coding examples that you should practice on your own.
    + Misc (:newspaper:) is supporting material that is worth taking a look at.


-----


## 0. Course Introduction

- :card_index: __Dates__: Jan 17-19
- :paperclip: __Topics__: Introduction, course in a nutshell, and policies/logistics. Please spend some time outside class to review the course policies, piazza etiquette rules, as well as the FAQs.
- :file_folder: __Notes__:
    + [About the Course](../slides/00-about-course.pdf) (slides)
    + [Introduction: Big Picture](../slides/01-big-picture.pdf) (slides)
- :book: __Reading__:
    + [Course policies](policies.md)
    + [Piazza etiquette](piazza.md)
    + [FAQs](faqs.md)
- :microscope: __Lab__: No lab
- :newspaper: __Misc__:
    + [What is Data Science?](../papers/what-is-data-science.pdf)
- :speaker: __To Do__: 
    + Install [__R__](https://cran.cnr.berkeley.edu/) 
    + Install [RStudio](https://www.rstudio.com/products/rstudio/download/#download) Desktop (open source version, free)


-----


## 1. R Survival Skills, Data Types, and Vectors

- :card_index: __Dates__: Jan 22-26
- :paperclip: __Topics__: First things first, we begin with some basic survival skills for R, followed by an overall review of the RStudio workspace. Then we move on to discuss basic data types and their implementation in R around vectors. Likewise, we cover fundamental concepts like atomicity, vectorization, recycling, and subsetting.
- :file_folder: __Notes__:
    + [First contact with R](../tutorials/01-intro-to-R.md) (tutorial)
    + [Intro to Rmd files](../tutorials/02-intro-to-Rmd-files.md) (tutorial)
    + [Data Types and Vectors](../slides/03-R-vector-types.pdf) (slides)
- :book: __Reading__:
    + [www.markdowntutorial.com](http://www.markdowntutorial.com)
    + [Markdown tutorial](http://commonmark.org/help/tutorial) (by CommonMark)
- :microscope: __Lab__:
    + [Getting started with R and RStudio](../labs/lab01-R-basics.md)
- :newspaper: __Misc__:
    + [Introduction to R Markdown](http://rmarkdown.rstudio.com/lesson-1.html) (by RStudio)
- :bulb: __Cheat sheet__: 
    + [RStudio cheat sheet](../cheatsheets/rstudio-IDE-cheatsheet.pdf)
    + [R markdown cheat sheet](../cheatsheets/rmarkdown-cheatsheet-2.0.pdf)
- :dart: __WARM-UP 1__:
    + [Markdown practice](../hws/up01-markdown.pdf) (due Feb-02)


-----


## 2. Arrays, Lists, and Base Graphics

- :card_index: __Dates__: Jan 29-Feb 02
- :paperclip: __Topics__: Review of more data structures like arrays and lists. Discussion of the traditional _base_ graphics approach that is based on R vectors.
- :file_folder: __Notes__:
    + [Arrays and Factors](../slides/04-arrays-factors.pdf) (slides)
    + [Lists](../slides/05-lists.pdf) (slides)
    + [Base Graphics I](../slides/06-base-graphics1.pdf) (slides)
    + [Base Graphics II](../slides/07-base-graphics2.pdf) (slides)
- :book: __Reading__:
    + [Intro to vectors](../tutorials/03-intro-to-vectors.md) (tutorial)
- :microscope: __Lab__:
    + [Getting started with vectors and factors](../labs/lab02-vector-basics.md)
- :newspaper: __Misc__:
    + [chapter 20: Vectors](http://r4ds.had.co.nz/vectors.html) (_R for Data Science_ by Grolemund and Wickham)
- :bulb: __Cheat sheet__: 
    + [Base R](../cheatsheets/base-r-cheatsheet.pdf)
- :dart: __WARM-UP 2__:
    + [Vectors and Factors](../hws/up02-vector-basics.pdf) (due Feb-09)


-----


## 3. Housekeeping: Filesystem, Bash, Git, Github

- :card_index: __Dates__: Feb 05-09
- :paperclip: __Topics__: Data Analysis Projects (DAPs) are made of files and directories. Therefore, we need to review some fundamental concepts such as the file-system, command line, and basics of version control systems.
- :file_folder: __Notes__:
    + [Filesystem Basics](../slides/08-filesystem-basics.pdf) (slides)
    + [Shell Basics](../slides/09-shell-basics.pdf) (slides)
    + [Working with files](../slides/10-working-with-files.pdf) (slides)
    + [Git Basics](../slides/11-git-basics.pdf) (slides)
- :book: __Reading__:
    + [The Unix Shell](http://swcarpentry.github.io/shell-novice/) lessons 1-3 (by Software Carpentry)
    + [Linux Tutorial](https://ryanstutorials.net/linuxtutorial/) lessons 1-5 (by Ryan Chadwick)
- :microscope: __Lab__:
    + [Command Line Basics](../labs/lab03-command-line-basics.md)
    + [GitHub Classroom](../labs/lab03-github-classroom.pdf)
- :newspaper: __Misc__:
    + Read sections 4 to 9 in Part I [Installation](http://happygitwithr.com/installation-pain.html) (_Happy Git and GitHub for the useR_ by Jenny Bryan et al.)
- :bulb: __Cheat sheet__:
    + [command line cheat sheet](../cheatsheets/command-line-cheatsheet.pdf)
    + [git cheat sheet](../cheatsheets/git-cheatsheet.pdf)


-----


## 4. Basics of Tabular Data, and PCA

- :card_index: __Dates__: Feb 12-16
- :paperclip: __Topics__: Tables are the most common form in which data is stored, handled, and manipulated. Consequently, we need to talk about the typical storage formats of tabular data, and the relationship between tables and R data frames. In addition, we cover Principal Components Analysis (PCA) which is an unsupervised learning technique for summarizing the systematic structure of a table consisting of quantitative variables.
- :file_folder: __Notes__:
    + [Data Tables](../slides/12-data-tables.pdf) (slides)
    + [Importing Tables in R](../slides/13-importing-tables.pdf) (slides)
    + [Principal Component Analysis 1](../slides/15-principal-components1.pdf) (slides)
    + [Principal Component Analysis 2](../slides/16-principal-components2.pdf) (slides)
- :book: __Reading__:
    + [Basic manipulation of Data Frames](../slides/14-data-frame-basics.pdf) (slides)
    + [Organizing data in spreadsheets](http://kbroman.org/dataorg/) (by Karl Broman)
- :microscope: __Lab__:
    + [Getting started with data frames](../labs/lab04-data-frame-basics.md)
- :newspaper: __Misc__:
    + [Data Import](http://r4ds.had.co.nz/data-import.html) (_R for Data Science_ by Grolemund and Wickham)
- :bulb: __Cheat sheet__:
    + [Data import cheat sheet](../cheatsheets/data-import-cheatsheet.pdf)
- :dart: __HW 1__: due Feb-23
    + [Data Frame Basics](../hws/hw01-data-frame-basics.pdf)


-----


## 5. Transforming and Visualizing Tabular Data

- :card_index: __Dates__: Feb 19-23 _(Holiday Feb-19)_
- :paperclip: __Topics__: We continue reviewing manipulation of data frames with an introduction to the _data plying_ framework provided by the package `"dplyr"`. Likewise, we begin reviewing the visualization paradigm of `"ggplot2"` which is based on data frames.
- :file_folder: __Notes__:
    + ["dplyr" tutorial slides](../slides/17-dplyr-tutorial.pdf) (by Hadley Wickham)
    + [Grammar of Graphics framework](../slides/18-grammar-graphics.pdf) (slides)
- :book: __Reading__:
    + ["ggplot2" lecture](../slides/19-ggplot-lecture.pdf) (by Karthik Ram)
- :microscope: __Lab__:
    + [Getting started with dplyr and ggplot2](../labs/lab05-dplyr-ggplot-basics.md)
- :newspaper: __Misc__:
    + [tibbles vignette](https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html)
    + [Introduction to dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html) (by Hadley Wickham)
- :bulb: __Cheat sheet__:
    + [Data transformation cheat sheet](../cheatsheets/data-transformation-cheatsheet.pdf)
    + [Data visualization with ggplot2](../cheatsheets/ggplot2-cheatsheet-2.1.pdf)


-----


## 6. More Wrangling, Pipes, and Exporting Outputs

- :card_index: __Dates__: Feb 26-Mar 02
- :paperclip: __Topics__: We continue reviewing more aspects of `"dplyr"` and the famous pipe operator. 
- :file_folder: __Notes__:
    + [Pipes with `"dplyr"`](../tutorials/05-dplyr-pipes.md) (tutorial)
    + [Shell input/output redirection](../tutorials/07-shell-redirections.md) (tutorial)
    + [Shell filters](../tutorials/08-shell-filters.md) (tutorial)
- :book: __Reading__:
    + [Pipes](http://r4ds.had.co.nz/pipes.html) (_R for Data Science_ by Grolemund and Wickham)
- :microscope: __Lab__:
    + [More data wrangling, and exporting outputs](../labs/lab06-more-data-wrangling.md)
- :newspaper: __Misc__:
    + [Tidy Data](../papers/tidy-data-wickham) (by Hadley Wickham)
- :bulb: __Cheat sheet__:
    + [Data transformation cheat sheet](../cheatsheets/data-transformation-cheatsheet.pdf)
    + [Command line cheat sheet](../cheatsheets/command-line-cheatsheet.pdf)
- :dart: __HW 2__: due Mar-09
    + [Data Wrangling and visualization](../hws/hw02-shot-charts.pdf)


-----


## 7. Transition to Programming Basics for data analysis (part 1)

- :card_index: __Dates__: Mar 05-09
- :paperclip: __Topics__: You don’t need to be an expert programmer to be a data scientist, but learning more about programming allows you to automate common tasks, and solve new problems with greater ease. We'll discuss how to write basic functions, the notion of R expressions, and an introduction to conditionals. 
- :file_folder: __Notes__:
    + [Creating functions](../tutorials/09-creating-functions.md) (tutorial)
    + [Introduction to functions](../tutorials/10-intro-to-functions.md) (tutorial)
    + [Introduction to R expressions and conditionals](../tutorials/11-intro-to-expressions-conditionals.md) (tutorial)
- :microscope: __Lab__:
    + [Getting started with functions and conditionals](../labs/lab07-simple-functions.md)
- :newspaper: __Misc__: 
    + [chapter 19: Functions](http://r4ds.had.co.nz/functions.html) (_R for Data Science_ by Grolemund and Wickham)
- :mortar_board: __MIDTERM 1__: Friday Mar-09


-----


## 8. Programming Basics for data analysis (part 2)

- :card_index: __Dates__: Mar 12-16
- :paperclip: __Topics__: In addition to writing functions to reduce duplication in your code, you also need to learn about iteration, which helps you when you need to do the same operation several times. Namely, we review control flow structures such as `for` loops, `while` loops, `repeat` loops, and the `apply` family functions.
- :file_folder: __Notes__:
    + [Introduction to loops](../tutorials/12-intro-to-loops.md) (tutorial)
    + [More about functions](../tutorials/13-more-functions.md) (tutorial)
- :microscope: __Lab__: 
    + [Getting started with loops](../labs/lab08-simple-loops.md)
- :newspaper: __Misc__:
    + [chapter 21: Iteration](http://r4ds.had.co.nz/iteration.html) (_R for Data Science_ by Grolemund and Wickham)
- :dart: __HW 3__: due Mar-23
    + [Pipelines and Programming Basics](../hws/hw03-programming-basics.pdf)


-----


## 9. Manipulating Character Strings and Testing Functions

- :card_index: __Dates__: Mar 19-23
- :paperclip: __Topics__: At its heart, computing involves working with numbers. However, a considerable amount of information and data is in the form of text. Therefore, you also need to learn about character strings, and how to perform basic manipulation of strings. In parallel, we'll keep working on writing funtions, especially focusing on testing functions.
- :file_folder: __Notes__:
    + [String Basics](../slides/17-strings-basics.pdf) (slides)
    + [Intro to Strings](../tutorials/12-intro-to-strings.md) (tutorial)
    + [Getting started with testing](../papers/testthat-wickham.pdf) (by Wickham)
- :book: __Reading__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) (by Sanchez)
- :microscope: __Lab__: 
    + [Getting started with strings](../labs/lab09-strings-basics.md)
- :newspaper: __Misc__:
    + [chapter 14: Strings](http://r4ds.had.co.nz/strings.html) (_R for Data Science_ by Grolemund and Wickham)


-----


## Spring Break

- :card_index: __Dates__: Mar 26-30
- :battery: (Re)charge your batteries!
- :dart: __HW 4__: due Apr-06
    + TBA


-----


## 10. Regular Expressions

- :card_index: __Dates__: Apr 02-06
- :paperclip:  __Topics__: To unleash the power of strings manipulation, we need to take things to the next level and learn about Regular Expressions. Namely, Regular expressions are a tool that allows us to describe a certain amount of text called "patterns". We'll describe the basic concepts of regex and the common operations to match text patterns.
- :file_folder: __Notes__:
    + [Introduction to regular expressions](../tutorials/13-intro-to-regex.md)
    + [Regexpal](http://regexpal.com.s3-website-us-east-1.amazonaws.com/) tester tool.
- :book: __Reading__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) (by Sanchez)
- :microscope: __Lab__:
    + TBA
- :newspaper: __Misc__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) (by Sanchez)
- :bulb: __Cheat sheet__:
    + [Regular Expressions cheat sheet](../cheatsheets/regular-expressions-cheatsheet.pdf)


-----


## 11. Random Numbers, Simulations, and Shiny Apps

- :card_index: __Dates__: Apr 09-13
- :paperclip: __Topics__: Random numbers have many applications in science and computer programming, especially when there are significant uncertainties in a phenomenon of interest. In this part of the course we'll look at some basic problems involving working with random numbers and creating simulations.

In order to better visualize the results of some simulations, we will briefly discuss Shiny apps. This type of apps are a nice companion to R, making it quick and simple to deliver interactive analysis and graphics on any web browser. We'll review how to create simple shiny apps to display data summaries, queries, and interactive displays.
- :file_folder: __Notes__:
    + [shiny tutorial](../slides/shiny-tutorial.pdf) (by Grolemund)
- :book: __Reading__:
    + [Part 1 - How to build a Shiny app](https://vimeo.com/rstudioinc/review/131218530/212d8a5a7a/#t=0m0s) (video)
- :microscope: __Lab__:
    + TBA
- :newspaper: __Misc__:
    + [Part 2 - How to customize reactions](https://vimeo.com/rstudioinc/review/131218530/212d8a5a7a/#t=42m2s) (video)
    + [Part 3 - How to customize appearance](https://vimeo.com/rstudioinc/review/131218530/212d8a5a7a/#t=1h32m41s) (video)
- :dart: __HW 5__: due Apr-20
    + TBA


-----


## 12. R packaging (part 1)

- :card_index: __Dates__: Apr 16-20
- :paperclip: __Topics__: Packages are the fundamental units of reproducible R code. They include reusable functions, the documentation that describes how to use them, and sample data. In this part we'll start describing how to turn your code into an R package.
- :file_folder: __Notes__:
    + TBA
- :book: __Reading__:
    + [Package Structure](http://r-pkgs.had.co.nz/package.html) (R packages by Wickham)
    + See package components: [http://r-pkgs.had.co.nz/](http://r-pkgs.had.co.nz/) (R packages by Wickham)
- :microscope: __Lab__:
    + TBA


-----


## 13. R Packaging (part 2)

- :card_index: __Dates__: Apr 23-27
- :paperclip: __Topics__: Creating an R package can seem overwhelming at first. So we'll keep working on the creation of a relatively basic package. This will give you the opportunity to apply most of the concepts seen in the course.
- :file_folder: __Notes__:
    + TBA
- :book: __Reading__:
    + See package components: [http://r-pkgs.had.co.nz](http://r-pkgs.had.co.nz/) (R packages by Wickham)
- :microscope: __Lab__:
    + TBA
- :dart: __HW 6__: due Apr-27
    + TBA


-----


## 14. RRR Week and Final Exam

- :card_index: __Dates__: Apr 30-May 04
- :paperclip: __Topics__: Prepare for final examination
- :file_folder: __Notes__:
    + No lecture. Instructor will hold OH (in 309 Evans)
- :mortar_board: __FINAL__: Mon May 7, 8-11am (room TBA)


-----
