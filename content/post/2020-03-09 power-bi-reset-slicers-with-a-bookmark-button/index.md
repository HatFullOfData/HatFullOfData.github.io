---
title: Power BI – Reset Slicers with a Bookmark Button
description: When your report has a bunch of slicers and charts that can also add filters to the page resetting back to no filters can be painful. So we need a quick way to reset slicers. This post walks through the steps of creating a bookmark and the using that bookmark to reset the page by clicking a button. Introduction This...
slug: power-bi-reset-slicers-with-a-bookmark-button
date: 2020-03-09 12:11:00+0000
lastmod: 2025-02-14 12:39:07+0000
categories:
    - Power BI
---

When your report has a bunch of slicers and charts that can also add filters to the page resetting back to no filters can be painful. So we need a quick way to reset slicers. This post walks through the steps of creating a bookmark and the using that bookmark to reset the page by clicking a button.

{{< slicer-series current="2" >}}

### Introduction

This post will walk through the stages to add a reset button to a report. It comes in 2 parts, firstly create a bookmark that removes filters and then to add button that applies the bookmark as its action.

### YouTube Version

[![](slicer_100-1.jpg)](https://youtu.be/tTwSaHYAWyU)

### Create Bookmark

Bookmarks include the current status of slicers on the current page. So the first job is to clear all the slicers and make sure to selections on charts is filtering the data.

- From the View ribbon, select Bookmarks

- Click on the Add button and a bookmark will appear.

- Double click on the bookmark to rename it

![create bookmark to reset slicers](slicer_101.jpg)

The bookmark can be tested by selecting some options on the slicers and then clicking on the bookmark name and the slicer options should be cleared.

You can now close the Bookmarks pane.

### Adding Reset Button

A bookmark action can be added to a Button, Shape or Image. Select one from the Insert ribbon tab. In the format of the button / shape / image click the Action to be on, change the Type to be Bookmark anf the Bookmark to be the bookmark you created.

![Button options](slicer_102.jpg)

When viewing the report in Power BI desktop you need to hold the CTRL key when you click the button. In the Power BI Service, i.e. where your report is published you will not need the CTRL key.

You can add a message into the the Tooltip to assist your report consumers.

### Updating Bookmarks

When you add new slicers or reformat your slicers it is always a good idea to update your bookmarks. Open the bookmarks pane from the View ribbon tab. Click on the … next to the bookmark name and select Update.

![update bookmark](slicer_103.jpg)

### Conclusion to Reset Slicers

It is important that your report is easy to use. Adding a button so you are able to reset slicers is a good step towards that.

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

