//
//  RPNCalculatorTests.swift
//  RPNCalculatorTests
//
//  Created by Vlasto, Benedict (JDN) on 08/06/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import XCTest
@testable import RPNCalculator

class RPNCalculatorTests: XCTestCase {

    let stack = Stack()
    
    func testPushAndPeekMethodsWorkWithNormalData() {
        
        // Arrange
        stack.push(data: 24)
        
        // Act
        let expected = 24
        let actual = stack.peek()
        
        // Assert
        XCTAssertEqual(actual, expected)
        
    }
    
    func testPopWithNormalData() {
        
        // Arrange
        stack.push(data: 4)
        stack.push(data: 12)
        
        // Act
        let expected = 12
        let actual = stack.pop()
        
        // Assert
        XCTAssertEqual(actual, expected)
    }
    
    func testPushAndPeekMethodsHandleEmptyStack() {
        
        // Arrange
        // Act
        let expected: Int? = nil
        let actual = stack.peek()
        
        // Assert
        XCTAssertEqual(actual, expected)
        
    }
    
    func testPopHandlesEmptyStack() {
        
        // Arrange
        // Act
        let expected: Int? = nil
        let actual = stack.pop()
        
        // Assert
        XCTAssertEqual(actual, expected)
    }

}
