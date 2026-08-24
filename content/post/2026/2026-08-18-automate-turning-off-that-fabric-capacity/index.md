---
title: Use Power Automate to schedule pausing a Fabric Capacity
description: Learn how to use Power Automate to automatically pause a Microsoft Fabric capacity on a schedule and save costs. This step-by-step guide shows how to check the current capacity state and only suspend it when it is Active.
slug: power-automate-pause-fabric-capacity-schedule
date: 2026-08-18 00:00:00+0000
lastmod: 2026-08-18 00:00:00+0000
image: cover.png
categories:
    - Microsoft Fabric
    - Power Automate
tags:
    - 2026-2027
---

I have a Fabric capacity I use for demos, write this blog and to learn. I am forever forgetting to turn it off. For companies this could be that dev or training capacity that is pay as you go and should only be on when its required. This is a simple cost saving automation. For this post I am assuming you are the capacity admin so therefore can pause and resume it manually. 

## Capacity Details

Power Automate is going to want certain details in order to know which capacity you are referencing. Head to the azure portal and find your capacity. You will need three details from the Overview page. 

- Subscription
- Resource group
- Resource Name

![Snapshot of the overview page of my capacity](<capacity details.png>)

## Create the Flow

In Power Automate we are going to create a scheduled flow that runs at 2am UK time that checks the status of the capacity and if it is not paused we will pause it. First step is to create the flow with a trigger.

> [!NOTE]Instructions
> 1. Go to [https://make.powerautomate.com/](https://make.powerautomate.com/)
> 1. Click in + Create on the left hand side menu
> 1. Select Scheduled cloud flow
> 1. Enter in a name for your flow
> 1. Enter in the time, eg 11pm and the repeat eg 1 day
> 1. Click Create

![Screenshots of the above instructions](<create flow.png>)

## Check Capacity Status

This opens up the flow editor with your trigger at the top. Next we are going to add a step to save the name of our capacity and then a step to check on the current status

> [!NOTE]Instructions
> 1. Add a initialize variable step
> 1. Enter in a name for the variable, eg Capacity Name and  Select String for the Type.
> 1. Put the name of the capacity, which we found earlier, as the value.
> 1. Remember to rename your step, future you will thank you.

![Snapshot of the above steps](<capacity name.png>)

> [!NOTE]Instructions
> 1. Add an action from the Azure Resource Manager called Read a Resource
> 1. If this is the first time using this connector, login using OAuth.
> 1. From the drop downs select the matching Subscription and Resource Group
> 1. For the Resource Provider, select Microsoft.Fabric
> 1. Into Short Resource Id put in capacities/ followed by the variable Capacity Name we initialised earlier.
> 1. Client Api Version is 2023-11-01, got from the documentation in the resources below.
> 1. Remember to rename your step

![Snapshot of the above steps](<Read resource.png>)

### Test it

You are now ready to do the first test run. Don't worry about the output of the steps, we just want to see the three green ticks.

![Snapshot of the flow run showing 3 green ticks](<test run 1.png>)

## Parse the Answer

From the read a resource step all we want to know is the status of the capacity. That piece of information is buried in nested Json. We could drill down to find that multiple ways, my favourite is using a Parse JSON step but to make this work we need to do a compose first.

> [!NOTE]Instructions
> 1. Add a compose step to your flow
> 1. In the inputs, select dynamic content.
> 1. Read a resource step will only show 6 values, click see more(25) to see the rest.
> 1. Select Properties
> 1. Rename your flow <sup>1</sup>
> 1. Run the flow

![snapshot of the above steps](<compose step.png>)

Running the compose step will give us the JSON we need to create the schema in the Parse JSON step. This is a pattern I use all the time.

> [!NOTE]Instructions
> 1. In the run results, click on the Compose step.
> 1. In the Outputs click on the copy button
> 1. Edit you flow and add a Parse JSON step
> 1. In the Content add the same Properties you added to the compose
> 1. Below the schema box, click on Use sample payload to generate schema
> 1. Into the dialog paste the output from the run and click Done. This will have populated the schema box
> 1. Do that rename magic<sup>1</sup>
> 1. Run the flow.
> 1. If the run was successful you can delete the compose step. It is no longer required.

![Snapshots of the above steps](<Parse JSON.png>)

## Turn it Off

The Parse JSON step will have fetched us the State in an easy form to use in dynamic content. The next step is to check to see if it is Active and if so pause the capacity.

> [!NOTE]Instructions
> 1. Add a Condition step from the Control Connector
> 1. In the Choose a value box, click on dynamic content and then select Body state from the Parse JSON list.
> 1. Select "is equal to" as the operator
> 1. Type in Active as the value
> 1. Rename :)

![snapshot of the above steps](<Conditional Step.png>)

You will now have a condition action with two parts True and False. We want to add an action to the True side to turn out capacity off.

> [!NOTE]Instructions
> 1. Click on the plus in the True side of the condition
> 1. Select Invoke resource operation from Azure Resource Manager
> 1. Similar to the previous time select Subscription, Resource Group and Resource Provider.
> 1. The Short Resource Id and Client Api Version are also the same
> 1. The action name is suspend. 
> 1. You will now have an action, of course renamed, in the True side of the condition.

![snapshot of the above steps](<invoke action.png>)

## Test it

Now the flow is complete. Make sure the capacity is Active and do a test run and see if it has been paused. It is also worth checking a second run on with it already paused that it doesn't try to do it again.

![snapshot of the flow run with green ticks in all the right places](<final test.png>)

## Use Cases and Turning it back on

For me this flow is a real simple turn of my demo fabric capacity every evening. Within a company this could be a capacity that is for a single process, when that process is complete turn off the capacity. Of course that probably means you need a similar flow to activate the capacity again. The action name for that is Resume. See the resources for more details.

## Resources

- [Microsoft Learn - Fabric Capacities - Suspend](https://learn.microsoft.com/en-us/rest/api/microsoftfabric/fabric-capacities/suspend?wt.mc_id=DX-MVP-5003563)
- [Microsoft Learn - Power Automate Connector - Azure Resource Manager](https://learn.microsoft.com/en-us/connectors/arm/?wt.mc_id=DX-MVP-5003563)


## Conclusion

This post was to solve a particular problem for me and my capacity, Which unlike most capacities spends most of its time paused. But there are examples in business when we need to automate firing up a capacity, possibly moving a workspace to it and then reversing that.

If this was to be a enterprise production flow I would expect there to be a try catch finally pattern used. It could also be made more re-usable by parametrising the subscription and resource group ids and the capacity name and making this a child flow.

<hr>

### Footnotes

<sup>1</sup> Yes I nag you to rename steps, future you will thank you. I promise