---
title: Variable Libraries in Deployment Pipelines
description: How precisely does a variable library work with a deployment pipeline? This post walks through changing a value at different stages of your deployment.
slug: variable-libraries-in-deployment-pipelines
date: 2026-07-17 00:00:00+0000
lastmod: 2026-07-17 00:00:00+0000
image: cover.png
categories:
    - Microsoft Fabric
    - Variable Libraries
tags:
    - 2026-2027
---

So you've done the hard work of building a variable library to make all your Fabric artifacts not have hard coded values. This was promised to be the prep work for making deployment pipelines easier. So lets take a look how that works.

{{< variablelibrary-series current="6" >}}

## Scenario

For this post we are keeping the example very simple. We are building a process that ingests data from a file into a table. As part of that process the data is loaded into a dataframe called df. The variable library includes a RowLimit variable. If the RowLimit is 0 load all the data, otherwise trim the data to that many rows. This means in dev we can limit to a few rows but in test and prod we can have all the rows. Here is the code snippet that handles that logic.

```python
# Get RowLimit Value
vl = notebookutils.variableLibrary.getLibrary("Variable_Library")
RowLimit = vl.RowLimit
print(f"{RowLimit=}")

# If RowLimit has a value above 0, truncate the data
if RowLimit > 0:
    df = df.limit(RowLimit)
    print(f"Data limited to {RowLimit} rows")
```

## Setting up the Variable Library

I've created a variable library with a variable called RowLimit that is an integer and has a value of 5.

![Snapshot of the Variable Library](<variable library.png>)

When I run the code we get this

![Code block followed by the output RowLimit=5 and Data limited to 5 Rows](<code run.png>)

## Testing for zero

However confident we are on the logic we should test for 0 working. I do and I get the expected output of RowLimit=0 and no other text and all the data rows come through.

![Snapshot of the RowLimit 0 run](<code run rowlimit 0.png>)

## Adding Value Sets

A variable library can store different values for each variable in a value set. You can add multiple value sets, usually one for each deployment pipeline stage. In my example for dev I only want 5 rows of data, in test we will look at 20 and in prod I want no limit. Yes there probably should be a UAT with zero as well... this is just a demo!

> [!NOTE]Instructions
> 1. Click on Add value set on the ribbon
> 1. Enter a name and click Create
> 1. The value set appears with all the variable set to the same value as the Default value set.
> 1. Repeat for as many value sets you need.
> 1. Edit the values in datasets. The icon will turn black.
> 1. If you need to reset to default click on the black icon
> 1. Click Save and Agree if a warning appears.

![Snapshot of the above steps](<Add value set.png>)

## Deployment Pipeline

I've created a deployment pipeline and deployed to Test.

![snapshot of deployment pipeline showing all items in Test are the same as source, ie Dev](<deployment pipeline.png>)

## Changing Active Set

In order to use the different values for Test and Prod I need to change the active set in the variable library in the workspaces.

> [!NOTE]Instructions
> 1. Go to the Test workspace
> 1. Open the variable library
> 1. Click on the three dots on the Test set and select Set as active from the menu.
> 1. In the confirmation message that pops up, click Set as Active
> 1. not the active badge moves and the test set has a heavier border
> 1. Save the variable library

![Snapshots of the above instructions](<change set.png>)

The pipeline does not notice the change and any updates to the variable library from deploying from dev do not reset the active set.

If we now test the notebook in the test workspace we get 20 rows coming through because of the different value in the library.

![Picture of the code block with its output showing RowLimit=20 and Data limited to 20 Rows](<test run.png>)

> [!TIP]
> Always change the variable library values in your dev workspace and deploy the changes through the pipeline.

## Conclusion

This is the big reason Variable libraries are a must have in Fabric solution development. Even if you don't use deployment pipelines it is sometimes useful to be able to swap values.