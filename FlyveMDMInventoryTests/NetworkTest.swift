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

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
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

    /// Get the Service Set Identifier (SSID) of the network
    func testGetSsid() {
        XCTAssertNotNil(network.ssid(), "Network ssid not valid")
    }

    /// Get the Basi Service Set Identifier (BSSID) of the network
    func testGetBssid() {
        XCTAssertNotNil(network.bssid(), "Network basic service set identifier not valid")
    }

    /// Get the local IP address of the network
    func testGetLocalIPAddress() {
        XCTAssertNotNil(network.localIPAddress(), "Network local IP address not valid")
    }

    /// Get the broadcoast address of the network
    func testGetBroadcastAddress() {
        XCTAssertNotNil(network.broadcastAddress(), "Network broadcast address not valid")
    }

#endif

    /// Get the Media Access Control (MAC) address of the network
    func testGetMacAddress() {
        XCTAssertNotNil(network.type(), "Network MAC address not valid")
    }
}
