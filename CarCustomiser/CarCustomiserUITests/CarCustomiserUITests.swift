//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Vlasto, Benedict (JDN) on 11/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtExhaustAndTiresPackageOtherPackagesAreDisabled() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["engineAndExhaustPackageSwitch"].tap()
        app.switches["tiresPackageSwitch"].tap()
        
        //assert
        XCTAssertEqual(app.switches["spoilerPackageSwitch"].isEnabled, false)
        XCTAssertEqual(app.switches["gearboxPackageSwitch"].isEnabled, false)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDisplayStatsCorrectlyOutputsStatsOnStartup() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //act
        let expected = """
        Make: Mazda
        Model: MX-5
        Top speed: 125mph
        0 -> 60 in: 7.7s
        Handling: 5
        """
        
        let actual = app.staticTexts["displayStatsLabel"].label
        
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testButtonsAreEnabledAndOffAfterGoingToNextCar() {
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["engineAndExhaustPackageSwitch"].tap()
        app.switches["tiresPackageSwitch"].tap()
        app.buttons["nextCarButton"].tap()
        
        //assert
        XCTAssertEqual(app.switches["engineAndExhaustPackageSwitch"].isEnabled, true)
        XCTAssertEqual(app.switches["tiresPackageSwitch"].isEnabled, true)
        XCTAssertEqual(app.switches["spoilerPackageSwitch"].isEnabled, true)
        XCTAssertEqual(app.switches["gearboxPackageSwitch"].isEnabled, true)
        //XCTAssertEqual(app.switches["engineAndExhaustPackageSwitch"].isOn, false)
        //XCTAssertEqual(app.switches["gearboxPackageSwitch"].isOn, false)
    }
    
    func testRemainingFundsResetsAfterGoingToNextCar() {
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.switches["engineAndExhaustPackageSwitch"].tap()
        app.switches["tiresPackageSwitch"].tap()
        app.buttons["nextCarButton"].tap()
        let expected = "Remaining funds: 1000"
        let actual = app.staticTexts["remainingFundsLabel"].label
        
        //assert
        XCTAssertEqual(actual, expected)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
