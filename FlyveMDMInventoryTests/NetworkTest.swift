//
//  NetworkTest.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class NetworkTest: XCTestCase {

    let network = Network()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    /// Get the type of the network
    func testGetType() {
        XCTAssertNotNil(network.type(), "Network type not valid")
    }

#if TARGET_IPHONE

    func testGetSsid() {
        XCTAssertNotNil(network.ssid(), "Network ssid not valid")
    }

    func testGetBssid() {
        XCTAssertNotNil(network.bssid(), "Network basic service set identifier not valid")
    }

    func testGetLocalIPAddress() {
        XCTAssertNotNil(network.localIPAddress(), "Network local IP address not valid")
    }

    func testGetBroadcastAddress() {
        XCTAssertNotNil(network.broadcastAddress(), "Network broadcast address not valid")
    }

#endif

    func testGetMacAddress() {
        XCTAssertNotNil(network.type(), "Network MAC address not valid")
    }
}
