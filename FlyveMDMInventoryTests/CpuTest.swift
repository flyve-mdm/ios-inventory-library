//
//  CpuTest.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class CpuTest: XCTestCase {

    let cpu = Cpu()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetBranch() {
        XCTAssertNotNil(cpu.branch(), "Branch of cpu not valid")
    }

    func testGetVendor() {
        XCTAssertNotNil(cpu.vendor(), "Vendor of cpu not valid")
    }

    func testGetPhysicalCpu() {
        XCTAssertNotNil(cpu.physicalCpu(), "Number of cpus physical not valid")
    }

    func testGetLogicalCpu() {
        XCTAssertNotNil(cpu.logicalCpu(), "Number logical of cpu not valid")
    }

#if TARGET_IPHONE

    func testGetFrequency() {
        XCTAssertNotNil(cpu.frequency(), "CPU frequency not valid")
    }

#endif

    func testGetBusFrequency() {
        XCTAssertNotNil(cpu.busFrequency(), "CPU bus frequency not valid")
    }

    func testGetL1DCache() {
        XCTAssertNotNil(cpu.l1dcache(), "L1 D cache of cpu not valid")
    }

    func testGetL1ICache() {
        XCTAssertNotNil(cpu.l1icache(), "L1 I cache of cpu not valid")
    }

    func testGetL2Cache() {
        XCTAssertNotNil(cpu.l2cache(), "L2 cache of cpu not valid")
    }
}
