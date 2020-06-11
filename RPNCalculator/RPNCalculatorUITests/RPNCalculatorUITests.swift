//
//  RPNCalculatorUITests.swift
//  RPNCalculatorUITests
//
//  Created by Vlasto, Benedict (JDN) on 08/06/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import XCTest

class RPNCalculatorUITests: XCTestCase {
    
    let stack = Stack()
    let viewController = ViewController()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberInputAndOperatorButtonsAndDisplayWork() {
        // Arrange
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["5"].tap()
        app.buttons["Enter"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["Eval"].tap()
        
        // Act
        let expected = "7 "
        let actual = app.staticTexts["display"].label

        // Assert
        XCTAssertEqual(expected, actual)
        
    }
    
    func testDividingByZeroClearsDisplay() {
        // Arrange
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["5"].tap()
        app.buttons["Enter"].tap()
        app.buttons["0"].tap()
        app.buttons["/"].tap()
        app.alerts["Ya done goofed"].scrollViews.otherElements.buttons["I'm a clown"].tap()
        
        // Act
        let expected = ""
        let actual = app.staticTexts["display"].label

        // Assert
        XCTAssertEqual(expected, actual)
        
    }
    
    func blah() {
        let app = XCUIApplication()
        app.launch()
        
        
    }

}
