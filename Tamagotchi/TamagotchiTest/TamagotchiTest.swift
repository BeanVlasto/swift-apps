//
//  TamagotchiTest.swift
//  TamagotchiTest
//
//  Created by Vlasto, Benedict (JDN) on 21/11/2019.
//  Copyright © 2019 Vlasto, Benedict (JDN). All rights reserved.
//

import XCTest

class TamagotchiTest: XCTestCase {
    
    let tamagotchi = Tamagotchi()

    func testGetAgeReturnsCorrectAge() {
        
        let actual = tamagotchi.getAge()
        XCTAssertEqual(actual, 0)
        
    }

}
