---
title: SVG in Power BI Part 7 – Using a Theme File to add SVG Icons
description: As part of the July 2019 update there were changes to conditional formatting. In this post I am going to cover adding to or swapping the built in icons using a theme file and some SVG.
slug: svg-in-power-bi-7-using-theme-file-svg-icons
date: 2019-08-13 13:01:24+0000
lastmod: 2025-02-14 12:46:47+0000
image: cover.png
categories:
    - Power BI
    - SVG
    - Updates
---

As part of the July 2019 update there were changes to conditional formatting and I covered the use of SVG based measures to add icons in part 6 of this series. In this post I am going to cover adding to or swapping the built in icons using a theme file and some SVG.

- [Introduction to SVG Basics](https://hatfullofdata.blog/svg-in-power-bi-part-1/)

- [KPI Shapes in Power BI](https://hatfullofdata.blog/svg-in-power-bi-part-2/)

- [Filling up with colour using SVG in Power BI](https://hatfullofdata.blog/svg-in-power-bi-part-3/)

- [Using Text in SVG](https://hatfullofdata.blog/svg-in-power-bi-part-4/)

- [Using SVG Rotate to create a dial in Power BI](https://hatfullofdata.blog/svg-in-power-bi-part-5/)

- [SVG Icons in Conditional Formatting](https://hatfullofdata.blog/svg-in-power-bi-part-6-new-icon-conditional-formatting/)

- [Using a Theme to add SVG Icons](https://hatfullofdata.blog/svg-in-power-bi-part-7-using-theme-svg-icons/)

- [Feb 2023 Update – 5 SVG Stars](https://hatfullofdata.blog/power-bi-5-stars-svg/)

### Overview of Theme Files

Theme files are a JSON file with instructions for formatting your visuals. The formatting can include colours, fonts and now icons. Details of how to construct and use a theme file can be found in the links below.

[https://docs.microsoft.com/en-us/power-bi/desktop-report-themes](https://docs.microsoft.com/en-us/power-bi/desktop-report-themes)

[https://powerbi.tips/tools/report-theme-generator-v3/](https://powerbi.tips/tools/report-theme-generator-v3/)

### Adding New SVG Icons

Icons is a new section for the theme file. It is at the same level as the name. You need a name, url and description for the icon. I can see no evidence of the name or description being used. Please correct me if I am wrong.

The url can be SVG code in a similar format to the measures from previous posts. So in this example my first icon is a red quarter of a circle. Below is the SVG code for the shape.

Copy CodeCopiedUse a different Browser
```xml
data:image/svg+xml;utf8, 

    ```

A simple theme file to create one extra icon would look like

Copy CodeCopiedUse a different Browser
```xml
{
    "name": "New Icons",
     "icons": {
          "complete025": {
               "url": "data:image/svg+xml;utf8, ",
               "description": "25% Complete"
          }
	}
}
```

This adds a single icon to the icons available in conditional formatting. It will be listed at the end of the icon list.

![icons list](icons_21.png)

I then expanded the list of icons to cope with 25%, 50%, 75% and 100% going from red through amber to green.After applying the the theme to my report I created conditional formatting rules to a table to use my new icons.

Copy CodeCopiedUse a different Browser
```xml
{
     "name": "Percent Icons",
     "icons": {
          "complete025": {
               "url": "data:image/svg+xml;utf8, ",
               "description": "25% Complete"
          },
          "complete050": {
               "url": "data:image/svg+xml;utf8,  ",
               "description": "50% Complete"
          },
		  "complete075": {
				"url":"data:image/svg+xml;utf8,  ",
				"description":"75% Complete"
		  },
         "complete100": {
               "url": "data:image/svg+xml;utf8,  ",
               "description": "100% Complete"
         }
     }
}
```

![Conditional formatting rules](icons_23.png)

![table showing icons](icons_22.png)

## Conclusion

Adding a few extra icons to report is great. I am concerned that adding lots of complex icons will just make the report slow.

In Microsoft’s announcement they say you can replace existing icons using a theme file. For this you need the resourceKey for the icons. I have not been able to find a list of icons and the example they give didn’t work for me.

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

