/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * CarrierTest.swift is part of FlyveMDMInventory
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

class CarrierTest: XCTestCase {

    let carrier = Carrier()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    /// This method is called after the invocation of each test method in the class.
    override func tearDown() {
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
