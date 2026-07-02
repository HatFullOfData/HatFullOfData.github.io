---
title: Power BI Desktop Connecting to Dataverse
description: Dataverse is a secure flexible data storage solution that is part of the very popular Microsoft Power Platform family. So connecting to Dataverse is an obvious request. Dataverse was previously known as Common Data Service. This post is from getting very frustrated mid-hackathon and trying to connect to Dataverse and just getting an odd error. If you want to learn...
slug: power-bi-desktop-connecting-to-dataverse
date: 2021-04-07 08:46:05+0000
lastmod: 2025-02-14 11:56:31+0000
categories:
    - Power BI
---

Dataverse is a secure flexible data storage solution that is part of the very popular Microsoft Power Platform family. So connecting to Dataverse is an obvious request. Dataverse was previously known as Common Data Service. This post is from getting very frustrated mid-hackathon and trying to connect to Dataverse and just getting an odd error.

![Dataverse logo](Dataverse_1600x1600.png)

If you want to learn more about Dataverse you can find more information at [Microsoft Dataverse documentation](https://docs.microsoft.com/en-us/powerapps/maker/data-platform/?WT.mc_id=DP-MVP-5003563)

### Finding the Environment Domain

To connect to Dataverse you need the environment domain. This can be found by going to Power Apps. Then open a model driven app and look at the address bar in your browser. The domain is the XXXXX.crmX.dynamics.com part.

![showing the browser address bar from a model driven app.](Power-BI-Dataverse-002.png)

### Connecting to Dataverse

In Power BI desktop Dataverse is one of the connectors found on the Home ribbon and found in the drop down under Get Data. If you are looking in the dialog it comes under Power Platform. Here is where you put the Environment domain of your Dataverse.

![Dataverse icon on the Home ribbon and the dialog box to enter in the environment domain for connecting to dataverse.](Power-BI-Dataverse-001-2.png)

Use the domain without the https:// and without the / after it. If this is your first time connecting it will ask you to login and then will offer you the list of tables available in your Dataverse environment. I strongly advise transforming the tables to remove the columns you don’t need from your Dataverse tables.

You can connect to Dataverse using DirectQuery if you must. Often its not required and makes the report slow to edit. Yes I have opinions 😊.

### Weird Error

If you include the https:// or the final / or any other extras in the environment domain it will take ages to try and connect and then will come back with an error. The error refers to trying to connect to SQL server which will confuse users.

![](Power-BI-Dataverse-004.png)

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

