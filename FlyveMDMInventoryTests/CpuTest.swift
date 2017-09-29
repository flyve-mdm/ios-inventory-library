/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * CpuTest.swift is part of FlyveMDMInventory
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

class CpuTest: XCTestCase {

    let cpu = Cpu()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    /// This method is called after the invocation of each test method in the class.
    override func tearDown() {
        super.tearDown()
    }

    /// Get the branch of the CPU
    func testGetBranch() {
        XCTAssertNotNil(cpu.branch(), "Branch of cpu not valid")
    }

    /// Get the vendor of the CPU
    func testGetVendor() {
        XCTAssertNotNil(cpu.vendor(), "Vendor of cpu not valid")
    }

    /// Get the number of physical CPUs
    func testGetPhysicalCpu() {
        XCTAssertNotNil(cpu.physicalCpu(), "Number of cpus physical not valid")
    }

    /// Get the number of logical CPUs
    func testGetLogicalCpu() {
        XCTAssertNotNil(cpu.logicalCpu(), "Number logical of cpu not valid")
    }

#if TARGET_IPHONE

    /// Get the frequency of the CPU
    func testGetFrequency() {
        XCTAssertNotNil(cpu.frequency(), "CPU frequency not valid")
    }

#endif

    /// Get the bus frequency of the CPU
    func testGetBusFrequency() {
        XCTAssertNotNil(cpu.busFrequency(), "CPU bus frequency not valid")
    }

    /// Get the L1 Data cache of the CPU
    func testGetL1DCache() {
        XCTAssertNotNil(cpu.l1dcache(), "L1 D cache of cpu not valid")
    }

    /// Get the L1 Instruction cache of the CPU
    func testGetL1ICache() {
        XCTAssertNotNil(cpu.l1icache(), "L1 I cache of cpu not valid")
    }

    /// Get the L2 cache of the CPU
    func testGetL2Cache() {
        XCTAssertNotNil(cpu.l2cache(), "L2 cache of cpu not valid")
    }
}
