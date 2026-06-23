---
title: PowerApps – Transparency Update
description: Post describing the update to ColorValue to include transparency and the addition of transparent colour.
slug: powerapps-transparency-update
date: 2019-06-07 17:53:58+0000
lastmod: 2025-02-14 13:50:12+0000
image: Trans_02.png
categories:
    - Power Apps
---

A small update was sneaked in this week to help handling transparency with colours in PowerApps.

### ColorValue Function Update

ColorValue function takes a colour value as a hex string and converts it into a colour values. In the example below #FF0000 fills a rectangle in Red.

![red rectangle](Trans_01.png)

The update now allows another 2 characters to the string to specify transparency. Like the red,green and blue values the transparency ranges from 0 to 255 or in hex 00 to FF

In the example below the red is made 50% transparent, 80 in HEX is 128 in decimal which is 255 / 2, hence 50%.

![overlapping rectangles](Trans_02.png)

### Transparent Colour

In the list of available preset colours such as AliceBlue, Aqua etc now includes a colour Transparent.

![transparent colour](Trans_03.png)

### Conclusion

Small update but one thats very welcome! Now I just want to be able to use ColorFade or similar function to take an existing fill and give a more or less transparent version.