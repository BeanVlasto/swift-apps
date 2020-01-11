//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Vlasto, Benedict (JDN) on 11/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import XCTest
@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {
    
    func testDisplayStatsReturnsCorrectValues() {
        
        //arrange
        let car = Car(make: "BMW", model: "i8", topSpeed: 200, acceleration: 4.3, handling: 7)
        
        let expected = """
                    Make: BMW
                    Model: i8
                    Top speed: 200
                    Acceleration: 4.3
                    Handling: 7
                    """
        
        //act
        let actual = car.displayStats()
        
        //assert
        XCTAssertEqual(actual, expected)
        
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
