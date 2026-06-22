---
title: Power BI – COALESCE Function to Remove Blanks
description: This post walks through a simple use of the coalesce function to prevent a measure returning Blank. This function was introduced to Power BI in March 2020.
slug: power-bi-coalesce-function-to-remove-blanks
date: 2020-04-03 09:27:01+0000
lastmod: 2025-02-14 12:33:29+0000
categories:
    - Power BI
---

### Introduction

This post walks through a simple use of the coalesce function to prevent a measure returning a Blank. The example used is a simple measure.

![data card showing blank](coalesce_001.jpg)

### YouTube Version

![youtube video](coalesce_000.jpg)

### Measure

The above image shows a card that displays the Total Sales measure and due to slicer selections on the page it returns a blank. The measure is a simple SUMX calculation of Transactions[Qty] * Related Products[Price].

![measure details](coalesce_002.jpg)

### Adding Coalesce

Coalesce function can take multiple parameters. It evaluates the first one, if that returns a value it returns that value, if it returns a blank the function moves onto the next parameter and continues until it finds a non-blank value. If all the calculations return a blank the function returns a blank.

In this example we would like the Blank to be replaced with zero. In other measures you might want it to be another value. So we wrap the whole calculation in a coalesce function.

![adding coalesce function](coalesce_003.jpg)

```xml
Total Sales = 
// Return 0 if blank
COALESCE (
    SUMX ( Transactions, Transactions[Qty] * RELATED ( Products[Price] ) ) ,
    0
)
```

The card now shows a zero value. The Measure was also formatted to be a currency, so we get £0.00.

![zero value in card after adding coalesce function](coalesce_004.jpg)

### Conclusion

This is just a simple example of how the coalesce function can improve the output from measures. The zero could be a string such as “No Sales” or could be an alternative calculation followed by a zero if both calculations returned a blank.

## More Power BI Posts

- [Conditional Formatting Update](https://hatfullofdata.blog/power-bi-conditional-formatting-update/)

- [Data Refresh Date](https://hatfullofdata.blog/power-bi-data-refresh-date/)

- [Using Inactive Relationships in a Measure](https://hatfullofdata.blog/power-bi-inactive-relationships-in-a-measure/)

- [DAX CrossFilter Function](https://hatfullofdata.blog/power-bi-dax-crossfilter-function/)

- [COALESCE Function to Remove Blanks](https://hatfullofdata.blog/power-bi-coalesce-function-to-remove-blanks/)

- [Personalize Visuals](https://hatfullofdata.blog/power-bi-personalize-visuals/)

- [Gradient Legends](https://hatfullofdata.blog/power-bi-gradient-legends/)

- [Endorse a Dataset as Promoted or Certified](https://hatfullofdata.blog/power-bi-endorse-a-dataset/)

- [Q&A Synonyms Update](https://hatfullofdata.blog/power-bi-qa-synonyms-update/)

- [Import Text Using Examples](https://hatfullofdata.blog/power-bi-import-text-using-examples/)

- [Paginated Report Resources](https://hatfullofdata.blog/paginated-report-resources/)

- [Refreshing Datasets Automatically with Power BI Dataflows](https://hatfullofdata.blog/refreshing-datasets-automatically-with-dataflow/)

- [Charticulator](https://hatfullofdata.blog/charticulator-simple-custom-chart/)

- [Dataverse Connector – July 2022 Update](https://hatfullofdata.blog/power-bi-dataverse-connector-july-2022-update/)

- [Dataverse Choice Columns](https://hatfullofdata.blog/power-bi-dataverse-choices-and-choice-column/)

- [Switch Dataverse Tenancy](https://hatfullofdata.blog/power-bi-switch-dataverse-tenancy/)

- [Connecting to Google Analytics](https://hatfullofdata.blog/power-bi-connecting-to-google-analytics/)

- [Take Over a Dataset](https://hatfullofdata.blog/power-bi-take-over-a-dataset/)

- [Export Data from Power BI Visuals](https://hatfullofdata.blog/export-data-from-power-bi-visuals/)

- [Embed a Paginated Report](https://hatfullofdata.blog/power-bi-embed-a-paginated-report/)

- [Using SQL on Dataverse for Power BI](https://hatfullofdata.blog/using-sql-on-dataverse-for-power-bi/)

- [Power Platform Solution and Power BI Series](https://hatfullofdata.blog/power-platform-solution-and-power-bi-part-1/)

- [Creating a Custom Smart Narrative](https://hatfullofdata.blog/power-bi-creating-a-custom-smart-narrative/)

- [Power Automate Button in a Power BI Report](https://hatfullofdata.blog/power-automate-button-in-a-power-bi-report/)

## Power BI Series

- [SVG in Power BI series](https://hatfullofdata.blog/svg-in-power-bi-part-1-svg-basics/)

- [Power BI and Project Online series](https://hatfullofdata.blog/power-bi-connecting-to-project-online/)

- [Slicers series](https://hatfullofdata.blog/power-bi-slicers-introduction/)

- [Dataflow series](https://hatfullofdata.blog/power-bi-create-a-dataflow/)

- [Power BI SVG series](https://hatfullofdata.blog/svg-in-power-bi-part-1-svg-basics/)

- [Power Automate and Power BI Rest API series](https://hatfullofdata.blog/power-automate-and-power-bi-rest-api/)

- [Power BI and DevOps series](https://hatfullofdata.blog/devops-data-into-power-bi/)

