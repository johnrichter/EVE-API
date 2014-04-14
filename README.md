# EVE API 
######*An Objective-C REST library EVE Online APIs.*

## What is EVE Online?

[EVE Online](www.eveonline.com) is a video game by [CCP Games](www.ccpgames.com). It is a player-driven, persistent-world MMORPG set in a science fiction space setting. Characters pilot customizable ships through a galaxy of over 7,500 star systems.  Most star systems are connected to one or more other star systems by means of stargates. The star systems can contain moons, planets, stations, wormholes, asteroid belts and complexes.

Players of Eve Online can participate in a number of in-game professions and activities, including mining, piracy, manufacturing, trading, exploration, and combat (both player versus environment and player versus player). The character advancement system is based upon training skills in real time, even while not logged into the game.  *--[Wikipedia](http://en.wikipedia.org/wiki/Eve_Online)*

## Purpose

EVE Online is unique in the way that it approaches its player base.  The time, energy, effort, and dedication a player must have to conquer the complex challanges is immense.  To help players with the learning and difficulty curve, CCP Games developed a detailed set of XML-based endpoints to serve as a gateway for players to plan and maintain their characters.  When combined with the [Fansite Toolkit](http://community.eveonline.com/community/fansites/toolkit) these API's can be used with data-mining and analytic techniques to recreate the in-game tools in an out-of-game setting.

A special circumstance to note is that EVE Online is a heavy meta-game.  It is common for players to spend and equal amount of time interacting with the community.  A unique occurance that has manifested is the use of espionage during times of war between mega-corporations and alliances of players who own swathes of the in-game universe.

Several example tools:
 - [EVE-Central: The EVE-Online Market Aggregator](http://www.eve-central.com) 
  * A croud sourced market and economy scraper
 - [EVE Character Appraiser](http://gemblog.nl/skill/)
  * Discover how much your character is worth in the in-game currency (ISK)
 - [NULL-SEC](http://null-sec.com/)
  * An in devlopment tool aimed to track characters and enable out-of-game, in-browser spaceship configuration.
 - [EVE-Cost](http://www.eve-cost.eu/)
  * An industry management tool.
 - [Somer-Blink](http://cogdev.net/blink/?act=bonk)
  * An ISK based gambling site.
 - [EVE Kill](http://eve-kill.net/)
  * A live feed of every character that has had their spaceship or body destroyed in the game.
 - [Z-Killboard](https://zkillboard.com/)
  * Similar to EVE-Kill
 - [EVE Eye](https://eveeye.com/?/welcome.asp)
  * An incredibly detailed solar system data base and activity monitor that, if given permission, can access a characters location live while a player plays the game.

## Motivation

This EVE API library is not an original idea.  The most widely used, respected, and nearly *required* tool is called [EVEMon](http://evemon.battleclinic.com) and is entirely focused on character management.  It allows a player to manage every character they have across all accounts, including skill planning, finance management, 'eve-mail', asset management, and much more.  The problem with this tool is that unlike the game client itself, EVEMon is a Windows only tool.  Separate efforts have been undertaken to bring an EVEMon-like experience to the Mac only to be abandoned since creation several years ago.

As such, this EVE API exists as a prerequesite to a new application intended to be the core of a new character management application.  In addition, another application has been planned to take advantage of the large supply of live data being delivered via these API's.  This analytical application will help answer questions such as: Is member X in corporation Y a spy for corporation Z? or: How will the past, current, or upcoming war's affect the EVE economy? These applications will target both Windows, Linux, and Mac players that want to manage their characters via the Apple desktop or laptop devices.  Migration to the iOS environment has been planned, but not designed.

This Objective-C libraray is intended to be free, distributed, and used with other third party Mac tools developed by the EVE Online player base.

## The API

EVE API will implement and be able to handle all API's as recorded [here](http://wiki.eve-id.net/APIv2_Page_Index).  

Additional Resources
 - [Evelopedia](https://wiki.eveonline.com/en/wiki/Main_Page)
 - [Fansite Toolkit Static Data Export](http://community.eveonline.com/news/dev-blogs/eve-universe-static-data-export)
 - [Blueprint Developer Blog](http://community.eveonline.com/news/dev-blogs/2324)
 - [API Keys](http://community.eveonline.com/news/dev-blogs/2383)
 - [EVE 3rd-Party Developer Info](https://forums.eveonline.com/default.aspx?g=posts&t=6375&find=unread)
 - [EVE Technology and Research Center](https://forums.eveonline.com/default.aspx?g=topics&f=263)
 - [Official EVE API Documentation (incomplete)](https://wiki.eveonline.com/en/wiki/EVE_API_Functions)

**Note:** CCP Games has been continually been developing a complete JSON REST interface for all APIs.  Only very limited tests have been enabled for short periods of time.  It is the goal of this project to handle the current way (XML) and the future way (JSON) including receiving **and** sending data, which is not currently supported by CCP Games. 

## Backstory

I have been toying with, planning, and designing this project for more than one year.  About one year ago (once I got back into the game post college) I started to develop this project.  It was a great way for me to get into the Mac/iOS ecosystem and learn new technologies to help avoid skill atrophy.  When these products are ready to be released I am going to focus on creating beautiful, modern websites using the newest web technologies to host each project in addition to the Apple App Store.  I am very driven and beyond excited to have my personal ideas and hard work available and distributed to such an amazing group of players that make up EVE Online.




