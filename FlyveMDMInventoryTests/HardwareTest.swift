/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * HardwareTest.swift is part of FlyveMDMInventory
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

    /// Get the vendor of the Graphics Processing Unit (GPU)
    func testGetGPUVendor() {
        XCTAssertNotNil(hardware.gpuVendor(), "GPU vendor of device not valid")
    }

    /// Get the version of the Graphics Processing Unit (GPU)
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
