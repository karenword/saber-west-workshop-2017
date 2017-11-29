---
title: "Formatting Data in Spreadsheets"
teaching: 10
exercises: 15
questions:
- "How do we format data in spreadsheets for effective data use?"
- "How can we export data from spreadsheets in a way that is useful for downstream applications?"
objectives:
- "Describe best practices for data entry and formatting in spreadsheets."
- "Apply best practices to arrange variables and observations in a spreadsheet."
- "Store spreadsheet data in universal file formats."
- "Export data from a spreadsheet to a CSV file."
keypoints:
- "Never modify your raw data. Always make a copy before making any changes."  
- "Keep track of all of the steps you take to clean your data."  
- "Organize your data according to tidy data principles."  
- "Data stored in common spreadsheet formats will often not be read correctly into data analysis software, introducing errors into your data."
- "Exporting data from spreadsheets to formats like CSV or TSV puts it in a format that can be used consistently by most programs."
---

The most common mistake made is treating spreadsheet programs like lab notebooks, that is, 
relying on context, notes in the margin,
spatial layout of data and fields to convey information. As humans, we
can (usually) interpret these things, but computers don't view information the same way, and
unless we explain to the computer what every single thing means (and
that can be hard!), it will not be able to see how our data fit
together.

Using the power of computers, we can manage and analyze data in much more 
effective and faster ways, but to use that power, we have to set up
our data for the computer to be able to understand it (and computers are very 
literal).

This is why it’s extremely important to set up well-formatted
tables from the outset - before you even start entering data from
your very first preliminary experiment. Data organization is the
foundation of your research project. It can make it easier or harder
to work with your data throughout your analysis, so it's worth
thinking about when you're doing your data entry or setting up your
experiment. You can set things up in different ways in spreadsheets,
but some of these choices can limit your ability to work with the data in other programs or
have the you-of-6-months-from-now or your collaborator work with the
data.

> Note: the best layouts/formats (as well as software and
> interfaces) for data entry and data analysis might be
> different. It is important to take this into account, and ideally
> automate the conversion from one to another.

### Keeping track of your analyses

When you're working with spreadsheets, during data clean up or analyses, it's
very easy to end up with a spreadsheet that looks very different from the one
you started with. In order to be able to reproduce your analyses or figure out
what you did when Reviewer #3 asks for a different analysis, you should

- create a new file or tab with your cleaned or analyzed data. Don't modify
the original dataset, or you will never know where you started!
- keep track of the steps you took in your clean up or analysis. You should track 
these steps as you would any step in an experiment. You can
do this in another text file, or a good option is to create a new tab in your spreadsheet
with your notes. This way the notes and data stay together.

Put these principles in to practice today during your Exercises. 


### Structuring data in spreadsheets


The cardinal rules of using spreadsheet programs for data:

1. Put all your variables in columns - the thing you're measuring,
like 'final_exam_score' or 'gender'.
2. Put each observation in its own row. For educational data, this usually
means one student per row.
3. Don't combine multiple pieces of information in one
cell. Sometimes it just seems like one thing, but think if that's
the only way you'll want to be able to use or sort that data. 
4. Leave the raw data raw - don't change it!
5. Export the cleaned data to a text-based format like CSV (comma-separated values) format. This
ensures that anyone can use the data, and is required by
most data repositories.

For example, you might be collecting data on students across multiple STEM
courses. You might have a single column for storing the course name, but
it may be more useful to have two columnts, one for course prefix (e.g. BIO
or PHY) and another for course number. This way if you want to compare all 
courses within a single discipline, or group by discipline, you can.

FIXME: Add figures illustrating this difference.

### Columns for variables and rows for observations

The rule of thumb, when setting up a datasheet, is columns =
variables, rows = observations, cells = data (values).

So, instead we should have:

![single-info example](../fig/single-info.png)

> ## Exercise
> 
> We're going to take a messy version of our data and describe how we would clean it up.
>
> 1. Download the data by clicking [here](FIXME insert link to messy data).
> 2. Open up the data in a spreadsheet program. 
> 3. You can see that there are two tabs. Two research assistants collected data, one on students in one school ("GP" = Gabriel Pereira) and one in another school ("MS" = Mousinho da Silveira). Both of them kept track of the data in their own way. Now
you're the person in charge of this project and you want to be able to 
start analyzing the data.   
> 4. With the person next to you, identify what is wrong with this spreadsheet. Also discuss the steps you would need to take to clean up the GP and MS tabs, and to put them all together in one spreadsheet. 
>
> **Important** Do not forget our first piece of advice, to
> create a new file (or tab) for the cleaned data, never
> modify your original (raw) data.
> 
> After you go through this exercise, we'll discuss as a group what was wrong
> with this data and how you would fix it. 
> 
{: .challenge}

## Common Spreadsheet Errors

There are a few potential errors to be on the lookout for in your own data as well as data from collaborators or the Internet. If you are aware of the errors and the possible negative effect on downstream data analysis and result interpretation, it might motivate yourself and your project members to try and avoid them. Making small changes to the way you format your data in spreadsheets, can have a great impact on efficiency and reliability when it comes to data cleaning and analysis.

- [Using multiple tables](#tables)
- [Using multiple tabs](#tabs)
- [Not filling in zeros](#zeros)
- [Using problematic null values](#null)
- [Using formatting to convey information](#formatting)
- [Using formatting to make the data sheet look pretty](#formatting_pretty)
- [Placing comments or units in cells](#units)
- [Entering more than one piece of information in a cell](#info)
- [Using problematic field names](#field_name)
- [Using special characters in data](#special)
- [Inclusion of metadata in data table](#metadata)
- [Date formatting](../03-dates-as-data/)


## <a name="tables"></a> Using multiple tables

A common strategy is creating multiple data tables within
one spreadsheet. This confuses the computer, so don't do this!
When you create multiple tables within one
spreadsheet, you’re drawing false associations between things for the computer,
which sees each row as an observation. You’re also potentially using the same
field name in multiple places, which will make it harder to clean your data up
into a usable form. The example below depicts the problem:

![multiple tabs](../fig/2_datasheet_example.jpg)

In the example above, the computer will see (for example) row 4 and assume that all columns A-AF 
refer to the same sample. This row actually represents four distinct samples 
(sample 1 for each of four different collection dates - May 29th, June 12th, June 19th, and June 26th), 
as well as some calculated summary statistics (an average (avr) and standard error of measurement (SEM)) for two of those samples. Other rows are similarly problematic.

## <a name="tabs"></a> Using multiple tabs

But what about workbook tabs? That seems like an easy way to organize data, right? Well, yes and no. When you create extra tabs, you fail
to allow the computer to see connections in the data that are there (you have to introduce spreadsheet application-specific functions or
scripting to ensure this connection). Say, for instance, you make a separate tab for each day you take a measurement.

This isn't good practice for two reasons:
1) you are more likely to accidentally add inconsistencies to your data if each time you take a measurement, you start recording data in a new tab, and
2) even if you manage to prevent all inconsistencies from creeping in, you will add an extra step for yourself before you analyze the
data because you will have to combine these data into a single datatable. You will have to explicitly tell the computer how to combine
tabs - and if the tabs are inconsistently formatted, you might even have to do it manually.

The next time you’re entering data, and you go to create another tab or table,
ask yourself if you could avoid adding this tab by adding another column to your original spreadsheet.

Your data sheet might get very long over the course of the experiment. This makes it harder to enter data if you can’t see your headers
at the top of the spreadsheet. But don't repeat your header row. These can easily get mixed into the data, 
leading to problems down the road.

Instead you can freeze the column headers so that they remain visible even when you have a spreadsheet with many rows.

[Documentation on how to freeze column headers](https://support.office.com/en-ca/article/Freeze-column-headings-for-easy-scrolling-57ccce0c-cf85-4725-9579-c5d13106ca6a)

## <a name="zeros"></a> Not filling in zeros

It might be that when you're measuring something, it's
usually a zero, say the number of times a rabbit
is observed in the survey. Why bother
writing in the number zero in that column, when it's mostly zeros?

However, there's a difference between a zero and a blank cell in a spreadsheet. To the computer, a zero is actually data. You measured
or counted it. A blank cell means that it wasn't measured and the computer will interpret it as an unknown value (otherwise known as a
null value). 

The spreadsheets or statistical programs will likely mis-interpret blank cells that you intend to be zeros. By not entering the value of
your observation, you are telling your computer to represent that data as unknown or missing (null). This can cause problems with 
subsequent calculations or analyses. For example, the average of a set of numbers which includes a single null value is always null
(because the computer can't guess the value of the missing observations). Because of this, it's very important to record zeros as zeros and truly missing data as nulls.

## <a name="null"></a> Using problematic null values
**Example**: using -999 or other numerical values (or zero) to represent missing data.

**Solution**: One common practice is to record unknown or missing data as -999, 999, or 0. Many statistical programs will not recognize
that these are intended to represent missing (null) values. How these values are interpreted will depend on the software you use to
analyze your data. It is essential to use a clearly defined and consistent null indicator.
Blanks (most applications) and NA (for R) are good choices. White et al, 2013, explain good choices for indicating null values for different software applications in their article:
[Nine simple ways to make it easier to (re)use your data.](http://library.queensu.ca/ojs/index.php/IEE/article/view/4608/4898) Ideas in Ecology and Evolution.

![White et al.](../fig/3_white_table_1.jpg)


## <a name="formatting"></a> Using formatting to convey information 

**Example**: highlighting cells, rows or columns that should be excluded from an analysis, leaving blank rows to indicate separations in data.

![formatting](../fig/formatting.png)

**Solution**: create a new field to encode which data should be excluded.

![good formatting](../fig/good_formatting.png)


## <a name="formatting_pretty"></a> Using formatting to make the data sheet look pretty

**Example**: merging cells.

**Solution**: If you’re not careful, formatting a worksheet to be more aesthetically pleasing can compromise your computer’s ability to
see associations in the data. Merged cells will make your data unreadable by statistics software. Consider restructuring your data in
such a way that you will not need to merge cells to organize your data.


## <a name="units"></a> Placing comments or units in cells

**Example**: Your data was collected, in part, by a summer student who you later found out was mis-identifying some of your species, some
of the time. You want a way to note these data are suspect.

**Solution**: Most analysis software can't see Excel or LibreOffice comments, and would be confused by comments placed within your data
cells. As described above for formatting, create another field if you need to add notes to cells. Similarly, don’t include units in
cells: ideally, all the measurements you place in one column should be in the same unit, but if for some reason they aren’t, create
another field and specify the units the cell is in.


## <a name="info"></a> Entering more than one piece of information in a cell

**Example**: You find one male, and one female of the same species. You enter this as 1M, 1F.

**Solution**: Don't include more than one piece of information in a cell. This will limit the ways in which you can analyze your data. 
If you need both these measurements, design your data sheet to include this information. For example, include one column for number of
individuals and a separate column for sex.

## <a name="field_name"></a> Using problematic field names
Choose descriptive field names, but be careful not to include spaces, numbers, or special characters of any kind. Spaces can be
misinterpreted by parsers that use whitespace as delimiters and some programs don’t like field names that are text strings that start
with numbers.  

Underscores (`_`) are a good alternative to spaces. Consider writing names in camel case (like this: ExampleFileName) to improve
readability. Remember that abbreviations that make sense at the moment may not be so obvious in 6 months, but don't overdo it with names
that are excessively long. Including the units in the field names avoids confusion and enables others to readily interpret your fields.

**Examples**  

<table align = "left" style = "width =50%; border: 1px solid black;">
<tr>
<td> <b>Good Name</b></td> <br />
<td> <b>Good Alternative </b> </td><br />
<td> <b>Avoid </b></td><br />
</tr>
<tr>
<td> Max_temp_C</td>
<td> MaxTemp </td>
<td> Maximum Temp (°C) </td>
</tr>
<tr>
<td> Precipitation_mm</td>
<td> Precipitation</td>
<td> precmm </td>
</tr>	
<tr>
<td> Mean_year_growth</td>
<td> MeanYearGrowth </td>
<td> Mean growth/year</td>	
</tr>	
<tr>
<td> sex </td>
<td> sex </td>	
<td> M/F </td>
</tr>
<tr>	
<td> weight </td>
<td> weight </td>	
<td> w.</td>	
</tr>
<tr>	
<td> cell_type </td>
<td> CellType </td>
<td> Cell Type </td>
</tr>
<tr>
<td> Observation_01 </td>
<td> first_observation</td>
<td> 1st Obs</td>
</tr>
</table>

## <a name="special"></a> Using special characters in data

**Example**: You treat your spreadsheet program as a word processor when writing notes, for example copying data directly from Word or
other applications.

**Solution**: This is a common strategy. For example, when writing longer text in a cell, people often include line breaks, em-dashes,
etc in their spreadsheet.  Also, when copying data in from applications such as Word, formatting and fancy non-standard characters (such
as left- and right-aligned quotation marks) are included.  When exporting this data into a coding/statistical environment or into a
relational database, dangerous things may occur, such as lines being cut in half and encoding errors being thrown.

General best practice is to avoid adding characters such as newlines, tabs, and vertical tabs.  In other words, treat a text cell as if
it were a simple web form that can only contain text and spaces.


## <a name="metadata"></a> Inclusion of metadata in data table

**Example**: You add a legend at the top or bottom of your data table explaining column meaning, units, exceptions, etc.

**Solution**: Recording data about your data (“metadata”) is essential. You may be on intimate terms with your dataset while you are 
collecting and analysing it, but the chances that you will still remember that the variable "sglmemgp" means single member of group, for
example, or the exact algorithm you used to transform a variable or create a derived one, after a few months, a year, or more are slim.  

As well, there are many reasons other people may want to examine or use your data - to understand your findings, to verify your findings,
to review your submitted publication, to replicate your results, to design a similar study, or even to archive your data for access and 
re-use by others. While digital data by definition are machine-readable, understanding their meaning is a job for human beings. The 
importance of documenting your data during the collection and analysis phase of your research cannot be overestimated, especially if your
research is going to be part of the scholarly record.  

However, metadata should not be contained in the data file itself. Unlike a table in a paper or a supplemental file, metadata (in the 
form of legends) should not be included in a data file since this information is not data, and including it can disrupt how computer 
programs interpret your data file. Rather, metadata should be stored as a separate file in the same directory as your data file, 
preferably in plain text format with a name that clearly associates it with your data file. Because metadata files are free text format,
they also allow you to encode comments, units, information about how null values are encoded, etc. that are important to document but can
disrupt the formatting of your data file.  

Additionally, file or database level metadata describes how files that make up the dataset relate to each other; what format are they are 
in; and whether they supercede or are superceded by previous files. A folder-level readme.txt file is the classic way of accounting for 
all the files and folders in a project.  

(Text on metadata adapted from the online course Research Data [MANTRA](http://datalib.edina.ac.uk/mantra) by EDINA and Data Library, University of Edinburgh. MANTRA is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).)


Storing the data you're going to work with for your analyses in Excel
default file format (`*.xls` or `*.xlsx` - depending on the Excel
version) isn't a good idea. Why?

- Because it is a proprietary format, and it is possible that in
the future, technology won’t exist (or will become sufficiently
rare) to make it inconvenient, if not impossible, to open the file.

- Other spreadsheet software may not be able to open files
saved in a proprietary Excel format.

- Different versions of Excel may handle data
differently, leading to inconsistencies.

- Finally, more journals and grant agencies are requiring you
to deposit your data in a data repository, and most of them don't
accept Excel format. It needs to be in one of the formats
discussed below.

- The above points also apply to other formats such as open data formats used by LibreOffice / Open Office. These formats are not static and do not get parsed the same way by different software packages.

As an example of inconsistencies in data storage, do you remember how we talked about how Excel stores dates earlier? It turns out that 
there are multiple defaults for different versions of the software, and you can switch between them all. So, say you’re
compiling Excel-stored data from multiple sources. There’s dates in each file- Excel interprets them as their own internally consistent
serial numbers. When you combine the data, Excel will take the serial number from the place you’re importing it from, and interpret it
using the rule set for the version of Excel you’re using. Essentially, you could be adding errors to your data, and it wouldn’t
necessarily be flagged by any data cleaning methods if your ranges overlap.

Storing data in a universal, open, and static format will help deal with this problem. Try tab-delimited (tab separated values
or TSV) or comma-delimited (comma separated values or CSV). CSV files are plain text files where the columns are separated by commas,
hence 'comma separated values' or CSV. The advantage of a CSV file over an Excel/SPSS/etc. file is that we can open and read a CSV file
using just about any software, including plain text editors like TextEdit or NotePad. 
Data in a CSV file can also be easily imported into other formats and
environments, such as SQLite and R. We're not tied to a certain version of a certain expensive program when we work with CSV files, so
it's a
good format to work with for maximum portability and endurance. Most spreadsheet programs can save to delimited text formats like CSV
easily, although they may give you a warning during the file export.

To save a file you have opened in Excel in CSV format:

1. From the top menu select 'File' and 'Save as'.
2. In the 'Format' field, from the list, select 'Comma Separated Values' (`*.csv`).
3. Double check the file name and the location where you want to save it and hit 'Save'.

An important note for backwards compatibility: you can open CSV files in Excel!

![Saving an Excel file to CSV](../fig/excel-to-csv.png)

#### Caveats on commas

In some datasets, the data values themselves may include commas (,). In that case, the software which you use (including Excel)
will most likely incorrectly display the data in columns. This is because the commas which are a part of the data values will be
interpreted as delimiters.

If you are working with data that contains commas, you likely will need to use another delimiter when working in a spreadsheet. In this
case, consider using tabs as your delimiter and working with TSV files. TSV files can be exported from spreadsheet
programs in the same way as CSV files. For more of a discussion on data formats and potential issues with commas within datasets see [the discussion page](http://www.datacarpentry.org/spreadsheet-ecology-lesson/discuss/).