# [Flyve MDM](https://flyve-mdm.com)

Flyve MDM is a mobile device management software that enables you to secure and manage all the mobile devices of your business via a unique web-based console (MDM).

To get started, check out <https://flyve-mdm.com/>!

## Table of contents

* [Synopsis](#synopsis)
* [Build Status](#build-status)
* [Installation](#installation)
* [Code Example](#code-example)
* [Contributors](#contributors)
* [License](#license)

## Synopsis

This library help you to create a complete inventory of your Android devices: both hardware and software informations are collected. You get the data about processor, memory, drives, sensors, etc. and also the list and description of installed application on any devices in a beautifull XML as protocol compatible with FusionInventory for GLPI.

You can find more information here:
<http://fusioninventory.org/documentation/dev/spec/protocol/inventory.html>

**What's included?**

* Hardware
* Bios
* Memory
* Inputs
* Sensors
* Drives
* Cpus
* Simcards
* Videos
* Cameras
* Networks
* Envs
* Jvm
* Softwares
* Usb
* Battery

## Build Status

| **Release channel** | **Beta channel** |
|:---:|:---:|
| [![Build Status](https://travis-ci.org/flyve-mdm/flyve-mdm-android-inventory.svg?branch=master)](https://travis-ci.org/flyve-mdm/flyve-mdm-android-inventory) | [![Build Status](https://travis-ci.org/flyve-mdm/flyve-mdm-android-inventory.svg?branch=develop)](https://travis-ci.org/flyve-mdm/flyve-mdm-android-inventory) |

## Installation

Download the latest JAR or grab via Maven:
```xml
<dependency>
  <groupId>com.flyvemdm</groupId>
  <artifactId>inventory</artifactId>
  <version>1.0.1</version>
  <type>pom</type>
</dependency>
```
or insert on build.gradle at app level:
```groovy
compile 'com.flyvemdm:inventory:1.0.1'
```

## Code Example

It's easy to implement in your code

```java
InventoryTask inventoryTask = new InventoryTask(MainActivity.this, "Agent_v1.0", new InventoryTask.OnTaskCompleted() {
  @Override
  public void onTaskCompleted(String data) {
    Log.d("XML", data);
  }
});

inventoryTask.execute();
```

## Contributors

* [@rafaelje](https://github.com/rafaelje)
* [@ajsb85 ](https://github.com/ajsb85)

## License

The library is a Free Software under GPLv3+ license.

![GPLv3](https://www.gnu.org/graphics/gplv3-88x31.png "GPLv3")
