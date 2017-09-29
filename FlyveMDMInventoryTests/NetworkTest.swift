/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * NetworkTest.swift is part of FlyveMDMInventory
 *
 * FlyveMDMInventory is a subproject of Flyve MDM. Flyve MDM is a mobile
 * device management software.
 *
 * FlyveMDMInventory is Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ------------------------------------------------------------------------------
 * @author    Hector Rondon
 * @date      14/06/17
 * @copyright Copyright © 2017 Teclib. All rights reserved.
 * @license   Apache License, Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

import XCTest
import FlyveMDMInventory

class NetworkTest: XCTestCase {

    let network = Network()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    /// This method is called after the invocation of each test method in the class.
    override func tearDown() {
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
