---
title: Power BI – Using Inactive Relationships in a Measure
description: In this post I will show a simple example of how to use a different relationship between two tables in a measure. The example I will use is a list of tasks with start and finish dates. The request is for how many tasks start per week and how many finish per week to be plotted on a column chart.
slug: power-bi-inactive-relationships-in-a-measure
date: 2019-07-25 09:54:02+0000
lastmod: 2025-02-14 12:53:36+0000
image: Tasks_00-1.png
categories:
    - Intermediate
    - Power BI
---

In this post I will show a simple example of how to use an inactive relationship between two tables in a measure. The example I will use is a list of tasks with start and finish dates. The request is for how many tasks start per week and how many finish per week to be plotted on a column chart.

## YouTube Version
<a href='https://www.youtube.com/watch?v=HHfzwaD4NtA'>
<img alt='thumbnail from YouTube video' src='Power-BI-Using-Inactive-Relationships-in-a-Measure-Time-0_00_0000.png'>
</a>

## Data Setup

The data for this report is a list of tasks in an Excel spreadsheet with an Task Id, Task Name, Start Date, and Finish Date columns. I have also added a calendar table with a Date column and a Start of Week column.

In the relationships view I drag Date from Calendar onto Start Date in Tasks and a 1 to many relationship appears as expected. That will allow me to count the tasks starting.

I also want to be able to count the finishing tasks, so I need a relationship to Finish Date from the calendar as well. So I drag the Date from Calendar onto Finish Date in Tasks. A relationship appears but this time it is dotted, which shows it is not the active relationship.

![Showing 2 relationships](Tasks_01.png)

If you look in Manage relationships it will list both relationships but only one will be ticked as Active.

![Manage relationships](Tasks_02.png)

## Creating the Measures

Now the relationships have been setup we can create the two measures to do the 2 different counts.

The first measure is the simplest and will use the active relationship between Calendar[Date] and Tasks[Start Date]. It is just a count of the Tasks Id column.

![Calculation](Tasks_03.png)

For the second measure to count the number of tasks finishing we need to use the other other relationship. We can do this by using the Calculate function and the UseRelationship function. The UseRelationship function allows you to use an inactive relationship by specifying the two related columns. It must be an existing relationship in the model.

![Finishing tasks calculation](Tasks_04-1.png)

```xml
Tasks Finishing = 
    CALCULATE(
        COUNT( Tasks[Task ID] ),
        USERELATIONSHIP( 'Calendar'[Date], Tasks[Finish Date] )
    )
```

We can now add these measures to a column chart to get a plot to compare starting to finishing tasks.

![building chart](Tasks_05.png)

## Conclusion

The USERELATIONSHIP function is a powerful addition to your creating measures tool-set. It does have some restrictions and these are detailed in the official documentation at  [https://docs.microsoft.com/en-us/dax/userelationship-function-dax](https://docs.microsoft.com/en-us/dax/userelationship-function-dax)