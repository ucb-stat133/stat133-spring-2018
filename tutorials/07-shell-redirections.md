Shell I/O Redirection
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Understand Input/Output standard
> -   Learn about STDIN and STDOUT
> -   Understand the concept of input/output redirection

------------------------------------------------------------------------

Introduction
------------

So far you have been working with the command line interface using basic commands to move around your file system (e.g. `cd`, `ls`, `pwd`), to inspect contents of files (e.g. `wc`, `head`, `tail`, `cat`, `less`, `file`), and to perform typical file operations:

-   create a directory, e.g. `mkdir lab05`
-   create an empty file, e.g. `touch README.md`
-   rename a file, e.g. `mv report.Rmd document.Rmd`
-   move a file to another directory, e.g. `mv myscript.R lab05/`
-   copy a file, e.g. `cp data1.csv data2.csv`
-   remove a file, e.g. `rm datafile.csv`

Likewise, all the commands you've learned so far have required you to enter information at the command line, and all have produced output on the screen. The next step involves learning how to combine existing commands in new ways. To have a working example, we'll start with some toy directory `toydir` containing a handful of files:

``` bash
mkdir toydir
cd toydir
touch file1.txt
touch README.md
curl -O http://web.pdx.edu/~gerbing/data/cars.csv
curl -O http://web.pdx.edu/~gerbing/data/employee.csv
curl -O http://web.pdx.edu/~gerbing/data/ppseps.csv
```

You should have a filestructure like this:

    toydir/
       README.md
       file1.txt
       cars.csv
       employee.csv
       ppseps.csv

As you can tell, we have three CSV files. Say you want to find out which CSV file is the shortest? We can run the command `wc *.csv` to answer this question:

``` bash
wc *.csv
     393    1027   20964 cars.csv
      37      75    1832 employee.csv
      11      28     252 ppseps.csv
     441    1130   23048 total
```

In this example we only have three CSV files, but what if there were 1000? Our first step toward a solution is to run the command `wc` to get the number of lines in each CSV file:

``` bash
wc -l *.csv
     393 cars.csv
      37 employee.csv
      11 ppseps.csv
     441 total
```

What if you want to display the output above in increasing order? The answer is given with the following command:

``` bash
wc -l *.csv | sort
```

and the displayed output should be:

          11 ppseps.csv
          37 employee.csv
         393 cars.csv
         441 total

To better understand the previous command, we first need to talk about some technical aspects about the terminal, the shell, files, and unix things.

------------------------------------------------------------------------

Some Technical Background
-------------------------

When you use the terminal, you are interacting with a program called the **shell**. There are different shell flavors, but the most common one is the *bash* shell. What does the shell (e.g. bash) do? Basically, the shell interprets the commands that you type in and either executes them directly or passes them on to other programs.

For example, consider the command `cat ppseps.csv` which displays the contents of `ppseps.csv` on the screen:

``` bash
cat ppseps.csv
```

    Company,EPS,PPS
    Imo Indust Inc,-3.26,6.500
    Toro Co ,-1.98,13.000
    Calmat Co,-0.45,22.500
    Tultex Corp,0.56,8.625
    Fam Dol St,1.00,17.250
    Phil Sub Corp,1.23,16.000
    Rtz Plc,1.50,41.375
    Tandy Corp,2.24,24.500
    Ok Gas & Elct,2.42,34.125
    Nicor Inc ,3.83,49.750

It is the shell that finds the file `ppseps.csv`, and calls the `cat` command to ask it to print the file's contents. In turn, the `cat` command calls the kernel to find `ppseps.csv` on the disk and print its contents as a stream of characters on the terminal (i.e. monitor).

Some commands that you type are *built into* into the shell. For example, the `cd` command is built-in. That is, the shell interprets that command and changes your current directory. The `ls` command, on the other hand, is an *external* program typically stored in the file `/bin/ls`.

When you type the name of a command, the shell first checks to see if it is a built-in command and, if so, executes it.

Standard Input and Output
-------------------------

Most unix commands take input from your terminal and send the resulting output back to your terminal. A command normally reads its input from a place called *standard input*, which happens to be your keyboard by default. Similarly, a command normally writes its output to *standard output*, which is also your terminal by default.

If a comman is executed without a filename argument, the command takes its input from standard input. One example of this type of command is the `cat` command. If you don't provide the name of a file to `cat`, then it expects to take input from your keyboard. Here's a toy example, type in `cat` and then press the *Enter* key, then type three sentences, and finally press the keys *Ctrl*+*d* to *stop* the execution of `cat`:

-   `hi there!`
-   `never mind`
-   `see you later!`

You should be able to see some lines of text like the following ones:

``` bash
cat
hi there!
hi there!
never mind
never mind
see you later!
see you later!
```

The command `sort` is another example that can take input from the keyboard. In the terminal, type in four words, and the press *Ctrl*+*d*, for instance:

``` bash
sort
Voldemort
Dumbledore
Potter
Granger
```

You should see the following sorted output in your monitor:

    Dumbledore
    Granger
    Potter
    Voldemort

Because no filename was specified to the `sort` command, the input was taken from standard input, i.e. the keyboard. After the fourth name was typed in, the *Ctrl* and *d* keys were pressed to signal the end of the data stream. At that point, the `sort` command sorted the four names and displayed the results on the standard output, i.e. your monitor.

Using Standard Input and Output
-------------------------------

If a program's input consists entirely of alphanumeric and punctuation characters, there is no difference between reading data from a file and reading data from a terminal. Likewise, if a program's output consists entirely of alphanumeric characters and punctuation, there is no difference between writing to a file, writing to a terminal, and writing to the input of another program.

The *standard Input/Output* facility, typically referred to as *I/O*, provides some simple defaults for managing input/output. There are three default I/O streams: 1) standard input, 2) standard output, and 3) standard error. By convention, standard output aka *stdout* consists of all normal output from a command, while standard error, abbreviated *stderr*, consists of error messages.

Standard input (*stdin*) normally comes from your keyboard. Many programs ignore *stdin*; you name files directly on the command line. For instance, the command `cat file1.csv file2.csv` never reads its standard input; it reads the files directly . But without filenames on the command line, commands that need input will usually read *stdin*. Standard input usually comes from your keyboard, but the shell can redirect *stdin* from a file.

The real advantage of standard I/O is that it allows you to *redirect* input or output away from your terminal to a file. For example, if you want to run the command `cat file1.csv file2.csv`, but you want to place the output in `file3.csv` rather than sending it to your terminal, you have to use the following command:

``` bash
# redirecting output to file3.csv
cat file1.csv file2.csv > file3.csv
```

This is called **redirecting** standard output to `file3.csv`. If you execute this command and look at the contents of `file3.csv`, you will find the contents of `file1.csv`, followed by the contents of `file2.csv`.

One of the best-known forms of redirection in unix is the **pipe**. The shell's vertical bar `|` operator makes a pipe.

| Description                    | bash example  |
|--------------------------------|---------------|
| Send *stdout* to *file*        | `cmd > file`  |
| Send *stderr* to *file*        | `cmd 2> file` |
| Take *stdin* from *file*       | `cmd < file`  |
| Send *stdout* to end of *file* | `cmd >> file` |

*Note:* Keep in mind that the syntax used to redirect standard I/O depends on the shell you are using.

In the next tutorial, you'll learn how to use I/O redirection operators, and apply them to do basic wrangling operations on data tables.
