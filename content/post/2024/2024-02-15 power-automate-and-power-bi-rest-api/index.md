---
title: Power Automate and Power BI Rest API
description: The Power BI Rest API provides the ability to create a workspace. Power Automate includes an action to make a HTTP call, i.e. a Rest API. So we should be able to get a flow to create a workspace. So that was my goal. Writing the first flow and getting it to work involved so many little steps I had...
slug: power-automate-and-power-bi-rest-api
date: 2024-02-15 14:28:37+0000
lastmod: 2025-02-14 11:13:28+0000
image: cover.png
categories:
    - Power Automate
    - Power BI
---

The Power BI Rest API provides the ability to create a workspace. Power Automate includes an action to make a HTTP call, i.e. a Rest API. So we should be able to get a flow to create a workspace. So that was my goal. Writing the first flow and getting it to work involved so many little steps I had to write blog posts so I would remember the steps.

## Power BI Rest API Documentation

The documentation refers to workspaces as groups and can be found at [https://learn.microsoft.com/en-us/rest/api/power-bi/groups/create-group](https://learn.microsoft.com/en-us/rest/api/power-bi/groups/create-group). It states that the API can be called by a service principal profile and the required scope is Workspace.ReadWrite.All.

![Screen shot from the Power BI rest api documentation](2024-02-17_17-34-46.png)

## Other Settings

You also need to make some changes to Power BI tenant settings as well and I’d recommend creating a security group and using Azure Key Vault to store the credentials. That would make a very long blog post so I’m breaking it down into separate posts.

- [Create a Power BI Service Principal Profile](https://hatfullofdata.blog/create-a-power-bi-service-principle-profile/)

- [Create Key Vault to store Tenant ID, Client ID and Secret](https://hatfullofdata.blog/create-azure-key-vault-to-store-tenant-id-client-id-and-secret/)

- [Write a flow to fetch the Key Vault Values](https://hatfullofdata.blog/use-power-automate-to-fetch-secrets-from-key-vault/)

- [Update Power BI Settings and Create a Security Group](https://hatfullofdata.blog/allow-the-use-of-power-bi-rest-apis/)

- Write a flow to create the workspace

- Extras for the workspace

## Final Power Automate Flow

The final flow, after post 5, fetches the Service Principal credentials using a child flow, then uses HTTP action to create the workspace and with a bit of parse json action magic uses another HTTP action to change the permissions.

![5 step flow as described in the previous paragraph](2024-06-18_14-19-17.png)

The above flow has flaws, no error handling, no checking the workspace name is allowed and no notifying the admin they have a new workspace.

## Next Steps

This is a simple example of using Power Automate with Power BI rest API to perform some admin tasks. This could easily be extended to include other boring admin tasks.

## More Power Automate Posts

- [Creating Adaptive Cards](https://hatfullofdata.blog/microsoft-flow-creating-adaptive-cards/)

- [Refreshing Datasets Automatically with Power BI Dataflows](https://hatfullofdata.blog/refreshing-datasets-automatically-with-dataflow/)

- [Power Automate Child Flow](https://hatfullofdata.blog/power-automate-child-flow/)

- [Get data from a Power BI dataset](https://hatfullofdata.blog/power-automate-get-data-from-a-power-bi-dataset/)

- [Power Automate Button in a Power BI Report](https://hatfullofdata.blog/power-automate-button-in-a-power-bi-report/)

- [Write Me a Flow](https://hatfullofdata.blog/power-automate-write-me-a-flow/)

- [Power Automate and DevOps series](https://hatfullofdata.blog/connecting-power-automate-to-devops/)

- [Power Automate and Power BI Rest API series](https://hatfullofdata.blog/power-automate-and-power-bi-rest-api/)

- [Save a File to OneLake Lakehouse](https://hatfullofdata.blog/power-automate-save-a-file-to-onelake-lakehouse/)

- [Trigger Microsoft Fabric Data Pipeline using Power Automate](https://hatfullofdata.blog/trigger-microsoft-fabric-data-pipeline/)

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

