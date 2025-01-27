//
//  iosTests.swift
//  iosTests
//
//  Created by Millin Gabani on 2016-05-26.
//  Copyright © 2016 Millin Gabani. All rights reserved.
//

import XCTest
@testable import ios

class iosTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: TravelTime Tests
    
    // Tests to confirm that the Event initializer returns when no name is provided.\
    func testEventInitialization() {
        
        let potentialItem = Event(name: "Newest event")
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Event(name: "")
        XCTAssertNil(noName, "Empty name is invalid")
    }
    
}
