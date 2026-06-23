---
title: Power BI – Introducing the Hierarchy Slicer
description: The new hierarchy slicer allows for data to be sliced based on different levels. This will reduce the number of slicers required on a report page.
slug: power-bi-hierarchy-slicer
date: 2020-03-25 19:45:03+0000
lastmod: 2025-02-14 12:35:47+0000
categories:
    - How to
    - Power BI
---

Does your data include a hierarchy? We often can end up with multiple slicers to walk the hierarchy taking up valuable screen. This post does a quick walk through using the new hierarchy slicer.

{{< slicer-series current="4" >}}

## YouTube Version

[![youtuve screen shot](slicer_300.jpg)](https://youtu.be/0s30i2rIclY)

## Adding a Hierarchy Slicer

Add a slicer from the visualisation pane and add the top level of the hierarchy, for example ProdRange from my products table. A tick list will appear just as previously.

![adding first field  to hierarchy slicer](slicer_301.jpg)

The add the next level down of the hierarchy into the Field box under the top level field. The slicer will now have down arrows that can be clicked to expand to show the next level down of the hierarchy.

NoteIn March 2020 you need to activate the Hierarchy Slicer in File – Options – Preview features and then save and restart Power BI. When this visual is not in preview you won’t have to.

![adding second field to hierarchy slicer](slicer_302.jpg)

Multiple layers can be added to the hierarchy. Of course the usability of the slicer needs to be considered when adding many layers.

![Adding multiple layers to hierarchy slicer](slicer_303.jpg)

## Formatting a Hierarchy Slicer

This slicer can still be formatted as a drop down or changed to be single select. The single select allows a whole level of the hierarchy to be selected such as the whole year or a whole month.

![formatting the slicer](slicer_304.jpg)

## Using Search

When search is turned on in a tick list the search returns the terms plus the parents or children of the items returned.

![hierarchy search](slicer_305.jpg)

## Conclusion

The Hierarchy slicer is a great addition to Power BI and I am sure will replace groups of multiple slicers in many reports.

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

