---
title: SVG in Power BI Part 6 – New Icon Conditional Formatting
description: In July 2019 Power BI Desktop update they included new conditional formatting on table and matrix to include icons. These icons can be defined using SVG which is pretty cool. So this is a new post in my Power BI SVG series looking how we can use SVG icons in conditional formatting.
slug: svg-in-power-bi-6-icon-conditional-formatting
date: 2019-08-06 10:37:05+0000
lastmod: 2025-02-14 12:47:08+0000
image: cover.png
categories:
    - Power BI
    - SVG
---

{{< svg-series current="6" >}}

In July 2019 Power BI Desktop update they included new conditional formatting on table and matrix to include icons. These icons can be defined using SVG which is pretty cool. So this is a new post in my Power BI SVG series looking how we can use SVG icons in conditional formatting.

## Quick Overview of Icon Conditional Formatting

Once you have added a table or matrix visual to your report you can in formatting in the Conditional Formatting Section turn on Icons. This will immediately add icons to the selected column. In the example below icons were added to Turnover column.

![icons](icons_00.png)

Clicking on Advanced controls link opens options behind the selection of icons. The default rules are for 3 icons at 
![icon rules](icons_01.png)

In this post though I’m looking at using SVG to define and select the icon. So I will not be using rules but will be using a measure. The example is going to be based on a measure written in a previous post, [KPI Shapes in Power BI](https://hatfullofdata.blog/svg-in-power-bi-part-2/) The measure decides on an up or down arrow based on another measure called Growth.

```xml
Arrow = 
// Variables to store arrow paths
var uparrow = ""
var downarrow = ""

// Select arrow to use
var arrow = IF([Growth]>=0,uparrow,downarrow)

// Insert arrow into SVG
var svg ="data:image/svg+xml;utf8," &
         ""
            & arrow & 
         ""

RETURN svg
```

![arrow icons](SVG_206.png)

The arrow is in its own column and doesn’t resize with font sizes. With the Icon update we can add the icon to any column.

![conditional formatting icons](icons_03.png)

- Select your table visual

- In visual format, expand Conditional Formatting

- Select the column and turn on Icons

- Click on Advanced Controls

- Change Format to Field Value

- Change Based on Field to the measure, eg Arrow

- Click OK

![based on field value](icons_02.png)

![added icons](icons_04.png)

## Conclusion

Icons update is an exciting one and much needed. It cuts out the need for SVG for many, which is great. Now with a little SVG we can add some conditional formatting without having to add the extra column.


