//
//  HardwareTest.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class HardwareTest: XCTestCase {

    let hardware = Hardware()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    /// This method is called after the invocation of each test method in the class.
    override func tearDown() {
        super.tearDown()
    }

    /// Get the Universally Unique Identifier (UUID) of the device
    func testGetUuid() {
        XCTAssertNotNil(hardware.uuid(), "Device ID not valid")
    }

    /// Get the name of the device
    func testGetName() {
        XCTAssertNotNil(hardware.name(), "Device name not valid")
    }

    /// Get the model of the device
    func testGetModel() {
        XCTAssertNotNil(hardware.model(), "Model of device not valid")
    }

    /// Get the identifier of the device
    func testGetIdentifier() {
        XCTAssertNotNil(hardware.identifier(), "Identifier of device not valid")
    }

    /// Get the type of the operating system
    func testGetOSType() {
        XCTAssertNotNil(hardware.osType(), "Operating system type of device not valid")
    }

    /// Get the version of the operating system
    func testGetOSVersion() {
        XCTAssertNotNil(hardware.osVersion(), "Operating system version of device not valid")
    }

    /// Get the name of the system architecture
    func testGetArchName() {
        XCTAssertNotNil(hardware.archName(), "System architecture name of device not valid")
    }

    func testGetGPUVendor() {
        XCTAssertNotNil(hardware.gpuVendor(), "GPU vendor of device not valid")
    }

    func testGetGPUVersion() {
        XCTAssertNotNil(hardware.gpuVersion(), "GPU version of device not valid")
    }

    /// Get the resolution size of the screen
    func testGetScreenResolution() {
        XCTAssertNotNil(hardware.screenResolution(), "Screen resolution size of device not valid")
    }

    /// Get the resolution size of the front camera
    func testGetFrontCamera() {
        XCTAssertNotNil(hardware.frontCamera(), "Front camera resolution size of device not valid")
    }

    /// Get the resolution size of the back camera
    func testGetBackCamera() {
        XCTAssertNotNil(hardware.backCamera(), "Back camera resolution size of device not valid")
    }
}
