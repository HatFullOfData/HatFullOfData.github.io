---
title: Power BI Dataflow – Create Dataflow from Export
description: There are times when you need to copy a dataflow from one workspace to another workspace. Power BI service provides a simple way to export the definition as a json file and then import. YouTube Version Export dataflow as json file In the workspace of the original workspace, click on the three dots next to the dataflow and select Export...
slug: power-bi-create-dataflow-from-export
date: 2020-11-28 23:15:04+0000
lastmod: 2025-02-14 12:04:30+0000
image: cover.png
categories:
    - Dataflow
    - Power BI
---

There are times when you need to copy a dataflow from one workspace to another workspace. Power BI service provides a simple way to export the definition as a json file and then import.

### Dataflow Series

This post is part of a series on dataflows.

- [Create a Dataflow](https://hatfullofdata.blog/power-bi-create-a-dataflow/)

- [Set up Dataflow Refresh](https://hatfullofdata.blog/power-bi-scheduled-refresh-dataflow/)

- [Endorsement](https://hatfullofdata.blog/power-bi-dataflows-endorsement-as-promoted-and-certified/)

- [Diagram View](https://hatfullofdata.blog/power-bi-dataflow-new-diagram-view/)

- [Refresh History](https://hatfullofdata.blog/power-bi-dataflow-refresh-history/)

- [Create Dataflow from Export JSON File](https://hatfullofdata.blog/power-bi-create-dataflow-from-export/)

- Incremental Refresh

### YouTube Version

[![YouTube thumbnail](Dataflow-Import-00.png)](https://www.youtube.com/watch?v=mteeKPNGIdM)

### Export dataflow as json file

![select export json](export_001.png)

In the workspace of the original workspace, click on the three dots next to the dataflow and select Export json. When the file is ready a message will appear in the top right.

![message to say export file is ready](export_002.png)

### Create dataflow from json file

![New Dataflow Import Model](export_003.png)

In the destination workspace click on the New dropdown and select dataflow. From the options then displayed select Import Model. Select a your json file. Once the json file has imported a message will appear in the top right.

![import successful](export_004.png)

Although your dataflow has been created you are left on the dataflow creation page. You need to return to the workspace to see your new dataflow.

![new dataflow from export](export_005.png)

### Check Credentials

The dataflow will not have refreshes setup as that is not part of the model. It is also recommended that you confirm that the credentials are correctly loaded. If you the dataflow is from another user or another tenancy you will need to re-login each credential.

![check credentials](export_006.png)

To check the credentials you need to click on the three dots next to your new dataflow and select Settings. In settings, expand Data source credentials. If any of the credentials have a cross next to them click on Edit credentials to re-login.

### Conclusion

Part of my work is to build dataflows to assist people fathom the depths of Microsoft Project data. The ability to export a dataflow means I have been able to transfer a solution between different teams across the company.

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

