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

Good data organization is the foundation of your research
project. Most researchers have data or do data entry in
spreadsheets. Spreadsheet programs are very useful graphical
interfaces for designing data tables and handling very basic data
quality control functions.

In this lesson, we’re going to talk about:

- Good data entry practices 
- How to avoid common formatting mistakes
- Exporting data from spreadsheets

Spreadsheets are good for data entry. Therefore we have a lot of data
in spreadsheets. 
Much of your time as a researcher will be spent in this 'data wrangling' stage.
It's not the most fun, but it's necessary. We'll teach you how to think
about data organization and some practices for more effective data wrangling.

### What this lesson will not teach you

- How to do *statistics* in a spreadsheet
- How to do *plotting* in a spreadsheet
- How to *write code* in spreadsheet programs

### Why aren't we teaching data analysis in spreadsheets

- Data analysis in spreadsheets usually requires a lot of manual
work. If you want to change a parameter or run an analysis with a
new dataset, you usually have to redo everything by hand. (We do
know that you can create macros, but see the next point.)

- It is also difficult to track or reproduce statistical or plotting
analyses done in spreadsheet programs when you want to go back to
your work or someone asks for details of your analysis.

### Spreadsheet programs

Many spreadsheet programs are available. Since most participants utilize Excel as their primary spreadsheet program, this lesson will make use of Excel examples.

A free spreadsheet program that can also be used is LibreOffice

Commands may differ a bit between programs, but the general idea
is the same.

In this lesson, we will assume that you are most likely using Excel as
your primary spreadsheet program.

> ## Discussion
> - How many people have used spreadsheets in their research?
> - How many people have accidentally done something that made them
> frustrated or sad?
{: .discussion}

### The Importance of Formatting

It’s extremely important to set up well-formatted
tables from the very start of your data collection. The way your data is organized can make it easier or harder
to work with your data throughout your analysis, so it's worth
thinking about when you're doing your data entry or setting up your
experiment. We're going to look at a spreadsheet demonstrating some common
issues with data organization and formatting, discuss how we could fixt these
issues, and why we would need to, and then use a cleaned up version of the spreadsheet data in further analyses.

### Cardinal Rules

- Always keep a copy of your original data. Often you will need to do
data cleaning or reorganization of this data, but always create a new
copy of the data before doing any modifications. 
- Keep track of the steps you took in your clean up or analysis. 
- When structuring your data:   
    - Put all your variables in columns - the thing you're measuring,
like 'final_exam_score' or 'gender'.  
    - Put each observation in its own row. For educational data, this usually
means one student per row.  
    - Don't combine multiple pieces of information in one
cell. 
    - Export the cleaned data to a text-based format like CSV (comma-separated values) format. This
ensures that anyone can use the data, and is required by
most data repositories.  

> ## Multiple Pieces of Information
> You might be collecting data on students across multiple STEM
> courses. Rather than having a single column for storing the course name,
> it may be more useful to have two columns, one for course prefix (e.g. BIO
> or PHY) and another for course number. This way if you want to compare all 
> courses within a single discipline, or group by discipline, you can.
{: .callout}

> ## Exercise
> 
> We're going to take a messy version of our data and describe how we would clean it up.
>
> 1. Download the data by clicking [here](https://github.com/ErinBecker/saber-west-workshop-2017/raw/gh-pages/data/modified_data/student-messy.xlsx).
> 2. Open up the data in a spreadsheet program. 
> 3. There are two tabs. Two research assistants collected data, one on students in one school ("GP" = Gabriel Pereira) and one in another school ("MS" = Mousinho da Silveira). Both of them kept track of the data in their own way. Now
you're the person in charge of this project and you want to be able to 
start analyzing the data.   
> 4. With the person next to you, identify what is wrong with this spreadsheet. Also discuss the steps you would need to take to clean up the GP and MS tabs, and to put them all together in one spreadsheet. 
>
> After you go through this exercise, we'll discuss as a group what was wrong
> with this data and how you would fix it. 
> 
> > ## Solution
> > 
> > 1) **Using multiple tables** - A common strategy is creating multiple data tables within one spreadsheet. This creates false associations between things for the computer, which sees each row as an observation. For example, in the GP tab of our spreadsheet, the computer will see row 11 and assume that all columns A-S refer to the same sample. This row actually represents data from two different students (student 3 in the list of urban students and student 2 in the list of rural students). 
> > 
> > 2) **Using multiple tabs** - When you create extra tabs, you fail
to allow the computer to see connections in the data that are there. You are more likely to add inconsistencies to your data if you record data across multiple tabs. Even if you manage to avoid inconsistencies, you are adding an extra step for yourself because you now have to combine these data into a single datatable before analysis.   
> > 
> > 3) **Not filling in zeros** - By not entering the value of your observation, you are telling your computer to represent that data as unknown or missing (null). This can cause problems with subsequent calculations or analyses. For example, the average of a set of numbers which includes a single null value is always null (because the computer can't guess the value of the missing observations). Because of this, it's very important to record zeros as zeros and truly missing data as nulls. 
> > 
> > 4) **Using formatting to convey information** - For example, highlighting cells, rows or columns to indicate the data should be treated differently. In our spreadsheet, the research assistant who entered the data for the MS school used highlighting to indicate that a student was part-time. If this is a variable you want to record information on, create a new column in the datatable for recording full-time/part-time status.  
> > 
> > 5) **Placing comments or units in cells** - Most analysis software can't read Excel or LibreOffice comments. Create another field if you need to add notes to cells. Don't include units in cells. Ideally, all the measurements in a column should be in the same unit, but if they aren't, create a new field and specify the unit each cell is in.  
> >
> {: .solution}
{: .challenge}

### Exporting Data from Excel

Storing the data you're going to work with for your analyses in Excel
default file format (`*.xls` or `*.xlsx` - depending on the Excel
version) isn't a good idea.

- It is a proprietary format, and it is possible that in
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

Storing data in a universal, open, and static format will help deal with this problem. Try tab-delimited (tab separated values
or TSV) or comma-delimited (comma separated values or CSV). CSV files are plain text files where the columns are separated by commas,
hence 'comma separated values' or CSV. The advantage of a CSV file over an Excel/SPSS/etc. file is that we can open and read a CSV file
using just about any software, including plain text editors like TextEdit or NotePad. 
Data in a CSV file can also be easily imported into other formats and
environments, such as SQLite and R. We're not tied to a certain version of a certain expensive program when we work with CSV files, so
it's a
good format to work with for maximum portability and endurance. Most spreadsheet programs can save to delimited text formats like CSV
easily, although they may give you a warning during the file export.

> ## Exercise
> 
> 1. Download the cleaned version of this data by clicking [here](https://raw.githubusercontent.com/ErinBecker/saber-west-workshop-2017/gh-pages/data/modified_data/student-por.xlsx). Note that this only includes data collected for students in Portugese classes, and
excludes data on students' math courses.
> 2. Open up the data in a spreadsheet program. 
> 3. From the top menu select 'File' and 'Save as'.
> 4. In the 'Format' field, from the list, select 'Comma Separated Values' (`*.csv`).
> 5. Double check the file name and the location where you want to save it and hit 'Save'.
{: .challenge}

You now have a plain text version of the data, free from Excel-specific formatting. You can look at this data by opening the `.csv` file in TextEdit (Mac) or NotePad (Windows). Each value in the data is separated from the data in the next column by a comma. You can open CSV files in Excel if you want to preview the contents, but you can't open an Excel file in TextEdit or NotePad. 

> ## Caveats on commas
> In some datasets, the data values themselves may include commas (,). In that case, the software which you use (including Excel)
> will most likely incorrectly display the data in columns. This is because the commas which are a part of the data values will be
> interpreted as delimiters.
> 
> If you are working with data that contains commas, you likely will need to use another delimiter when working in a spreadsheet. In this
> case, consider using tabs as your delimiter and working with TSV files. TSV files can be exported from spreadsheet
> programs in the same way as CSV files.
{: .callout}
