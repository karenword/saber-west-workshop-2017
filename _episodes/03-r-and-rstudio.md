---
title: "Introduction to R and RStudio"
teaching: 15
exercises: 10 
questions:
- "Why should I learn R?"
objectives:
- "Load external data from a .csv file into a data frame in R."
- "Summarize the contents of a data frame in R."
keypoints:
- "R is a programming language. RStudio is an Integrated Development Environment for working with R."
- "Tabular data is stored in R as a dataframe object."
- "You can get a sense of your data with `summary()`, `str()`, `names()`, `dim()` and other functions discussed here."
---

## What is R? What is RStudio?

The term "`R`" is used to refer to both the programming language and the
software that interprets the scripts written using it.

[RStudio](https://rstudio.com) is currently a very popular way to not only write
your R scripts but also to interact with the R software. To function correctly,
RStudio needs R and therefore both need to be installed on your computer.


## Why learn R?

- R does not involve lots of pointing and clicking, and that's a good thing
- R code is great for reproducibility
- R is interdisciplinary and extensible
- R works on data of all shapes and sizes
- R produces high-quality graphics
- R has a large and welcoming community
- Not only is R free, but it is also open-source and cross-platform

## Knowing your way around RStudio

Let's start by learning about [RStudio](https://www.rstudio.com/), which is an
Integrated Development Environment (IDE) for working with R.

The RStudio IDE open-source product is free under the
[Affero General Public License (AGPL) v3](https://www.gnu.org/licenses/agpl-3.0.en.html).
The RStudio IDE is also available with a commercial license and priority email
support from RStudio, Inc.

We will use RStudio IDE to write code, navigate the files on our computer,
inspect the variables we are going to create, and visualize the plots we will
generate.

![RStudio interface screenshot](../fig/rstudio-screenshot.png)

RStudio is divided into 4 "Panes": the **Source** for your scripts and documents
(top-left, in the default layout), the R **Console** (bottom-left), your
**Environment/History** (top-right), and your
**Files/Plots/Packages/Help/Viewer** (bottom-right). The placement of these
panes and their content can be customized (see menu, Tools -> Global Options ->
Pane Layout). One of the advantages of using RStudio is that all the information
you need to write code is available in a single window. Additionally, with many
shortcuts, autocompletion, and highlighting for the major file types you use
while developing in R, RStudio will make typing easier and less error-prone.

## Interacting with R

The basis of programming is that we write down instructions for the computer to
follow, and then we tell the computer to follow those instructions. We write, or
*code*, instructions in R because it is a common language that both the computer
and we can understand. We call the instructions *commands* and we tell the
computer to follow the instructions by *executing* (also called *running*) those
commands.

There are two main ways of interacting with R: by using the console or by using
script files (plain text files that contain your code). The console pane (in
RStudio, the bottom left panel) is the place where commands written in the R
language can be typed and executed immediately by the computer. It is also where
the results will be shown for commands that have been executed. You can type
commands directly into the console and press `Enter` to execute those commands,
but they will be forgotten when you close the session.

Because we want our code and workflow to be reproducible, it is better to type
the commands we want in the script editor, and save the script. This way, there
is a complete record of what we did, and anyone (including our future selves!)
can easily replicate the results on their computer.

RStudio allows you to execute commands directly from the script editor by using
the `Ctrl` + `Enter` shortcut (on Macs, `Cmd` +
`Return` will work, too). The command on the current line in the
script (indicated by the cursor) or all of the commands in the currently
selected text will be sent to the console and executed when you press
`Ctrl` + `Enter`. You can find other keyboard shortcuts in this [RStudio cheatsheet about the RStudio IDE](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf).
                                                                                                                                 
If R is ready to accept commands, the R console shows a `>` prompt. If it
receives a command (by typing, copy-pasting or sent from the script editor using
`Ctrl` + `Enter`), R will try to execute it, and when
ready, will show the results and come back with a new `>` prompt to wait for new
commands.

If R is still waiting for you to enter more data because it isn't complete yet,
the console will show a `+` prompt. It means that you haven't finished entering
a complete command. This is because you have not 'closed' a parenthesis or
quotation, i.e. you don't have the same number of left-parentheses as
right-parentheses, or the same number of opening and closing quotation marks.
When this happens, and you thought you finished typing your command, click
inside the console window and press `Esc`; this will cancel the incomplete
command and return you to the `>` prompt.

## How to learn more after the workshop?

The material we cover during this workshop will give you an initial taste of how 
you can use R to analyze data for your own research. However, you will need to 
learn more to do advanced operations such as cleaning your dataset, using 
statistical methods, or creating beautiful graphics. The best way to become 
proficient and efficient at R, as with any other tool, is to use it to address 
your actual research questions. As a beginner, it can feel daunting to have to 
write a script from scratch, and given that many people make their code available
online, modifying existing code to suit your purpose might make it easier for you 
to get started.

## Starting looking at our data.

We will be working with the same cleaned CSV file that we created in the previous lesson. To ensure proper location and naming, we will download a new copy of that CSV file, below. 
Each row holds information for a single student, and the columns represent:

| Column           | Description                                         |
|------------------|-----------------------------------------------      |
| school           | "GP" - Gabriel Pereira or "MS" Mousinho da Silveira |      
| sex              |  student's sex                     |                                    
| age              |  student's age                                  |             
| address          |  student's home address ("U" - urban or "R" - rural)           |        
| Medu             |  mother's education (numeric: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
                                  |        
| Fedu             |   father's education (numeric: 0 - none,  1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)                                 |     
| traveltime       |    home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)                                |    
| studytime        |      weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)                              |     
| failures         |   number of past class failures (numeric: n if 1<=n<3, else 4)                                 |             
| Walc             |  weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)                                  |     
| absences         | number of school absences (numeric: from 0 to 93)                                   |    
| G1               | first period grade (numeric: from 0 to 20)
                                   |
| G2               |  second period grade (numeric: from 0 to 20)                                  |
| G3               |     final grade (numeric: from 0 to 20, output target)                               |

We are going to use the R function `download.file()` to download the CSV file
that contains the survey data from figshare, and we will use `read.csv()` to
load into memory the content of the CSV file as an object of class `data.frame`.

To download the data, run the following:

~~~
download.file("https://raw.githubusercontent.com/ErinBecker/saber-west-workshop-2017/gh-pages/data/modified_data/student-por.csv", destfile = "student_por.csv", method = "curl")
~~~
{: .r}

You are now ready to load the data:

~~~
por <- read.csv("student_por.csv")
~~~
{: .r}

This statement doesn't produce any output. However, if you look in your **Environment** pane (upper right),
you can now see an object called `por`. We can click on the object's name to see the data. This will open
a new tab in your central RStudio pane with a preview of the data. It's a nice way to see that the data has 
loaded in properly. 

We can also view the data by typing the object name (`por`) into our console window. 

~~~
por
~~~
{: .r}

This will print the data to your console window. You might notice that not all of the rows are shown.


~~~
 [ reached getOption("max.print") -- omitted 594 rows ]
~~~
{: .output}

If you want to see the last few lines of your data: 

~~~
tail(por)
~~~
{: .r}

~~~
school sex age address Medu Fedu traveltime studytime failures schoolsup famsup paid
644     MS   F  18       R    4    4          3         1        0        no    yes   no
645     MS   F  19       R    2    3          1         3        1        no     no   no
646     MS   F  18       U    3    1          1         2        0        no    yes   no
647     MS   F  18       U    1    1          2         2        0        no     no   no
648     MS   M  17       U    3    1          2         1        0        no     no   no
649     MS   M  18       R    3    2          3         1        0        no     no   no
activities Walc absences G1 G2 G3
644        yes    2        4  7  9 10
645        yes    2        4 10 11 10
646         no    1        4 15 15 16
647        yes    1        6 11 12  9
648         no    4        6 10 10 10
649         no    4        4 10 11 11
~~~
{: .output}

## What are data frames?

A data frame is the representation of data in the format of a table where the
columns all have the same length and each column contains a single type of data (e.g., characters, integers,
factors). For example, here is a figure depicting a data frame comprising of a
numeric, a character and a logical vector.

![](../fig/data-frame.svg)

We can see this when inspecting the <b>str</b>ucture of a data frame
with the function `str()`:

~~~
str(por)
~~~
{: .r}

~~~
'data.frame':	649 obs. of  18 variables:
$ school    : Factor w/ 2 levels "GP","MS": 1 1 1 1 1 1 1 1 1 1 ...
$ sex       : Factor w/ 2 levels "F","M": 1 1 1 1 1 2 2 1 2 2 ...
$ age       : int  18 17 15 15 16 16 16 17 15 15 ...
$ address   : Factor w/ 2 levels "R","U": 2 2 2 2 2 2 2 2 2 2 ...
$ Medu      : int  4 1 1 4 3 4 2 4 3 3 ...
$ Fedu      : int  4 1 1 2 3 3 2 4 2 4 ...
$ traveltime: int  2 1 1 1 1 1 1 2 1 1 ...
$ studytime : int  2 2 2 3 2 2 2 2 2 2 ...
$ failures  : int  0 0 0 0 0 0 0 0 0 0 ...
$ schoolsup : Factor w/ 2 levels "no","yes": 2 1 2 1 1 1 1 2 1 1 ...
$ famsup    : Factor w/ 2 levels "no","yes": 1 2 1 2 2 2 1 2 2 2 ...
$ paid      : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
$ activities: Factor w/ 2 levels "no","yes": 1 1 1 2 1 2 1 1 1 2 ...
$ Walc      : int  1 1 3 1 2 2 1 1 1 1 ...
$ absences  : int  4 2 6 0 0 6 0 2 0 0 ...
$ G1        : int  0 9 12 14 11 12 13 10 15 12 ...
$ G2        : int  11 11 13 14 13 12 12 13 16 12 ...
$ G3        : int  11 11 12 14 13 13 13 13 17 13 ...
~~~
{: .output}

> ## Exercise
> 
> What data types are present in our data? What do the numbers following the data type on each line
> of the `str` output represent?
> 
> > ## Solution
> >
> > Our dataframe has two types of data - factors and integers. The numbers following the data type represent
> > the values of the first several observations of that variable.
> {: .solution}
{: .challenge}


## Inspecting `data.frame` Objects

We already saw how the functions `tail()` and `str()` can be useful to check the
content and the structure of a data frame. Here is a non-exhaustive list of
functions to get a sense of the content/structure of the data. Let's try them out!

* Size:
* `dim(por)` - returns a vector with the number of rows in the first element,
and the number of columns as the second element (the **dim**ensions of
the object)
* `nrow(por)` - returns the number of rows
* `ncol(por)` - returns the number of columns

* Content:
* `head(por)` - shows the first 6 rows
* `tail(por)` - shows the last 6 rows

* Names:
* `names(por)` - returns the column names (synonym of `colnames()` for `data.frame`
objects)
* `rownames(por)` - returns the row names

* Summary:
* `str(por)` - structure of the object and information about the class, length and
content of  each column
* `summary(por)` - summary statistics for each column

Note: most of these functions are "generic", they can be used on other types of
objects besides `data.frame`.

> ## Exercise
>
> Based on the output of `str(por)`, can you answer the following questions?
>
> * What is the class of the object `por`?
> * How many rows and how many columns are in this object?
> * How many students have been sampled during this study?
> 
> > ## Solution
> > 
> > * `por` is a data.frame.
> > * There are 649 rows and 18 columns.
> > * 649 students have been sampled.
> {: .solution}
{: .challenge}
