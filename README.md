# Inventory Library for iOS

![Flyve MDM banner](https://user-images.githubusercontent.com/663460/26935464-54267e9c-4c6c-11e7-86df-8cfa6658133e.png)

[![License](https://img.shields.io/badge/license-Apache_v2.0-blue.svg)](https://github.com/flyve-mdm/ios-inventory-library/blob/master/LICENSE.md)
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/FlyveMDMInventory/badge.png)](https://cocoadocs.org/docsets/FlyveMDMInventory)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/FlyveMDMInventory/badge.svg)](https://cocoadocs.org/docsets/FlyveMDMInventory)
[![Follow twitter](https://img.shields.io/twitter/follow/FlyveMDM.svg?style=social&label=Twitter&style=flat-square)](https://twitter.com/FlyveMDM)
[![IRC Chat](https://img.shields.io/badge/IRC-%23flyvemdm-green.svg)](http://webchat.freenode.net/?channels=flyve-mdm)
[![Telegram Community](https://img.shields.io/badge/Telegram-Community-blue.svg)](https://t.me/flyvemdm)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![Greenkeeper badge](https://badges.greenkeeper.io/flyve-mdm/flyve-mdm-ios-inventory.svg)](https://greenkeeper.io/)
[![GitHub release](https://img.shields.io/github/release/flyve-mdm/flyve-mdm-ios-inventory.svg)](https://github.com/flyve-mdm/flyve-mdm-ios-inventory/releases)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://circleci.com/gh/flyve-mdm/ios-inventory-library/tree/master.svg?style=shield)](https://circleci.com/gh/flyve-mdm/ios-inventory-library/tree/master)

Flyve MDM is a mobile device management software that enables you to secure and manage all the mobile devices of your business via a unique web-based console (MDM).

To get started, check out [Flyve MDM](https://flyve-mdm.com)!

## Table of contents

* [Synopsis](#synopsis)
* [Build Status](#build-status)
* [Installation](#installation)
* [Code Example](#code-example)
* [Documentation](#documentation)
* [Contribute](#contribute)
* [Contact](#contact)
* [Professional Services](#professional-services)
* [Copying](#copying)

## Synopsis

This library helps you to create a complete inventory of your iOS devices: both hardware and software informations are collected. You get the data about networks, memory, drives, etc., in a beautifull XML as protocol compatible with FusionInventory for GLPI.

You can find more information about the Inventory Protocol here:
<http://fusioninventory.org/documentation/dev/spec/protocol/inventory.html>

**What's included?**

* Hardware
* Bios
* Operating System
* Memory
* Storages
* Drives
* Cpus
* Simcards
* Videos
* Cameras
* Networks
* Battery

Visit our [website](http://flyve.org/ios-inventory-library/) for more information.

## Build Status

Build with Xcode 8.3.2 / Swift 3.1

| **LTS** | **Bleeding Edge** |
|:---:|:---:|
| [![Build Status](https://circleci.com/gh/flyve-mdm/ios-inventory-library/tree/master.svg?style=svg)](https://circleci.com/gh/flyve-mdm/ios-inventory-library/tree/master) | [![Build Status](https://circleci.com/gh/flyve-mdm/ios-inventory-library/tree/develop.svg?style=svg)](https://circleci.com/gh/flyve-mdm/ios-inventory-library/tree/develop) |

## Installation

### CocoaPods

> Less Hassle, More OSS

Install using [CocoaPods](http://cocoapods.org) by adding this line to your Podfile:

````ruby
target "MyApp" do
  use_frameworks! # Add this if you are targeting iOS 8+ or using Swift  
  pod "FlyveMDMInventory", "~> 1.2"
end
````

Then, run the following command:

```console
pod install
```

You can find more information of Inventory Library for iOS [on Cocoapods](https://cocoapods.org/pods/FlyveMDMInventory).

### Carthage

Install using [Carthage](https://github.com/Carthage/Carthage) by adding the following lines to your Cartfile:

```console
github "flyve-mdm/flyve-mdm-ios-inventory" "master"
```

Then, run the following command:

```console
carthage update --platform iOS
```

* On your application targets “General” settings tab, in the “Linked Frameworks and Libraries” section, drag and drop each framework you want to use from the Carthage/Build folder on disk.

* On your application targets “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script with the following contents:

```console
/usr/local/bin/carthage copy-frameworks
```

* And add the paths to the frameworks you want to use under “Input Files”, e.g.:

```console
$(SRCROOT)/Carthage/Build/iOS/FlyveMDMInventory.framework

```

## Code Example

It's easy to implement in your code

```swift
import FlyveMDMInventory

let inventoryTask = InventoryTask()
inventoryTask.execute("Agent_v1.0", tag:"1.0") { result in
    print(result)
}

```

** _Tag is optional_

## Documentation

We maintain a detailed documentation of the project on the website, check the [How-tos](http://flyve.org/ios-inventory-library/howtos/) and [Development](http://flyve.org/ios-inventory-library/) section.

## Contribute

Want to file a bug, contribute some code, or improve documentation? Excellent! Read up on our
guidelines for [contributing](./CONTRIBUTING.md) and then check out one of our issues in the [Issues Dashboard](https://github.com/flyve-mdm/ios-inventory-library/issues).

## Contact

For notices about major changes and general discussion of Flyve MDM development, subscribe to the [/r/FlyveMDM](http://www.reddit.com/r/FlyveMDM) subreddit.
You can also chat with us via IRC in [#flyve-mdm on freenode](http://webchat.freenode.net/?channels=flyve-mdm) or [@flyvemdm on Telegram](https://t.me/flyvemdm).
Ping me @hectorerb in the IRC chatroom or in the Telegram Dev Group if you get stuck.

## Professional Services

The Flyve MDM and GLPI Network services are available through our [Partner's Network](http://www.teclib-edition.com/en/partners/). We provide special training, bug fixes with editor subscription, contributions for new features, and more.

Obtain a personalized service experience, associated with benefits and opportunities.

## Copying

* **Name**: [Flyve MDM](https://flyve-mdm.com/) is a registered trademark of [Teclib'](http://www.teclib-edition.com/en/).
* **Code**: you can redistribute it and/or modify
    it under the terms of the [Apache License v2.0](http://www.apache.org/licenses/LICENSE-2.0).
* **Documentation**: released under Attribution 4.0 International ([CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)).
