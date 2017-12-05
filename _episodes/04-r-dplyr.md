---
title: "Subsetting Data in R with dplyr"
teaching: 15
exercises: 10
questions:
- "Key question"
objectives:
- "Select certain columns in a data frame with the **`dplyr`** function `select`."
- "Select certain rows in a data frame according to filtering conditions with the **`dplyr`** function `filter` ."
- "Use `summarize`, `group_by`, and `tally` to split a data frame into groups of observations, apply a summary statistics for each group, and then combine the results."
keypoints:
- "First key point."
---

# Data Manipulation using **`dplyr`**

**`dplyr`** is a package for
making tabular data manipulation easier. 

Packages in R are basically sets of additional functions that let you do more
stuff. The functions we've been using so far, like `str()` or `data.frame()`,
come built into R; packages give you access to more of them. Before you use a
package for the first time you need to install it on your machine, and then you
should import it in every subsequent R session when you need it. 

We're going to first install the `dplyr` package:

~~~
install.packages("dplyr")
~~~
{: .r}

and then load the library into our current R session:

~~~
library("dplyr")
~~~
{: .r}

You'll see some output like: 

~~~
Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

filter, lag

The following objects are masked from ‘package:base’:

intersect, setdiff, setequal, union
~~~
{: .output}

We don't need to worry about this for now.

## What is **`dplyr`**?

The package **`dplyr`** provides tools for the most common data manipulation
tasks.To learn more about **`dplyr`** after the workshop, you may want to check out this
[handy data transformation with **`dplyr`** cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf).

## Selecting columns and filtering rows

We're going to learn some of the most common **`dplyr`** functions: `select()`,
`filter()`, `group_by()`, and `summarize()`. To select columns of a
data frame, use `select()`. The first argument to this function is the data
frame (`por`), and the subsequent arguments are the columns to keep.

~~~
select(por, sex, age, G3)
~~~
{: .r}

To choose rows based on a specific criteria, use `filter()`:

~~~
filter(por, sex == "F")
~~~
{: .r}

> ## One vs. Two 
> 
> In `R`, a single equals sign (`=`) indicates asignment and two equals signs next to each other
> (`==`) indicates equality. To find only the rows where sex is equal to "F", we need to use
> two equals signs. 
{: .callout}

We can filter by multiple criteria in a single line of code:

~~~
filter(por, sex == "F" & age > 15)
~~~
{: .r}

> ## Exercise
> 
> Extract only Urban students who are male and attend the Gabriel Pereira school.
> 
> > ## Solution
> > ~~~
> > filter(por, address == "U" & sex == "M" & school == "GP")
> > ~~~
> > {: .r}
> {: .solution}
{: .challenge}

## Pipes

But what if you wanted to select and filter at the same time? There are three
ways to do this: use intermediate steps, nested functions, or pipes.

With intermediate steps, you essentially create a temporary data frame and use
that as input to the next function, like this:

~~~
por2 = filter(por, sex == "F")
por_females = select(por2, school, sex, age)
~~~
{: .r}

This is readable, but can clutter up your workspace with lots of objects that you have to name individually. With multiple steps, that can be hard to keep track of.

You can also nest functions (i.e. one function inside of another), like this:

~~~
por_females = select(filter(por, sex == "F"), school, sex, age)
~~~
{: .r}

This is handy, but can be difficult to read if too many functions are nested, as
things are evaluated from the inside out.

The last option, pipes, are a fairly recent addition to R. Pipes let you take
the output of one function and send it directly to the next, which is useful
when you need to do many things to the same dataset.  Pipes in R look like
`%>%` and are made available via the `magrittr` package, installed automatically
with `dplyr`. You can type the pipe with `Ctrl`
+ `Shift` + `M` if you have a PC or `Cmd` + 
`Shift` + `M` if you have a Mac.

~~~
por %>%
filter(sex == "F") %>%
select(school, sex, age)
~~~
{: .r}

In the above, we use the pipe to send the `por` dataset first through
`filter()` to keep rows where `sex` is "F", then through `select()`
to keep only the `school`, `sex`, and `age` columns. Since `%>%` takes
the object on its left and passes it as the first argument to the function on
its right, we don't need to explicitly include it as an argument to the
`filter()` and `select()` functions anymore.

If we wanted to create a new object with this smaller version of the data, we
could do so by assigning it a new name:

~~~
por_females <- por %>%
filter(sex == "F") %>%
select(school, sex, age)

por_females
~~~
{: .r}

Note that the final data frame is the leftmost part of this expression.

> ## Exercise
>
>  Using pipes, subset the `por` data to include only male students who attend the
>  Mousinho da Silveira school, and retain only the columns `Medu`, `Fedu`, and `traveltime`.
>
> > ## Solution 
> > ~~~
> > por %>%  
> > filter(sex == "M" & school == "MS") %>%  
> > select(Medu, Fedu, traveltime)  
> > ~~~
> > {: .r}
> {: .solution}
{: .challenge}

### Split-apply-combine data analysis and the summarize() function

Many data analysis tasks can be approached using the *split-apply-combine*
paradigm: split the data into groups, apply some analysis to each group, and
then combine the results. **`dplyr`** makes this very easy through the use of the
`group_by()` function.


#### The `summarize()` function

`group_by()` is often used together with `summarize()`, which collapses each
group into a single-row summary of that group.  `group_by()` takes as arguments
the column names that contain the **categorical** variables for which you want
to calculate the summary statistics. So to view the mean `G3` by sex:

~~~
por %>%
group_by(sex) %>%
summarize(mean_final_grade = mean(G3))
~~~
{: .r}

~~~
# A tibble: 2 x 2
sex mean_final_grade
<fctr>            <dbl>
1      F         12.25326
2      M         11.40602
~~~
{: .output}

> ## What's a Tibble?
> You may also have noticed that the output from these calls doesn't run off the
> screen anymore. That's because **`dplyr`** has changed our `data.frame` object
> > to an object of class `tbl_df`, also known as a "tibble". Tibble's data
structure is very similar to a data frame. For our purposes the only differences
> are that, (1) in addition to displaying the data type of each column under its
> name, it only prints the first few rows of data and only as many columns as fit
> on one screen, (2) columns of class `character` are never converted into
> factors.
{: .callout}

You can also group by multiple columns:

~~~
por %>%
group_by(sex, school) %>%
summarize(mean_final_grade = mean(G3)
~~~
{: .r}

~~~
# A tibble: 4 x 3
# Groups:   sex [?]
sex school mean_final_grade
<fctr> <fctr>            <dbl>
1      F     GP         13.00422
2      F     MS         11.03425
3      M     GP         12.03226
4      M     MS          9.95000
~~~
{: .output}

Once the data are grouped, you can also summarize multiple variables at the same
time (and not necessarily on the same variable). For instance, we could add a
column indicating the maximum number of absences for each group of students (grouped by
sex and school):

~~~
por %>%
group_by(sex, school) %>%
summarize(mean_final_grade = mean(G3),
          max_absences = max(absences))
~~~
{: .r}

~~~
# A tibble: 4 x 4
# Groups:   sex [?]
sex school mean_final_grade max_absences
<fctr> <fctr>            <dbl>        <dbl>
1      F     GP         13.00422           32
2      F     MS         11.03425           12
3      M     GP         12.03226           26
4      M     MS          9.95000           12
~~~
{: .output}


> ## Exercise
> 
> Use the `group_by` and `summarize` functions to find the mean final grades (`G3`) of the
> urban students and the rural students. Which group has a higher average grade in this sample?
> 
> > ## Solution
> > ~~~
> > por %>%
> > group_by(address) %>%
> > summarize(mean_final_grade = mean(G3))
> > ~~~
> > {: .r}
> >
> > ~~~
> > # A tibble: 2 x 2
> > address mean_final_grade
> > <fctr>            <dbl>
> > 1       R         11.08629
> > 2       U         12.26327
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}

FIXME add something about missing values and mean.

#### Tallying

When working with data, it is also common to want to know the number of
observations found for each factor or combination of factors. For this, `dplyr`
provides `tally()`. For example, if we wanted to group by sex and find the
number of rows of data for each sex, we would do:

~~~
por %>%
group_by(sex) %>%
tally
~~~
{: .r}

~~~
# A tibble: 2 x 2
sex     n
<fctr> <int>
1      F   383
2      M   266
~~~
{: .output}

Here, `tally()` is the action applied to the groups created by `group_by()` and
counts the total number of records for each category.

> ## Exercise
>
> How many students are rural? How many are urban? 
>
> > ## Solution
> > 
> > ~~~
> > por %>%
> > group_by(address) %>%
> > tally
> > ~~~
> > {: .r}
> >
> > There are 197 rural and 452 urban students.
> {: .solution} 
{: .challenge}

> ## Exercise
> Use `group_by()` and `summarize()` to find the mean, min, and max number of absences
> for each school.
>
> > ## Solution
> > 
> > ~~~
> > por %>%
> > group_by(school) %>%
> > summarize(mean_final_grade = mean(G3), 
> > min_final_grade = min(G3),
> > max_final_grade = max(G3))
> > ~~~
> > {: .r}
> > 
> > ~~~
> > # A tibble: 2 x 4
> > school mean_final_grade min_final_grade max_final_grade
> > <fctr>            <dbl>           <dbl>           <dbl>
> > 1     GP         12.57683               0              19
> > 2     MS         10.65044               0              19
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}

> ## Exercise
> Which age of students had the highest and lowest mean final grades?
>
> > ## Solution
> > 
> > ~~~
> > por %>%
> > group_by(age) %>%
> > summarize(mean_final_grade = mean(G3))
> > ~~~
> > {: .r}
> > 
> > ~~~
> > # A tibble: 8 x 2
> > age mean_final_grade
> > <int>            <dbl>
> > 1    15         12.10714
> > 2    16         11.99435
> > 3    17         12.26816
> > 4    18         11.77143
> > 5    19          9.53125
> > 6    20         12.00000
> > 7    21         11.00000
> > 8    22          5.00000
> > ~~~
> > {: .output}
> > 
> > 15 year old had the highest mean grades and 22 year olds had the lowest. 
> {: .solution}
{: .challenge}
