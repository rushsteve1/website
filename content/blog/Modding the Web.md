+++
title = "Modding the Web"
date = 2022-02-02
[taxonomies]
category = ["programming"]
tags = ["web", "javascript", "userscripts"]
+++

I've known for a while that browser plugins for [Userscripts](https://en.wikipedia.org/wiki/Userscript) and Userstyles exist and have some really dedicated fans, but I never really saw the point and didn't give them a fair shake for a long time.
After seeing a Hacker News comment about redirecting Arxiv to an HTML variant that mentioned using Userscripts, I decided to give it a try for the first time in many years.

Though I immediately hit a hurdle: There are several Userscripts plugins, and a few different Userstyles plugins as well...

## Picking a Plugin

Since I am using Firefox I just sort of browsed around AMO and looked up comparison threads. Here's what I basically came up with:

- [**GreaseMonkey**](https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/) the original of the bunch. Apparently it's now somewhat outdated and development is slow. Saw multiple mentions to the latest version being feature-lacking, but also couldn't find anything to support that.
- [**TamperMonkey**](https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/) the most popular by far. Seemed nice overall, but is closed-source which kills my interest.
- [**ViolentMonkey**](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) a newer open-source plugin. Interface was quite nice, and for non-Firefox browsers this would probably be my choice, but more on that below.

There were also a few Userstyles plugins:

- [**Stylish**](https://addons.mozilla.org/en-US/firefox/addon/stylish/) the original, but has gone close-source into some kind of freemium model or something? I remember people being upset when this happened a few years ago.
- [**Stylus**](https://addons.mozilla.org/en-US/firefox/addon/styl-us/) open-source version of Stylish that continues where it's predecessor left off.

But in my surfing and searching I found a winner: [**FireMonkey**](https://addons.mozilla.org/en-US/firefox/addon/firemonkey/).

- Open-source
- Supports both Userscripts AND Userstyles
- From a reputable developer
- Frequently updated
- Lightweight
- Uses the [Firefox user-scripts API](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/userScripts/Working_with_userScripts)
- Nice interface

It seems notably less popular than many of the other options, which is a shame since it's been nothing but great so far!
Only supports Firefox because it uses a specific API, but that's not really a problem for me.

## The Fun Starts

OK, now that we're back on track the actual fun begins. Userscripts allow you to run arbitrary JS on any page, Userstyles do the same for CSS. First you define a meta-data block with the pages the script should run on, and then an JavaScript that you want. This means that with FireMoneky you can basically do... anything. You can completely re-write the looks and functionality of any web-page you want.

I've been using it to do a number of things already

- Redirect various websites that I don't like (Twitter, Reddit) to lighter-weight alternatives
- Add buttons to websites that redirect to searches, like a button on Steam that opens IsThereAnyDeal.
- Create shortcuts for DuckDuckGo `!bangs`
- Force misbehaving websites into their light-modes

The possibilities are really endless, and I've barely even touched using Userstyles yet.

### Writing and Debugging

Since you can write and debug Userscripts right in the browser, the process is actually really fun. Using inspect-element to find the right place, nab style classes so your additions match, and debug errors immediately is a great feedback loop. It really kinda highlights how nice browser tools are these days, and how pleasant writing vanilla JavaScript can be.

Since FireMonkey uses the user-script API built into Firefox, you can even inspect and set breakpoints right in your script without touching the JS on the page itself (though FireMonkey does give you this option as well).

## The Real Magic is in your Head

As a developer I know that the web is malleable, that I have the sources and structure and that they're running on my machine where I can edit them. But you still end up treating web pages as published artifacts, static things that you have no control over.

That's the real beauty and fun of Userscripts/styles. You can re-take the web, mod it and bend it to your will. Add features that the site's developers never will because it goes against what they want, or because only you care.

### <abbr title="For Example">*Exempli Gratia*</abbr>

A great example of a feature that the site itself will never add is a button on Steam that links to the game on IsThereAnyDeal so that you can compare prices. Below is the code and a picture of the button on the Steam page. All my other Userscripts can be [found in the repo here](https://repo.rushsteve1.us/dir?ci=tip&name=user-scripts) if you'd like to take a look, feel free to take ones you like as well!

```js
// ==UserScript==
// @name             Steam IsThereAnyDeal
// @match            https://store.steampowered.com/app/*
// @version          1.0
// @grant            none
// @run-at           document-end
// ==/UserScript==

const title = encodeURI(document.getElementById("appHubAppName").innerText);

const template = document.createElement("template");
template.innerHTML = `
  <a href="https://isthereanydeal.com/search?q=${title}" class="btnv6_blue_hoverfade btn_medium" target="_blank">
    <span>IsThereAnyDeal</span>
  </a>
`.trim();

document.querySelector(".apphub_OtherSiteInfo").appendChild(template.content.firstChild);
```

![ A Screenshot of Steam with the IsThereAnyDeal button ](https://repo.rushsteve1.us/attachdownload/steam-screenshot.png?page=Modding+the+Web&file=steam-screenshot.png)
