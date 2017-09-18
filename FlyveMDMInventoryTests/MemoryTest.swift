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

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    /// This method is called after the invocation of each test method in the class.
    override func tearDown() {
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

    /// Get the active memory
    func testActiveMemory() {
        XCTAssertNotNil(memory.active(), "Memory active not valid")
    }

    /// Get the inactive memory
    func testInactiveMemory() {
        XCTAssertNotNil(memory.inactive(), "Memory inactive not valid")
    }
}
