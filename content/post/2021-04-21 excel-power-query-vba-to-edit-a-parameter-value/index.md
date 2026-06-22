---
title: Power Query – VBA to Edit a Parameter Value
description: This post is to document how to use Excel VBA to edit a parameter value without using the a cell reference in Power Query.
slug: excel-power-query-vba-to-edit-a-parameter-value
date: 2021-04-21 17:04:16+0000
lastmod: 2025-02-13 12:13:45+0000
image: cover.png
categories:
    - Excel
    - Power Query
    - VBA
---

This post is to document how to use Excel VBA to edit a parameter value without using the a cell reference in Power Query. My query was using Web.Contents which works with parameters in Excel Power Query1 but doesn’t like a function as part of the path.

I started with Chris Webb’s great post on using an Excel named range and Web.Contents gave me problems. I would try Chris Webb’s method first which is found here [https://blog.crossjoin.co.uk/2014/07/22/working-with-excel-named-ranges-in-power-query/](https://blog.crossjoin.co.uk/2014/07/22/working-with-excel-named-ranges-in-power-query/)

So I want a button to take the value from a cell and update the value in a parameter. I searched the web and found one solution buried in a MrExcel forum so I’m documenting the solution here mostly so I can find it again later.

### VBA Code to Edit a Parameter Value

Copy CodeCopiedUse a different Browser
```xml
Sub ChangeParameterValue(ParameterName As String, ParameterValue As String)

    Dim qry As WorkbookQuery
    Dim formula As Variant
    
    '=== Get the query
    Set qry = ThisWorkbook.Queries(ParameterName)
    
    '=== Split the formula into 3 parts and update the second one
    formula = Split(qry.formula, Chr(34), 3)
    formula(1) = ParameterValue
    
    '=== Update the parameter value
    qry.formula = Join(formula, Chr(34))
    
End Sub
```

### Description

The formula property of a query is really weird and hard to construct so the above function splits on Chr(34), which is a “. It then updates the middle value to the new value and then sticks the three values back together again.

The original forum post I got the solution from can be found at [https://www.mrexcel.com/board/threads/vba-code-to-edit-power-query-data-source-settings.1146964/](https://www.mrexcel.com/board/threads/vba-code-to-edit-power-query-data-source-settings.1146964/)

Footnotes

1 – Web.Contents varies in different versions of Power Query so test carefully and do not assume you can copy and paste queries.

## More Power Query Posts

- [Custom Handwritten Function](https://hatfullofdata.blog/power-query-handwritten-function/)

- [Multi-step Function](https://hatfullofdata.blog/power-query-multi-step-function/)

- [Replace Values for Whole Table](https://hatfullofdata.blog/power-query-replace-values-for-whole-table/)

- [AI Insights Error](https://hatfullofdata.blog/power-query-ai-insights-error/)

- [VBA to Edit a Parameter Value](https://hatfullofdata.blog/excel-power-query-vba-to-edit-a-parameter-value/)

- [Dynamic Data Source and Web.Contents()](https://hatfullofdata.blog/power-query-dynamic-data-source-and-web-content/)

- [Get Previous Row Data](https://hatfullofdata.blog/power-query-get-previous-row-data/)

- [Creating New Parameters](https://hatfullofdata.blog/power-query-creating-new-parameters/)

- [Fixing Missing Columns Dynamically](https://hatfullofdata.blog/power-query-fixing-missing-columns-dynamically/)

- [Handling Null Values Properly](https://hatfullofdata.blog/power-query-handling-null-values/)

