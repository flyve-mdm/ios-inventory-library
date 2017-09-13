//
//  OperatingSystem.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class OperatingSystemTest: XCTestCase {

    let os = OperatingSystem()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    /// Get the name of the operating system
    func testGetOSName() {
        XCTAssertNotNil(os.name(), "Operating system name not valid")
    }

    /// Get the full name of the operating system
    func testGetOSFullName() {
        XCTAssertNotNil(os.fullName(), "Operating system full name not valid")
    }

    /// Get the version of the operating system
    func testGetOSVersion() {
        XCTAssertNotNil(os.version(), "Operating system version not valid")
    }

    /// Get the build of the operating system
    func testGetOSBuild() {
        XCTAssertNotNil(os.build(), "Operating system build not valid")
    }

    /// Get the kernel name of the operating system
    func testGetOSKernelName() {
        XCTAssertNotNil(os.kernelName(), "Operating system kernel name not valid")
    }

    /// Get the kernel version of the operating system
    func testGetOSKernelVersion() {
        XCTAssertNotNil(os.kernelVersion(), "Operating system kernel version not valid")
    }
}
