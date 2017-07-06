//
//  BatteryTest.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class BatteryTest: XCTestCase {

    let battery = Battery()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetState() {
        XCTAssertNotNil(battery.state(), "Battery state not valid")
    }

    func testGetLevel() {
        XCTAssertNotNil(battery.level(), "Battery level not valid")
    }
}
