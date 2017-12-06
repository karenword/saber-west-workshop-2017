---
title: "Visualizing Data in R with ggplot"
teaching: 15
exercises: 10
questions:
- "Key question"
objectives:
- "Produce scatter plots using ggplot."
- "Export publication quality graphics."
keypoints:
- "First key point."
---

## Plotting with **`ggplot2`**

`ggplot2` is a plotting package that makes it simple to create complex plots
from data in a data frame. It provides a more programmatic interface for
specifying what variables to plot, how they are displayed, and general visual
properties. Therefore, we only need minimal changes if the underlying data change  
or if we decide to change from a bar plot to a scatterplot. This helps in creating
publication quality plots with minimal amounts of adjustments and tweaking.

ggplot graphics are built step by step by adding new elements. Adding layers in
this fashion allows for extensive flexibility and customization of plots.

To use `ggplot2`, first we need to install the package and load it into our current
R session.

~~~
install.packages("ggplot2")
library("ggplot2")
~~~
{: .r}

Remember, we only need to install it once, but you'll need to load the library
each time you start a new R session.

To build a ggplot, we need to:

- use the `ggplot()` function to bind the plot to a specific data frame using the  
`data` argument

~~~
ggplot(data = por)
~~~
{: .r}

You'll see a new plot appear in your Plots pane (bottom right), but the plot is 
empty. This is because, although we've told `ggplot` which data we want to plot, we 
haven't told it how we want that data to be plotted.

- define aesthetics (`aes`), by selecting the variables to be plotted and the  
variables to define the presentation such as plotting size, shape color, etc.

~~~
ggplot(data = por, aes(x = G1, y = G3))
~~~
{: .r}

Now you will see a plot that still shows no data, but now the axes are labeled and 
show scales. We've told `ggplot` which of the columns in our data we are going to
plot, so it knows how to label the plot and what the proper scale is, but it still
isn't showing any of the actual data. This is because we haven't specified which
`geom`etry we want to plot with. A `geom` is a graphical representation of the data
(e.g. points, lines, bars). **`ggplot2`** offers many different geoms; we will use some 
common ones today, including:
* `geom_point()` for scatter plots, dot plots, etc.
* `geom_boxplot()` for, well, boxplots!
* `geom_line()` for trend lines, time-series, etc.  

To add a geom to the plot use `+` operator. Because we have two continuous variables,  
let's use `geom_point()` first to create an x-y scatter plot.

~~~
ggplot(data = por, aes(x = G1, y = G3)) +
geom_point()
~~~
{: .r}

The `+` in the **`ggplot2`** package is particularly useful because it allows you
to modify existing `ggplot` objects. This means you can easily set up plot
"templates" and conveniently explore different types of plots, so the above
plot can also be generated with code like this:

~~~
# Assign plot to a variable
por_plot = ggplot(data = por, aes(x = G1, y = G3))

# Draw the plot
por_plot + geom_point()
~~~
{: .r}

Notes:

- Anything you put in the `ggplot()` function can be seen by any geom layers
that you add (i.e., these are universal plot settings). This includes the x and
y axis you set up in `aes()`.
- You can also specify aesthetics for a given geom independently of the
aesthetics defined globally in the `ggplot()` function.
- The `+` sign used to add layers must be placed at the end of each line containing
a layer. If, instead, the `+` sign is added in the line before the other layer,
`ggplot2` will not add the new layer and will return an error message.

~~~
# this is the correct syntax for adding layers
por_plot +
geom_point()

# this will not add the new layer and will return an error message
por_plot
+ geom_point()
~~~
{: .r}

There appears to be a nice linear relationship between a student's first grade (G1)
and their final grade (G3) in the course. However, we have 649 students in our 
dataset and not all 649 points are showing. We need to add a little bit of 
randomness to the positions of the plotting symbols so that they don't all overlap
each other.

~~~
por_plot +
geom_jitter()
~~~
{: .r}

There's still a lot of overplotting. We can get a better picture of the data by
increasing the transparency of the points, so that we can see where the dots
are the most dense.

~~~
por_plot + 
geom_jitter(alpha = 0.2)
~~~
{: .r}

The ability to quickly adjust your geom and other layers of your plots is 
good reason to assign your basic plotting object to a variable.

We can also add colors for all the points:

~~~
por_plot + 
geom_jitter(alpha = 0.2, color = "blue")
~~~
{: .r}

Or color students from the two schools differently:

~~~
por_plot +
geom_jitter(alpha = 0.2, aes(color=school))
~~~
{: .r}

> ## Exercise
>
> Create a scatter plot of G3 vs G1 showing the students sex in different colors.
{: .challenge}

## Faceting

ggplot has a special technique called *faceting* that allows the user to split one plot
into multiple plots based on a factor included in the dataset. We can use this
to create two separate plots of G1 vs G3, one for each of our two schools. 

~~~
por_plot +
geom_jitter(alpha = 0.2) +
facet_wrap(~ school)
~~~
{: .r}

> ## Exercise
> 
> Add coloring by sex to the faceted plot we created above. 
> 
> > ## Solution
> > 
> > ~~~
> > por_plot +
> > geom_jitter(alpha = 0.2, aes(color = sex)) +
> > facet_wrap(~ school)
> > ~~~
> {: .solution}
{: .challenge}

## Other Geoms

We might be interested in looking at the relationship between grades and some 
non-continuous variable, like number of previous failed courses (`failures`). To
plot a relationship between a continuous and a non-continuous variable, we should use a box-plot. There is a `geom_boxplot` geometry within `ggplot2`.

First we will create a new base plot to build on:

~~~
failures_plot = ggplot(data = por, aes(x = as.factor(failures), y = G3))
~~~
{: .r}

Now we can create our boxplot.

~~~
failures_plot + 
geom_boxplot()
~~~
{: .r}

If we want to see the data plotted on top of our boxplot, we can add another layer.

~~~
failures_plot + 
geom_boxplot() + geom_jitter(alpha = 0.2)
~~~
{: .r}

Now our outliers are showing up twice (once from the boxplot and once from the dot plot). We can remove them by setting the `outlier.shape` in `geom_boxplot` to `NA`. 

~~~
failures_plot + 
geom_boxplot(outlier.shape = NA) + geom_jitter(alpha = 0.2)
~~~
{: .r}

> ## Exercise
> 
> Create a boxplot showing the relationship between students' final grades and
> any non-continuous variable other than `failures`. 
{: .challenge}

Using these features we've learned, we can make very complex plots quite quickly.
For example, we could plot the relationship between study time and final grades for
for students at each of our two schools, split by school and by whether they live
in a rural or urban area. We can add our datapoints on to this boxplot and color 
the indidivual points by students' sex. 

~~~
ggplot(data = por, aes(x = as.factor(studytime), y = G3)) + geom_boxplot(outlier.shape = NA) + facet_grid(address ~ school) + geom_jitter(alpha = 0.2, aes(color = sex))
~~~
{: .r}

This plot probably shows more information than is useful. It's important to be
thoughtful in creating your final graphics for present your data in a way that
is interpretable to the reader. For now, let's use this plot as a scaffold to 
practice what we've learned.

> ## Exercise
> 
> Change the code for the complicated plot above to:
> 1. Color code the data points by mother's education level.
> 2. Switch the order of the panels so that school is in the rows and
> rural/urban is in the columns.
> 3. Make all the data points purple.
> 4. Plot against the students total grade (G1 + G2 + G3) instead of just G3. 
> 5. Facet by mother's education level and father's education level instead of
> by school and address type.
> 
> > ## Solution
> > 
> > ~~~
> > ggplot(data = por, aes(x = as.factor(studytime), y = G3)) + geom_boxplot(outlier.shape = NA) + facet_grid(address ~ school) + geom_jitter(alpha = 0.2, aes(color = as.factor(Medu)))
> > ~~~
> > {: .r}
> >
> > ~~~
> > ggplot(data = por, aes(x = as.factor(studytime), y = G3)) + geom_boxplot(outlier.shape = NA) + facet_grid(school ~ address) + geom_jitter(alpha = 0.2, aes(color = sex))
> > ~~~
> > {: .r}
> > 
> > ~~~
> > ggplot(data = por, aes(x = as.factor(studytime), y = G3)) + geom_boxplot(outlier.shape = NA) + facet_grid(address ~ school) + geom_jitter(alpha = 0.2, color = "purple")
> > ~~~
> > {: .r}
> > 
> > ~~~
> > ggplot(data = por, aes(x = as.factor(studytime), y = G1 + G2 + G3)) + geom_boxplot(outlier.shape = NA) + facet_grid(address ~ school) + geom_jitter(alpha = 0.2, aes(color = sex))
> > ~~~
> > {: .r}
> > 
> > ~~~
> > ggplot(data = por, aes(x = as.factor(studytime), y = G3)) + geom_boxplot(outlier.shape = NA) + facet_grid(as.factor(Medu) ~ as.factor(Fedu)) + geom_jitter(alpha = 0.2, aes(color = sex))
> > ~~~
> > {: .r}
> {: .solution}
{: .challenge}

> ## Exercise
> Which of the plots from the exercise above are useful ways of showing the data? Which aren't?
{: .challenge}

Usually plots with white background look more readable when printed.  We can set
the background to white using the function `theme_bw()`. Additionally, you can remove
the grid:

~~~
failures_plot + 
geom_boxplot(outlier.shape = NA) + geom_jitter(alpha = 0.2, aes(color = sex)) + 
theme_bw() +
theme(panel.grid = element_blank())
~~~
{: .r}

> ## Exercise
> 
> Try one of the [other pre-designed themes](http://ggplot2.tidyverse.org/reference/ggtheme.html). 
> 
{: .challenge}

After creating your plot, you can save it to a file in your favorite format. The Export tab in the **Plot** pane in RStudio will save your plots at low resolution, which will not be accepted by many journals and will not scale well for posters. 

Instead, use the `ggsave()` function, which allows you change the dimension and resolution of your plot by adjusting the appropriate arguments (`width`, `height` and `dpi`):

~~~
ggsave("Desktop/failures_plot.pdf")
~~~
{: .r}

We can increase the dpi: 

~~~
ggsave("Desktop/failures_plot.pdf", dpi = 600)
~~~
{: .r}

Or set specific size settings according to individual journal's requirements.

~~~
ggsave("Desktop/failures_plot.pdf", height = 6, units = "cm", dpi = 600)
~~~
{: .r}
