---
title: Microsoft Fabric – Create a Lakehouse
description: Lakehouses are one of the main building blocks in Microsoft Fabric. A lakehouse allows you to store structured and unstructured data in a single location. In this post we are going to create an empty one. Future posts will populate it. YouTube Version Empty Workspace with a Fabric Capacity We start in an empty workspace that has a capacity assigned...
slug: fabric-create-a-lakehouse
date: 2023-11-02 22:43:20+0000
lastmod: 2025-02-11 18:40:05+0000
categories:
    - Microsoft Fabric
---

Lakehouses are one of the main building blocks in Microsoft Fabric. A lakehouse allows you to store structured and unstructured data in a single location. In this post we are going to create an empty one. Future posts will populate it.

## Microsoft Fabric Quick Guides

- [Create a Lakehouse](https://hatfullofdata.blog/fabric-create-a-lakehouse/)

- [Load CSV file and folder](https://hatfullofdata.blog/fabric-upload-a-file-and-folder/)

- [Create a table from a CSV file](https://hatfullofdata.blog/fabric-create-table-from-csv-file/)

- [Create a Table with a Dataflow](https://hatfullofdata.blog/microsoft-fabric-create-tables-with-dataflows/)

- [Create a Table using a Notebook and Data Wrangler](https://hatfullofdata.blog/microsoft-fabric-notebook-and-data-wrangler/)

- Exploring the SQL End Point

- Create a Power BI Report

- Create a Paginated Report

## YouTube Version

[![](Fabric-Create-a-Lakehouse-Time-0_00_0000.png)](https://youtu.be/Rafh8RRBrj8)

## Empty Workspace with a Fabric Capacity

We start in an empty workspace that has a capacity assigned to it. A jewel logo next to the workspace name or checking the workspace settings are indicators that it has a capacity. A premium per user capacity does not include all Fabric features.

![Workspace title with a jewel logo and a screen shot of the premium workspace settings highlighting Fabric and Trial capacity options](2023-10-23_20-42-18.jpg)

## Create a Lakehouse

There are two ways to start creating a lakehouse. First method is to click New in the top left of the workspace area, by default it shows Power BI options so click on More options. When the screen updates, on the second row is Lakehouse.

![showing the dropdown from the New button with More options highlighted and a screen grab of the new screen with Lakehouse button highlighted.](2023-10-23_20-55-22.jpg)

The second option is switch the experience in the bottom left of the screen to show all the Experiences. When the menu pops up, select Data Engineering. Then the screen will update and show a slightly different Lakehouse button.

![Screen grab showing the experience button and the menu of expereinces with Data Engineering highlighted and an arrow pointing at a screen grab of the Lakehouse button](2023-10-23_21-01-17.jpg)

The next step in the create a lakehouse process is to name the lakehouse. The name can only include letters, numbers, and underscore. It will display an error message to correct you. Enter the name and click Create. Then wait a few moments and you will get your empty lakehouse.

![New Lakehouse dialog to enter in the name, with a Create button and then an arrow pointing to a screengrab of the Explorer pain showing LGB_Customers tree with a Tables and Files folder](2023-10-23_21-10-33.jpg)

## What is created?

Every lakehouse created in Fabric also creates an SQL Endpoint and a Power BI Dataset. Even though we have not added data the containers are already there to handle the data.

![Lineage view of the three items. On the left is the Lakehouse with an arrow to the SQL Endpoint in the middle and the dataset on the right.](2023-10-23_21-17-04.jpg)

## References

Microsoft’s Lakehouse Overview – [https://learn.microsoft.com/en-us/fabric/data-engineering/lakehouse-overview]( https://learn.microsoft.com/en-us/fabric/data-engineering/lakehouse-overview)

