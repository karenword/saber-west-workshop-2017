---
title: "Visualizing Data in R with ggplot"
teaching: 10
exercises: 5
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

FIXME start here

Now we would like to split the line in each plot by the sex of each individual
measured. To do that we need to make counts in the data frame grouped by `year`,
`species_id`, and `sex`:

~~~
yearly_sex_counts <- por %>%
group_by(year, species_id, sex) %>%
tally()
~~~

We can now make the faceted plot by splitting further by sex using `color` (within a single plot):

~~~
ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
geom_line() +
facet_wrap(~ species_id)
~~~

Usually plots with white background look more readable when printed.  We can set
the background to white using the function `theme_bw()`. Additionally, you can remove
the grid:

~~~
ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
geom_line() +
facet_wrap(~ species_id) +
theme_bw() +
theme(panel.grid = element_blank())
~~~

After creating your plot, you can save it to a file in your favorite format. The Export tab in the **Plot** pane in RStudio will save your plots at low resolution, which will not be accepted by many journals and will not scale well for posters. 

Instead, use the `ggsave()` function, which allows you easily change the dimension and resolution of your plot by adjusting the appropriate arguments (`width`, `height` and `dpi`):

~~~
my_plot <- ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
geom_line() +
facet_wrap(~ species_id) +
labs(title = 'Observed species in time',
x = 'Year of observation',
y = 'Number of species') +
theme_bw() +
theme(axis.text.x = element_text(colour="grey20", size=12, angle=90, hjust=.5, vjust=.5),
axis.text.y = element_text(colour="grey20", size=12),
text=element_text(size=16))
ggsave("name_of_file.png", my_plot, width=15, height=10)
~~~

> ggplot(data = por, aes(x = as.factor(Walc), y = G3)) + 
+ geom_boxplot()