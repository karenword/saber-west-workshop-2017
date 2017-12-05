---
title: "Introduction to R and RStudio"
teaching: 25
exercises: 15 
questions:
- "Why should I learn R?"
objectives:
- "Load external data from a .csv file into a data frame in R."
- "Summarize the contents of a data frame in R."
keypoints:
- ""
---

## What is R? What is RStudio?

The term "`R`" is used to refer to both the programming language and the
software that interprets the scripts written using it.

[RStudio](https://rstudio.com) is currently a very popular way to not only write
your R scripts but also to interact with the R software. To function correctly,
RStudio needs R and therefore both need to be installed on your computer.


## Why learn R?

### R does not involve lots of pointing and clicking, and that's a good thing

The learning curve might be steeper than with other software, but with R, the
results of your analysis does not rely on remembering a succession of pointing
and clicking, but instead on a series of written commands, and that's a good
thing! So, if you want to redo your analysis because you collected more data,
you don't have to remember which button you clicked in which order to obtain
your results, you just have to run your script again.

Working with scripts makes the steps you used in your analysis clear, and the
code you write can be inspected by someone else who can give you feedback and
spot mistakes.

Working with scripts forces you to have a deeper understanding of what you are
doing, and facilitates your learning and comprehension of the methods you use.

### R code is great for reproducibility

Reproducibility is when someone else (including your future self) can obtain the
same results from the same dataset when using the same analysis.

R integrates with other tools to generate manuscripts from your code. If you
collect more data, or fix a mistake in your dataset, the figures and the
statistical tests in your manuscript are updated automatically.

An increasing number of journals and funding agencies expect analyses to be
reproducible, so knowing R will give you an edge with these requirements.


### R is interdisciplinary and extensible

With 10,000+ packages that can be installed to extend its capabilities, R
provides a framework that allows you to combine statistical approaches from many
scientific disciplines to best suit the analytical framework you need to analyze your
data. For instance, R has packages for image analysis, GIS, time series, population
genetics, and a lot more.


### R works on data of all shapes and sizes

The skills you learn with R scale easily with the size of your dataset. Whether
your dataset has hundreds or millions of lines, it won't make much difference to
you.

R is designed for data analysis. It comes with special data structures and data
types that make handling of missing data and statistical factors convenient.

R can connect to spreadsheets, databases, and many other data formats, on your
computer or on the web.


### R produces high-quality graphics

The plotting functionalities in R are endless, and allow you to adjust any
aspect of your graph to convey most effectively the message from your data.


### R has a large and welcoming community

Thousands of people use R daily. Many of them are willing to help you through
mailing lists and websites such as [Stack Overflow](https://stackoverflow.com/), or on the [RStudio community](https://community.rstudio.com/).


### Not only is R free, but it is also open-source and cross-platform

Anyone can inspect the source code to see how R works. Because of this
transparency, there is less chance for mistakes, and if you (or someone else)
find some, you can report and fix bugs.



## Knowing your way around RStudio

Let's start by learning about [RStudio](https://www.rstudio.com/), which is an
Integrated Development Environment (IDE) for working with R.

The RStudio IDE open-source product is free under the
[Affero General Public License (AGPL) v3](https://www.gnu.org/licenses/agpl-3.0.en.html).
The RStudio IDE is also available with a commercial license and priority email
support from RStudio, Inc.

We will use RStudio IDE to write code, navigate the files on our computer,
inspect the variables we are going to create, and visualize the plots we will
generate. RStudio can also be used for other things (e.g., version control,
developing packages, writing Shiny apps) that we will not cover during the
workshop.

![RStudio interface screenshot](img/rstudio-screenshot.png)

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
`Ctrl` + `Enter`. You can find other keyboard shortcuts in this [RStudio cheatsheet about the RStudio IDE](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf.
                                                                                                                                 
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

We are studying the FIXME describe the data. The dataset is stored as a comma separated value (CSV) file.
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

To download the data into the `data/` subdirectory, run the following:

download.file("https://ndownloader.figshare.com/files/2292169",
"data/portal_data_joined.csv")

You are now ready to load the data:

surveys <- read.csv("data/portal_data_joined.csv")

This statement doesn't produce any output because, as you might recall,
assignments don't display anything. If we want to check that our data has been
loaded, we can print the variable's value: `surveys`.

Wow... that was a lot of output. At least it means the data loaded
properly. Let's check the top (the first 6 lines) of this data frame using the
function `head()`:

head(surveys)

## What are data frames?

Data frames are the _de facto_ data structure for most tabular data, and what we
use for statistics and plotting.

A data frame can be created by hand, but most commonly they are generated by the
functions `read.csv()` or `read.table()`; in other words, when importing
spreadsheets from your hard drive (or the web).

A data frame is the representation of data in the format of a table where the
columns are vectors that all have the same length. Because the column are
vectors, they all contain the same type of data (e.g., characters, integers,
factors). For example, here is a figure depicting a data frame comprising of a
numeric, a character and a logical vector.

![](./img/data-frame.svg)


We can see this when inspecting the <b>str</b>ucture of a data frame
with the function `str()`:

```{r, purl=FALSE}
str(surveys)
```

## Inspecting `data.frame` Objects

We already saw how the functions `head()` and `str()` can be useful to check the
content and the structure of a data frame. Here is a non-exhaustive list of
functions to get a sense of the content/structure of the data. Let's try them out!

* Size:
* `dim(surveys)` - returns a vector with the number of rows in the first element,
and the number of columns as the second element (the **dim**ensions of
the object)
* `nrow(surveys)` - returns the number of rows
* `ncol(surveys)` - returns the number of columns

* Content:
* `head(surveys)` - shows the first 6 rows
* `tail(surveys)` - shows the last 6 rows

* Names:
* `names(surveys)` - returns the column names (synonym of `colnames()` for `data.frame`
objects)
* `rownames(surveys)` - returns the row names

* Summary:
* `str(surveys)` - structure of the object and information about the class, length and
content of  each column
* `summary(surveys)` - summary statistics for each column

Note: most of these functions are "generic", they can be used on other types of
objects besides `data.frame`.

> ## Challenge
>
> Based on the output of `str(surveys)`, can you answer the following questions?
>
> * What is the class of the object `surveys`?
> * How many rows and how many columns are in this object?
> * How many species have been recorded during these surveys?
{: .challenge}
