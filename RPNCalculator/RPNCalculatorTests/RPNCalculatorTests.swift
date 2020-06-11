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
    let viewController = ViewController()
    
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
    
    func testInvalidNumberRejectsFourDigitNumber() {
        // Arrange
        viewController.input_num = -240
        
        // Act
        let expected = false
        let actual = viewController.invalidNumberCheck(string: "1")
        
        // Assert
        XCTAssertEqual(actual, expected)
    }
    
    func testAddNumberToStackAddsNumberToStack() {
        // Arrange
        viewController.input_num = 69
        viewController.addNumberToStack()
        
        // Act
        let expected = 69
        let actual = viewController.stack.peek()
        
        // Assert
        XCTAssertEqual(actual, expected)
    }
    
    func testReturnNumbersForCalculationReturnsNumbersWhenStackIsValid() {
        // Arrange
        viewController.stack.push(data: 23)
        viewController.stack.push(data: 32)
        
        // Act
        let expected = [23, 32]
        let actual = viewController.returnNumbersForCalculation()
        
        // Assert
        XCTAssertEqual(actual, expected)
    }
    
    func testDivideDividesNumbersCorrecltyFromStack() {
        // Arrange
        viewController.stack.push(data: 70)
        viewController.stack.push(data: 4)
        viewController.divide()
        
        // Act
        let expected = 17
        let actual = viewController.stack.peek()
        
        // Assert
        XCTAssertEqual(actual, expected)
    }

}
