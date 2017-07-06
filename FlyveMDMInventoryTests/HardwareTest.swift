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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetUuid() {
        XCTAssertNotNil(hardware.uuid(), "Device ID not valid")
    }
    
    func testGetName() {
        XCTAssertNotNil(hardware.name(), "Device name not valid")
    }
    
    func testGetModel() {
        XCTAssertNotNil(hardware.model(), "Model of device not valid")
    }
    
    func testGetIdentifier() {
        XCTAssertNotNil(hardware.identifier(), "Identifier of device not valid")
    }
    
    func testGetOSType() {
        XCTAssertNotNil(hardware.osType(), "Operating system type of device not valid")
    }
    
    func testGetOSVersion() {
        XCTAssertNotNil(hardware.osVersion(), "Operating system version of device not valid")
    }
    
    func testGetArchName() {
        XCTAssertNotNil(hardware.archName(), "System architecture name of device not valid")
    }
    
    func testGetGPUVendor() {
        XCTAssertNotNil(hardware.gpuVendor(), "GPU vendor of device not valid")
    }
    
    func testGetGPUVersion() {
        XCTAssertNotNil(hardware.gpuVersion(), "GPU version of device not valid")
    }
    
    func testGetScreenResolution() {
        XCTAssertNotNil(hardware.screenResolution(), "Screen resolution size of device not valid")
    }
    
    func testGetFrontCamera() {
        XCTAssertNotNil(hardware.frontCamera(), "Front camera resolution size of device not valid")
    }
    
    func testGetBackCamera() {
        XCTAssertNotNil(hardware.backCamera(), "Back camera resolution size of device not valid")
    }
}
