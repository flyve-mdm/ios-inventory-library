/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * OperatingSystemTest.swift is part of FlyveMDMInventory
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

class OperatingSystemTest: XCTestCase {

    let os = OperatingSystem()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    /// This method is called after the invocation of each test method in the class.
    override func tearDown() {
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
