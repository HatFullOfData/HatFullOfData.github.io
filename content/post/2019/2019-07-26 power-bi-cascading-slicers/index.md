---
title: Power BI – Cascading Slicers
description: In this post I will look at filtering one slicer based a selection in another slicer. June 2019 Power BI Update included an update to allow a slicer to be filtered based on a measure, which means that you no longer need to use bi-directional relationships.
slug: power-bi-cascading-slicers
date: 2019-07-26 08:00:23+0000
lastmod: 2025-02-14 12:52:44+0000
image: FilterSlicers_03.png
categories:
    - Power BI
---

In this post I will look at filtering one slicer based a selection in another slicer a.k.a. cascading slicers. June 2019 Power BI Update included an update to allow a slicer to be filtered based on a measure, which means that you no longer need to use bi-directional relationships.

{{< slicer-series current="3" >}}

### Problem Overview

My simple example is a report showing sales of a product in different shops.  The example report contains three tables, Products, Shops and Sales and I’ve related the tables as shown below.

![relationship diagram](FilterSlicers_01.png)

Note the relationships show using arrows that Products can filter Sales and Shops can also filter Sales, and Sales cannot filter either Shops or Products. So I create a report with 2 slicers, a table showing product sales and a card showing total sales.

![report page](FilterSlicers_02.png)

If I use the Shop Name slicer to filter to Daisy Delights the card and table filter to only show the sales of the 5 products that Daisy Delights sell. BUT the slicer of products does not get filtered.

![cascading slicer not working](FilterSlicers_03.png)

### Creating the Measure

So we want to create a measure to indicate if there are sales records. My initial reaction was to create a boolean (True / False) measure using ISEMPTY on the Sales table something similar to

![first attempt](FilterSlicers_04.png)

Puzzled I went looking, and of course the best site SQLBI gave me the answer to use. The links I used were:

[https://www.sqlbi.com/articles/syncing-slicers-in-power-bi/](https://www.sqlbi.com/articles/syncing-slicers-in-power-bi/)

[https://www.sqlbi.com/articles/check-empty-table-condition-with-dax/](https://www.sqlbi.com/articles/check-empty-table-condition-with-dax/)

That measure would be True if Sales records exist and False if no Sales records exist. Sadly this measure doesn’t work as a slicer filter so we need to convert the True and False to numbers 1 and 0, the fastest way to do this INT function. So the above measure becomes

![sales exits = int( not( isempty(Sales)))](FilterSlicers_05.png)

### Filtering the Slicer

We then need to add the measure to the slicer filters. I select the slicer and drag the measure into the filter pane. I then set the operator to is and the value to 1. Then I click Apply Filter and the list of products is now filtered to only 5 products. The Product slicer is now a cascading slicer and will filter based on shop selected.

![using measure](FilterSlicers_06.png)

### Conclusion to Cascading Slicers

Even though I would prefer to use the boolean filter as that makes logical sense to me, this is a cool update and it reduces those nasty bi-directional filters.
