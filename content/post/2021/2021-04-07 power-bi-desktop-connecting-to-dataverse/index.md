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

![screenshot of error](Power-BI-Dataverse-004.png)

