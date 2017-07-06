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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTotalStorage() {
        XCTAssertNotNil(storage.total(), "Total disk space not valid")
    }
    
    func testFreeStorage() {
        XCTAssertNotNil(storage.free(false), "Total free disk space not valid")
    }
    
    func testUsedStorage() {
        XCTAssertNotNil(storage.used(false), "Total used disk space used not valid")
    }
    
    func testPartitionsStorage() {
        XCTAssertNotNil(storage.partitions(), "Partitions disk not valid")
    }

    
}
