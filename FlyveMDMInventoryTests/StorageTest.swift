//
//  Storage.swift
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 06/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import XCTest
import FlyveMDMInventory

class StorageTest: XCTestCase {

    let storage = Storage()

    /// This method is called before the invocation of each test method in the class.
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
