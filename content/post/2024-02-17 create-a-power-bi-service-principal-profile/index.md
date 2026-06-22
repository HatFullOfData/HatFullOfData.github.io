---
title: Create a Power BI Service Principal Profile
description: For Power Automate to use the Power BI Rest API it needs a service principal profile. This is created by creating an app registration that has the right permissions. This allows an app, e.g. Power Automate, to establish a trust relationship with the Microsoft identity platform. This is done using Entra Admin Center (previously known as Active Directory) This post...
slug: create-a-power-bi-service-principal-profile
date: 2024-02-17 18:18:23+0000
lastmod: 2025-02-14 11:12:31+0000
image: cover.png
categories:
    - Power Automate
    - Power BI
---

For Power Automate to use the Power BI Rest API it needs a service principal profile. This is created by creating an app registration that has the right permissions. This allows an app, e.g. Power Automate, to establish a trust relationship with the Microsoft identity platform. This is done using Entra Admin Center (previously known as Active Directory)

This post is part of the [Power Automate and Power BI Rest API series](https://hatfullofdata.blog/power-automate-and-power-bi-rest-api/)

## Create App Registration for Service Principal

Navigate to [https://entra.microsoft.com/](https://entra.microsoft.com/). Then in the menu expand Identity and under that Applications. Finally click on App Registrations to open the list of App Registrations. It defaults to list registrations owned by you.

![App Registration list](2024-02-11_18-49-28.png)

Click on New registration to start creating your App registration. Enter a name for your application, remember to make clear as over time the list will grow. Leave rest of the options as default and press the Register button.

![Entering App Registration name and register](2024-02-11_19-01-35.png)

## Change App Registration Ownership

It is recommended that you add owners to the registration. Click on Owners, then click on Add Owners and select the owners. App owners and administrators can view and edit app registrations.

![list of app registration owners](2024-02-11_19-41-28.png)

## Adding API Permissions

Permissions need to be given to the App Registration based on what you want to do. The Power BI Rest API documentation at [https://learn.microsoft.com/en-us/rest/api/power-bi/groups/create-group](https://learn.microsoft.com/en-us/rest/api/power-bi/groups/create-group) states you need Workspace.ReadWrite.All.

Click on API Permissions and then click on Add a permission. When the list of APIs appear, select Power BI service. Then select Delegated permissions and from the list of permissions select Workspace.ReadWrite.All. It is good practice to only add the permissions you need.

![Adding an API permission steps](2024-02-11_20-12-40.png)
			
				## Adding a Secret

The final step in App Registration is to add a secret. This will be required by anyone using the app registration.

Click on Certificates & secrets, then click on New client secret. Enter in a description, I chose to keep the default 6 months expiration. Click Add to finish creating the secret.

Once the list appears you must copy the secret value. This is the only chance you get.

![Adding a secret to the service principal profile](2024-02-11_20-38-15.png)

## Important Information

You will need the Secret value copied from the last section and the Tenant ID and Client ID. The final 2 values can be found by clicking on Overview. These values especially the secret need to be kept secure. So the next post is how to create an Azure Key Vault to store the values.

![Finding the Client ID and Tenant ID](2024-02-11_21-07-52.png)

## Conclusion

Understanding how App Extensions and Service Principals work is very useful not only for Power BI Rest api. The Microsoft Graph api can also be accessed using a service principal but that is a whole different series.

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

