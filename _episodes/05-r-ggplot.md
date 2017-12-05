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

```
library(ggplot2)
```

## Plotting with **`ggplot2`**

**`ggplot2`** is a plotting package that makes it simple to create complex plots
from data in a data frame. It provides a more programmatic interface for
specifying what variables to plot, how they are displayed, and general visual
properties. Therefore, we only need minimal changes if the underlying data change  
or if we decide to change from a bar plot to a scatterplot. This helps in creating
publication quality plots with minimal amounts of adjustments and tweaking.

ggplot likes data in the 'long' format: i.e., a column for every dimension,
and a row for every observation. Well structured data will save you lots of time
when making figures with ggplot.

ggplot graphics are built step by step by adding new elements. Adding layers in
this fashion allows for extensive flexibility and customization of plots.

To build a ggplot, we need to:

- use the `ggplot()` function and bind the plot to a specific data frame using the  
`data` argument

```
ggplot(data = surveys_complete)
```

- define aesthetics (`aes`), by selecting the variables to be plotted and the  
variables to define the presentation such as plotting size, shape color, etc.

```
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))
```

- add `geoms` -- graphical representation of the data in the plot (points,
lines, bars). **`ggplot2`** offers many different geoms; we will use some 
common ones today, including:
* `geom_point()` for scatter plots, dot plots, etc.
* `geom_boxplot()` for, well, boxplots!
* `geom_line()` for trend lines, time-series, etc.  

To add a geom to the plot use `+` operator. Because we have two continuous variables,  
let's use `geom_point()` first:

```
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
geom_point()
```

The `+` in the **`ggplot2`** package is particularly useful because it allows you
to modify existing `ggplot` objects. This means you can easily set up plot
"templates" and conveniently explore different types of plots, so the above
plot can also be generated with code like this:

```
# Assign plot to a variable
surveys_plot <- ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))

# Draw the plot
surveys_plot + geom_point()
```

```
## Create a ggplot and draw it.
surveys_plot <- ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))
surveys_plot + geom_point()
```

Notes:

- Anything you put in the `ggplot()` function can be seen by any geom layers
that you add (i.e., these are universal plot settings). This includes the x and
y axis you set up in `aes()`.
- You can also specify aesthetics for a given geom independently of the
aesthetics defined globally in the `ggplot()` function.
- The `+` sign used to add layers must be placed at the end of each line containing
a layer. If, instead, the `+` sign is added in the line before the other layer,
**`ggplot2`** will not add the new layer and will return an error message.

```
# this is the correct syntax for adding layers
surveys_plot +
geom_point()

# this will not add the new layer and will return an error message
surveys_plot
+ geom_point()
```

## Building your plots iteratively

Building plots with ggplot is typically an iterative process. We start by
defining the dataset we'll use, lay the axes, and choose a geom:

```
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
geom_point()
```

Then, we start modifying this plot to extract more information from it. For
instance, we can add transparency (`alpha`) to avoid overplotting:

```
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
geom_point(alpha = 0.1)
```

We can also add colors for all the points:

```
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
geom_point(alpha = 0.1, color = "blue")
```

Or to color each species in the plot differently:

```
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
geom_point(alpha = 0.1, aes(color=species_id))
```

> ### Challenge
>
> Use what you just learned to create a scatter plot of `weight` over `species_id` with the plot types showing in different colors.
> Is this a good way to show this type of data?

```
### Challenge with scatter plot:
##
##  Use what you just learned to create a scatter plot of `weight`
## over `species_id` with the plot types showing in different colors.
## Is this a good way to show this type of data?
```


## Faceting

ggplot has a special technique called *faceting* that allows the user to split one plot
into multiple plots based on a factor included in the dataset. We will use it to
make a time series plot for each species:

```
ggplot(data = yearly_counts, aes(x = year, y = n)) +
geom_line() +
facet_wrap(~ species_id)
```

Now we would like to split the line in each plot by the sex of each individual
measured. To do that we need to make counts in the data frame grouped by `year`,
`species_id`, and `sex`:

```
yearly_sex_counts <- surveys_complete %>%
group_by(year, species_id, sex) %>%
tally()
```

We can now make the faceted plot by splitting further by sex using `color` (within a single plot):

```
ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
geom_line() +
facet_wrap(~ species_id)
```

Usually plots with white background look more readable when printed.  We can set
the background to white using the function `theme_bw()`. Additionally, you can remove
the grid:

```
ggplot(data = yearly_sex_counts, aes(x = year, y = n, color = sex)) +
geom_line() +
facet_wrap(~ species_id) +
theme_bw() +
theme(panel.grid = element_blank())
```

After creating your plot, you can save it to a file in your favorite format. The Export tab in the **Plot** pane in RStudio will save your plots at low resolution, which will not be accepted by many journals and will not scale well for posters. 

Instead, use the `ggsave()` function, which allows you easily change the dimension and resolution of your plot by adjusting the appropriate arguments (`width`, `height` and `dpi`):

```
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
```