//
//  Carrier.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class CarrierTest: XCTestCase {

    let carrier = Carrier()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

#if TARGET_IPHONE

    /// Get the radio access technology of the carrier
    func testGetRadio() {
        XCTAssertNotNil(carrier.radio(), "radio access technology not valid")
    }

    /// Get the name of the carrier
    func testGetName() {
        XCTAssertNotNil(carrier.name(), "Carrier name not valid")
    }

    /// Get the country code of the carrier
    func testGetCountryCode() {
        XCTAssertNotNil(carrier.countryCode(), "Carrier country code not valid")
    }

    /// Get the mobile network code
    func testGetMobileNetworkCode() {
        XCTAssertNotNil(carrier.mobileNetworkCode(), "Mobile network code not valid")
    }

    /// Get if the carrier allows VOIP
    func testGetIsAllowsVOIP() {
        XCTAssertNotNil(carrier.isAllowsVOIP(), "Carrier Allows VOIP not valid")
    }
#endif
}
