---
title: Power BI – Introducing Sync Slicers
description: How many reports have duplicate slicers across the pages and the report reader has to re-apply the slicer values on each page? Sync slicers fixes the problem.
slug: power-bi-introducing-sync-slicers
date: 2020-07-15 08:50:19+0000
lastmod: 2025-02-14 12:28:16+0000
image: cover.png
categories:
    - Power BI
---

How many reports have duplicate slicers across the pages and the report reader has to re-apply the slicer values on each page? This post covers what the sync slicers feature in Power BI is.

{{< slicer-series current="5" >}}

### YouTube Version

[![YouTube link](sync_001-1.png)](https://www.youtube.com/watch?v=92HJNdcU5ns)

### Sync Slicers Pane

On the View ribbon tab there is a Sync Slicer button which will show the Sync Slicer pane. When you click a slicer it will list the pages and show which pages already contain that slicer. In the Example shown below the ShopName slicer is on the Summary and Turnover pages but not on the Volume page.

![steps to show sync slicers pane](sync_002.png)

### Sync Slicers

In the above example, if the slicer on the Summary page is set to Daisy Delights the slicer on the Turnover page will not change. This is due to no ticks in the sync column.

![sync slicers](sync_003.png)

When the two pages have ticks next to them the slicers will sync. This means that selecting one shop on Summary will select the same shop on the Turnover page.

### Copy Slicers

In the example above the Volume page does not have the Shop slicer. If the sync tick is selected the Volume page will be filtered using the slicer from the other pages.

When the view slicer is ticked, a copy of the slicer with exactly the same formatting and position will be placed onto the Volume page.

Deleting the slicer from the page will stop the page being synced with other pages.

### Advanced Options

The advanced options really confused me. So a google search found me a great video from Reid at Havens Consulting explaining what they mean.

[![Havens video](sync_004.png)](https://www.youtube.com/watch?v=dZIG72afz84)

Adding the same group name to each slicer, makes the slicers sync which fields they contain and the filters applied. I highly recommend watching the above video to see a full explanation.

### Conclusion

Sync slicers is a great feature for reports that contain multiple pages and slicers are used cater for different people.

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

