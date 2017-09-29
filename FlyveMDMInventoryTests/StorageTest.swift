/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * StorageTest.swift is part of FlyveMDMInventory
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

class StorageTest: XCTestCase {

    let storage = Storage()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    /// This method is called after the invocation of each test method in the class.
    override func tearDown() {
        super.tearDown()
    }

    /// Get the total space of the disk
    func testTotalStorage() {
        XCTAssertNotNil(storage.total(), "Total disk space not valid")
    }

    /// Get the free space in the disk
    func testFreeStorage() {
        XCTAssertNotNil(storage.free(false), "Total free disk space not valid")
    }

    /// Get the used space in the disk
    func testUsedStorage() {
        XCTAssertNotNil(storage.used(false), "Total used disk space used not valid")
    }

    /// Get the partitions storage
    func testPartitionsStorage() {
        XCTAssertNotNil(storage.partitions(), "Partitions disk not valid")
    }
}
