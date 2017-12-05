---
title: "Subsetting Data in R with dplyr"
teaching: 10
exercises: 5
questions:
- "Key question"
objectives:
- "Select certain columns in a data frame with the **`dplyr`** function `select`."
- "Select certain rows in a data frame according to filtering conditions with the **`dplyr`** function `filter` ."
- "Use `summarize`, `group_by`, and `tally` to split a data frame into groups of observations, apply a summary statistics for each group, and then combine the results."
keypoints:
- "First key point."
---

# Add section about reading data into R


# Data Manipulation using **`dplyr`**

**`dplyr`** is a package for
making tabular data manipulation easier. 

Packages in R are basically sets of additional functions that let you do more
stuff. The functions we've been using so far, like `str()` or `data.frame()`,
come built into R; packages give you access to more of them. Before you use a
package for the first time you need to install it on your machine, and then you
should import it in every subsequent R session when you need it. You should
already have installed the **`tidyverse`** package. This is an
"umbrella-package" that installs several packages useful for data analysis which
work together well such as **`tidyr`**, **`dplyr`**, **`ggplot2`**, etc. To load
the package type:


```
library("dplyr")
```

## What is **`dplyr`**?

The package **`dplyr`** provides easy tools for the most common data manipulation
tasks. It is built to work directly with data frames, with many common tasks
optimized by being written in a compiled language (C++). An additional feature is the
ability to work directly with data stored in an external database. The benefits of
doing this are that the data can be managed natively in a relational database,
queries can be conducted on that database, and only the results of the query are
returned.

This addresses a common problem with R in that all operations are conducted
in-memory and thus the amount of data you can work with is limited by available
memory. The database connections essentially remove that limitation in that you
can have a database of many 100s GB, conduct queries on it directly, and pull
back into R only what you need for analysis.


To learn more about **`dplyr`** after the workshop, you may want to check out this
[handy data transformation with **`dplyr`** cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf).


## Selecting columns and filtering rows

We're going to learn some of the most common **`dplyr`** functions: `select()`,
`filter()`, `group_by()`, and `summarize()`. To select columns of a
data frame, use `select()`. The first argument to this function is the data
frame (`surveys`), and the subsequent arguments are the columns to keep.

```
select(surveys, plot_id, species_id, weight)
```

To choose rows based on a specific criteria, use `filter()`:

```
filter(surveys, year == 1995)
```

## Add pipes section back in

> ## Exercise
>
>  Using pipes, subset the `survey` data to include individuals collected before
>  1995 and retain only the columns `year`, `sex`, and `weight`.
>
> > ## Solution  
> > ```
> > surveys %>%  
> > filter(year < 1995) %>%  
> > select(year, sex, weight)  
> > ```
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
to calculate the summary statistics. So to view the mean `weight` by sex:

```
surveys %>%
group_by(sex) %>%
summarize(mean_weight = mean(weight, na.rm = TRUE))
```

You may also have noticed that the output from these calls doesn't run off the
screen anymore. That's because **`dplyr`** has changed our `data.frame` object
to an object of class `tbl_df`, also known as a "tibble". Tibble's data
structure is very similar to a data frame. For our purposes the only differences
are that, (1) in addition to displaying the data type of each column under its
name, it only prints the first few rows of data and only as many columns as fit
on one screen, (2) columns of class `character` are never converted into
factors.

You can also group by multiple columns:

```
surveys %>%
group_by(sex, species_id) %>%
summarize(mean_weight = mean(weight, na.rm = TRUE))
```

When grouping both by `sex` and `species_id`, the first rows are for individuals
that escaped before their sex could be determined and weighted. You may notice
that the last column does not contain `NA` but `NaN` (which refers to "Not a
Number"). To avoid this, we can remove the missing values for weight before we
attempt to calculate the summary statistics on weight. Because the missing
values are removed, we can omit `na.rm = TRUE` when computing the mean:

```
surveys %>%
filter(!is.na(weight)) %>%
group_by(sex, species_id) %>%
summarize(mean_weight = mean(weight))
```

Here, again, the output from these calls doesn't run off the screen
anymore. Recall that **`dplyr`** has changed our object from`data.frame` to
`tbl_df`. If you want to display more data, you can use the `print()` function
at the end of your chain with the argument `n` specifying the number of rows to
display:

```
surveys %>%
filter(!is.na(weight)) %>%
group_by(sex, species_id) %>%
summarize(mean_weight = mean(weight)) %>%
print(n = 15)
```

Once the data are grouped, you can also summarize multiple variables at the same
time (and not necessarily on the same variable). For instance, we could add a
column indicating the minimum weight for each species for each sex:

```
surveys %>%
filter(!is.na(weight)) %>%
group_by(sex, species_id) %>%
summarize(mean_weight = mean(weight),
min_weight = min(weight))
```


#### Tallying

When working with data, it is also common to want to know the number of
observations found for each factor or combination of factors. For this, **`dplyr`**
provides `tally()`. For example, if we wanted to group by sex and find the
number of rows of data for each sex, we would do:

```
surveys %>%
group_by(sex) %>%
tally
```

Here, `tally()` is the action applied to the groups created by `group_by()` and
counts the total number of records for each category.

> ### Challenge {.challenge}
>
> 1. How many individuals were caught in each `plot_type` surveyed?
>
> 2. Use `group_by()` and `summarize()` to find the mean, min, and max hindfoot
> length for each species (using `species_id`).
>
> 3. What was the heaviest animal measured in each year? Return the columns `year`,
> `genus`, `species_id`, and `weight`.
>
> 4. You saw above how to count the number of individuals of each `sex` using a
> combination of `group_by()` and `tally()`. How could you get the same result
> using `group_by()` and `summarize()`? Hint: see `?n`.


<!---
```{r, echo=FALSE, purl=FALSE}
## Answer 1
surveys %>%
group_by(plot_type) %>%
tally

## Answer 2
surveys %>%
filter(!is.na(hindfoot_length)) %>%
group_by(species_id) %>%
summarize(
mean_hindfoot_length = mean(hindfoot_length),
min_hindfoot_length = min(hindfoot_length),
max_hindfoot_length = max(hindfoot_length)
)

## Answer 3
surveys %>%
filter(!is.na(weight)) %>%
group_by(year) %>%
filter(weight == max(weight)) %>%
select(year, genus, species, weight) %>%
arrange(year)

## Answer 4
surveys %>%
group_by(sex) %>%
summarize(n = n())
```
--->




