//
//  MemoryTest.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class MemoryTest: XCTestCase {

    private let memory = Memory()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    /// Get the total memory
    func testTotalMemory() {
        XCTAssertNotNil(memory.total(), "Memory total not valid")
    }

    /// Get the free memory
    func testFreeMemory() {
        XCTAssertNotNil(memory.free(), "Memory free not valid")
    }

    /// Get the used memory
    func testUsedMemory() {
        XCTAssertNotNil(memory.used(), "Memory used not valid")
    }

    func testActiveMemory() {
        XCTAssertNotNil(memory.active(), "Memory active not valid")
    }

    func testInactiveMemory() {
        XCTAssertNotNil(memory.inactive(), "Memory inactive not valid")
    }
}
