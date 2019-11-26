//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Vlasto, Benedict (JDN) on 21/11/2019.
//  Copyright © 2019 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    private var name = String()
    private var age: Int = 0
    private var weight: Int = 5
    private var happiness: Int = 0
    private var hungry: Int = 4
    private var sleepy: Bool = false
    private var isSick: Bool = false
    private var isDirty: Bool = false
    private var needsAttention: Bool = false
    private var needsDiscipline: Bool = false
    
    init(name: String = "Sam") {
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func getAge() -> Int {
        return age
    }
    
    func getWeight() -> Int {
        return weight
    }
    
    func playGame() {
        if happiness < 4 {
            happiness += 1
        }
        sleepy = true
    }
    
    func feed() {
        if happiness < 4 {
            happiness += 1
        }
        weight += 2
    }
    
    func sleep() {
        if sleepy == true {
            sleepy = false
            happiness += 2
            if happiness > 4 {
                happiness = 4
            }
        } else {
            happiness -= 1
        }
    }
    
    func giveMedicine() {
        if isSick == true {
            isSick = false
            happiness += 2
            if happiness > 4 {
                happiness = 4
            }
        } else {
            happiness -= 1
        }
    }

}
