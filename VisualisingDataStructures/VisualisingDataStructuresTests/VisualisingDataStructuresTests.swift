//
//  VisualisingDataStructuresTests.swift
//  VisualisingDataStructuresTests
//
//  Created by Vlasto, Benedict (JDN) on 27/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import XCTest
@testable import VisualisingDataStructures

class VisualisingDataStructuresTests: XCTestCase {
    
    let stack = Stack()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPushAndPeekMethodsWork() {
        //arrange
        stack.push(item: "bread")
        stack.push(item: "tiktokontheclock")
        
        //act
        let expected = stack.peek()
        let actual = "tiktokontheclock"
        
        //assert
        XCTAssertEqual(actual, expected)
    }

    func testPopReturnsTopItemAndDecrementsTop() {
        //arrange
        stack.push(item: "bread")
        stack.push(item: "thisntd")
        
        //act
        let expected = stack.pop()
        let actual = "thisntd"
        let expectedTop = 0
        let actualTop = stack.top
        
        //assert
        XCTAssertEqual(actual, expected)
        XCTAssertEqual(actualTop, expectedTop)
    }
    
    func testDisplayCorrectlyOutputsEntireStackUpToAndIncludingTopPointer() {
        //arrange
        stack.push(item: "bread")
        stack.push(item: "thisntd")
        stack.push(item: "three")
        stack.push(item: "skapow")
        
        //act
        let expected = ["bread", "thisntd", "three", "skapow"]
        let actual = stack.display()
        
        //assert
        XCTAssertEqual(actual, expected)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
