---
title: How much does that report cost the business?
description: In nearly every business across the world, staff give reports to managers. How many people assess the report cost? The reports will show how well or badly the business is performing. Accurate reporting is important in every organisation. Management needs to be able to make data-driven decisions.
slug: how-much-does-that-report-cost-the-business
date: 2021-07-06 15:04:41+0000
lastmod: 2025-02-14 11:54:17+0000
categories:
    - Power BI
---

In nearly every business across the world, staff give reports to managers. How many people assess the report cost? The reports will show how well or badly the business is performing. Accurate reporting is important in every organisation. Management needs to be able to make data-driven decisions.

![Lego characters hold a report and money to pay the report cost](Costs.jpg)

Every report comes with a cost. Is the report worth that cost? Could there be improvements in the process to lower the report cost? The biggest cost is probably the effort from the report builders. In this post I am not covering how to make a report useful, I am just looking at the report cost.

When I teach intro to Power BI I use a diagram to show the effort split. Far too often getting access to the data and transforming it into a structure you can model takes up more time than anything else.

![Pyrmis showing Getting the data and transforming the data take more time](Report-Effort-1024x628.png)Report Building Effort

In an ideal world the above diagram would be wrong. Anyone can access the data they need, it is all easy and quick and the data is well structured so only needs the very basic transformations. If that is the case, superb, well done. If you are guessing that is the case, please do go and ask your report builders, you might be surprised at the effort they put in.

### Get

In so many companies the above diagram is accurate and it doesn’t have to be. So let us look at the “Get” stage. Often the process of getting access to the data is hard work and involves politics galore and the bigger the company the worse it is.

![Lego character holding a map and binoculars](Discover-2.jpg)

Is there a process of requesting access to company data? Is there a self-service data option? Are the limitations on who is allowed to connect properly governed? Do your staff even know how to find the required raw data?

In one company there were 2 options, option one pay a yearly £10K per daily csv extract or option two extract the data in 10,000 rows blocks manually once you’ve worked out the queries you need to run. The option of connecting to an actual database wasn’t even an option. Its not a huge surprise they picked the 10,000 block extract option. So there were hours wasted every week of people extracting many blocks of data and sticking it back together. The hours were being done by highly skilled engineers who had better things to do.

In another company the report builder wasn’t actually allowed access to the data but was asked to create a report. So shared screens, remote control and lots of faff and a report was built, every change involved the same games. All in the name of security.

When I suggested the engineers time was worth more than 10K or pointed out the security was already broken, they shrugged their shoulders. No-one thought the management would or could do anything.

### Transform

Once you have access to the data, how much transformation is required to make the data usable?

![Lego character looking at a tile with hieroglyphs on it](hyroglyphs.jpg)

Let us start with a story. In this company big bookings are done on accounts, so the account needs to be recorded for discounts to be applied and account managers to get commission. The box to fill in the account name is free text and the business locations are across the world so the names are foreign to some. You can imagine the variations in spelling. So, every month the reporting team spend days refining their transformation routines to cope with new variations. Account managers spend hours doing multiple checks to make sure they have all their account booking assigned to them.

All it needed was a drop down box. The booking system design team and the reporting team were in no way connected except by very senior management and no-one was telling them. So every month the hours were wasted and the account managers stressed. Before you assume this is a small company in 2019 their turnover was 21 billion dollars.

This is one small example, I could bore you with hundreds of stories as could many of the data community. Badly captured data, extracts that are impossible to work with, constantly changing data structures are daily problems for report builders and often its due to a lack of big picture planning and people un-aware that data is used in a report.

### It only takes 20 minutes

![3 Lego characters holding 3 reports](three-reports.jpg)

My final story is from a company which had daily stand-ups on every production line. They were an important part of how that business functioned. There were a few charts produced daily and when I asked about them the reply came back “It only takes 20 minutes”.

So over the 5 day week that’s 100 minutes which isn’t bad and was easily absorbed. Now take a step back. That factory site had 12 production lines, now that becomes 1200 minutes, which is 20 hours. That is half a week. The reports were almost identical except filtered to a different production line, but they were all built separately and slightly different so not 100% comparable. Then you find out rolled up versions of the report were produced for every level of management.

Across that production site I worked out there was roughly 0.75 of a person being used to build that report. Was that a good use of that headcount?

### Telling the management the report cost

I was the external consultant being brought in to help. It was often assumed that the problem was a lack of skills. The problem was usually a lack of communication and an assumption that management wouldn’t fix it. When I had the opportunity to ignore the internal politics and talk to the senior management, things often got fixed. Even the grumpiest manager cares about time being wasted on pointless tasks. Sometimes it takes an external consultant to point out the obvious and reduce the report costs.

#### So managers please do the following :

- Look at the reports, if you don’t need them say so.

- If reports need changes, please say so. People like to hear changes because it means you value their work.

- Find your reports builders, no not their manager, find the actual builders. Ask if there is anything that could make it easier that you could initiate. Ask what their biggest challenge is, could you fix it?

- Is work being repeated? Do three of your team give you the same report just filtered differently? Perhaps you could facilitate a joint effort.

#### And report builders please do the following :

- Record the actual time it takes, including all the extras you forget and the problems you had last month.

- Talk to your report readers and ask for feedback, let them know the challenges.

- If ignored, brush up your CV.

## Last Word

The stories given in this post are just a very small sample of the issues I have seen that increase report cost. The solutions to fix many of the boring problems were not complex, they just required someone to to step back, ignore company politics and look at the bigger picture.

There are plenty of reporting challenges that cannot be fixed easily, that is where skilled data engineers and report builders do the magic they do. Copying and pasting data from one system to another or pressing that extract button every 3 minutes for 2 hours or manual typing in the list of 1000 exchange rates for this month is not that magic they love. Someone will offer them a better job with more chances to do data magic, and now your report cost just got much higher.

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

