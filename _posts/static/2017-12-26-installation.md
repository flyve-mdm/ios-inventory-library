---
layout: howtos
published: true
title: Installation
permalink: howtos/installation
description: Get it now
category: user
date: 2017-12-30
---
There are two ways to install the Inventory Library for iOS:

### CocoaPods

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
github "flyve-mdm/ios-inventory-library" "master"
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
