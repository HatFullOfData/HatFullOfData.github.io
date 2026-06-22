---
title: Power BI – Conditional Formatting Update
description: The June 2019 update for Power BI included a few updates for conditional formatting, for visual backgrounds, titles, cards and gauges. This post is my take on the updates and on how I prefer to do the logic behind choosing a colour. Full details of the June 2019 update can be found at https://powerbi.microsoft.com/en-us/blog/power-bi-desktop-june-2019-feature-summary/ Applying Conditional Colour Formatting This update...
slug: power-bi-conditional-formatting-update
date: 2019-06-13 19:26:40+0000
lastmod: 2025-02-14 13:03:20+0000
categories:
    - Power BI
    - Updates
---

The June 2019 update for Power BI included a few updates for conditional formatting, for visual backgrounds, titles, cards and gauges. This post is my take on the updates and on how I prefer to do the logic behind choosing a colour.

Full details of the June 2019 update can be found at [https://powerbi.microsoft.com/en-us/blog/power-bi-desktop-june-2019-feature-summary/](https://powerbi.microsoft.com/en-us/blog/power-bi-desktop-june-2019-feature-summary/)

### Applying Conditional Colour Formatting

This update added to the places conditional colour formatting can be applied. In every place, the method of applying it is the same, the trick is working out which visuals will let you do what.

When you look at a visual’s formatting properties, right click on a colour selector. If Conditional Formatting appears then you can add rules if nothing appears then you can’t.

![test right click](Conditional_101.png)

When it is applied, the colour is shown as Fx symbol.

![fx symbol](Conditional_102.png)

### List of Locations

VisualSectionPropertyMost VisualsTitleFont colorMost VisualsTitleBackground colorMost VisualsBackgroundColorStacked Bar ChartData colorsDefault color*Clustered Bar ChartData colors Default color* Stacked Column ChartData colors Default color* Clustered Column ChartData colors Default color* Line and Stacked Column ChartData colorsDefault color*Line and Clustered Column ChartData colorsDefault color*Scatter ChartData colorsDefault colorTreemapData colorsAdvanced ControlsFunnelData colorsDefaullt ColorGaugeData colorsFillCardData labelColorCardCategory labelColorTableConditional FormattingBackground ColorTableConditional formattingFont colorMatrixConditional formatting Background Color MatrixConditional formatting Font color MatrixConditional formattingData bars

### Methods of Applying Conditional Formatting

There are three methods of applying conditional formatting: color scale, rules, and field value.

#### Colour Scale

![colour scale dialog](Conditional_103.png)

#### Rules

![rules for formatting](Conditional_104.png)

#### Field Value

![field value](Conditional_105.png)

### Colour Measures

One of my issues with Color scale or Rules is you cannot use multiple column values or measures in the colour choice. Field Value gives a work around for this by allowing you to use a Measure.

I have a very simple example of a list of Stores which have a Target and Sales value. So I create a measure that calculates a colour string based on Sales and Target using an IF function.

```xml
SalesColour = IF(
    SUM(Sales[Sales]) >= SUM(Sales[Target]), 
    "#006400", // Green
    "#BF0000"  // Red
)
```

I then used Field Value conditional formatting to format a gauge fill.

![guages](Conditional_106.png)

### Conclusion

Conditional formatting is getting there but it is still limited, and we have been spoiled by Excel. I expect more updates will come and I will need to update the table above.

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

