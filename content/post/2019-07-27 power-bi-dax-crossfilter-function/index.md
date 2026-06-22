---
title: Power BI – DAX CrossFilter Function
description: In this post I am continuing my campaign against bi-directional relationships. This is an introduction of the CROSSFILTER function which can be used to simulate the bi-directional relationship in a calculation.
slug: power-bi-dax-crossfilter-function
date: 2019-07-27 07:59:23+0000
lastmod: 2025-02-14 12:48:12+0000
categories:
    - Power BI
---

In this post I am continuing my campaign against bi-directional relationships. This is an introduction of the CROSSFILTER function, which can be used to simulate the bi-directional relationship in a calculation.

### The Problem

Yesterday I posted regarding [Cascading Filters](https://hatfullofdata.blog/power-bi-cascading-slicers/) and removing the need for bi-directional joins to filter slicers. Another reason I’ve seen users using the bi-directional filter is to do a calculation.

Using the same example as yesterday, see the link above, I created a measure  to count the number of products.

![count formula](crossfilter_02.jpg)

Then added a card to count the number of products. With no filters applied it shows 7 products which matches the table and the slicer.

![first report](crossfilter_03.jpg)

Selecting Daisy Delights from the Shop slicer, the table reduces to 5 rows, and after yesterday’s post, the Product slicer also reduces to 5 rows, but the Product Count card still shows 7.

![filtered report](crossfilter_01.jpg)

The big bad bi-directional join would be one method to solve this, but that is not good practice and I’m not suggesting that.

### CROSSFILTER Function

The CROSSFILTER function can be used within a CALCULATE function to specify a direction for relationship to be used between 2 tables. The options for the directions are None, One or Both. So I use this in the measure

![crossfilter function](crossfilter_04.jpg)

Now when I select Daisy Delights on the report, the measure shown in the card changes to 5. The card value matches the other filtered elements.

![corrected filtered report](crossfilter_05.jpg)

### Conclusion

Keeping data models as simple is vital to allow for reports to be kept maintained in the future. CROSSFILTER function is a great addition to the options for calculating measures.

Microsoft’s documentation can be found at  [https://docs.microsoft.com/en-us/dax/crossfilter-function](https://docs.microsoft.com/en-us/dax/crossfilter-function)

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

