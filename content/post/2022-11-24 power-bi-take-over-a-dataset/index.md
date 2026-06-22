---
title: Power BI – Take Over a Dataset
description: People change jobs, move projects so that dataset is no longer part of their job. So another accounts need to take over that dataset.
slug: power-bi-take-over-a-dataset
date: 2022-11-24 14:24:00+0000
lastmod: 2025-02-14 11:32:47+0000
categories:
    - Power BI
---

A published dataset in the Power BI service is owned by one account, often a person. People change jobs, move projects so that dataset is no longer part of their job. So another accounts need to take over that dataset so the connected reports can get refreshed data. This post will walk you through the simple steps with a few words of caution along the way.

## YouTube Version

[![Thumbnail from YourTube video](Power-BI-Take-Over-Dataset-Time-0_00_0000.png)](https://www.youtube.com/watch?v=0D_n62aghqI)

## Initial Dataset

![](Takeover_001.png)

Click the three dots on a dataset and select Settings. At the the top of the Settings window we can see AmyA currently has control of the Account report dataset. So this account, DanJ cannot edit scheduled refreshes, edit parameters etc. If Amy’s account gets deactivated then the refreshes will fail.

## Perform Take over

Before Dan clicks Take over it is very important to make sure Dan has access to the data sources that this report uses. If Dan does not have access and continues, they could break the connections and therefore break the refresh on this report.

When Dan clicks on the Take over button, it displays a warning message.

![Take over dataset warning message](Takeover_002.png)

When Dan clicks Take over the stored credentials are deleted so the credentials will show an error. In this example there is only one data source so only one set of credentials. Click on Edit credentials for each set of credentials and login or enter credentials.

![The credentials will show an error.](Takeover_003.png)

Once all the credentials have been updated Dan can now configure everything on the dataset. If Amy looks at the dataset they will be able to see Dan has completed the take over. You must have at least Contributor access to the workspace to do this.

![Dataset settings once complete](Takeover_005.png)

## Take Over – Word of Caution

There is no undo. If you do not have credentials for the data sources used in the dataset the refresh will no longer work for import sources and the whole report won’t work for direct query reports. So I highly recommend doing this before your report builder leaves the company and a full handover is completed.

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

