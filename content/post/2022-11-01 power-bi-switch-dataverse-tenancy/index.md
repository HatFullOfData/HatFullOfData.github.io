---
title: Power BI – Switch Dataverse Tenancy
description: Occasionally you need to change to point to a different tenancy which means changing a connector to switch Dataverse tenancy.
slug: power-bi-switch-dataverse-tenancy
date: 2022-11-01 12:47:36+0000
lastmod: 2025-02-14 11:41:46+0000
image: cover.png
categories:
    - Dataverse
    - Power BI
---

Connecting to Dataverse with Power BI to report on the business data is becoming easier and more common. One difference with connecting to Dataverse is there are two connectors involved. One to list the available environments and the second to connect to the data. Occasionally you need to change to point to a different tenancy which means changing the first connector to switch Dataverse tenancy.

## YouTube version

[![YouTube video thumbnail](Power-BI-Switch-Dataverse-Tenancy-Time-0_00_0000.png)](https://www.youtube.com/watch?v=KbZK5Uog5ls)

## Starting Point

![Dataverse button on the Home ribbon](switchtenancy_003.png)

When I click Dataverse on the Home ribbon the navigator shows me where I last connected. I need to connect to a different tenancy for this report.

![Navigator window showing the wrong tenancy](switchtenancy_001-1.png)

## Switch Dataverse Tenancy

You need to change the login for the Dataverse login. From the Home ribbon, click the down arrow on Transform data and select Data source settings. In the Data source settings dialog select Global permissions. Then select Dataverse and select Edit Permissions.

![3 steps to switch Dataverse tenancy.](switchtenancy_002.png)

In the Edit Permissions dialog click on the Edit button. This will prompt you to login to the different tenancy. If you do not have a Privacy Level selected I recommend you select one, often Organizational will fit most data sources. It will depend upon your company’s policy.

## Result

Now when I click on the Dataverse button I get the list of environments on the different tenancy.

![Navigator dialog showing successful switch Dataverse tenancy](switchtenancy_004.png)

The Dataverse connector is only used to populate the Dataverse Navigator window. Switching the tenancy will not break any other reports. If all you do is report from one tenancy you will never have to do this. Though I’ve been asked to explain this multiple times.

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

