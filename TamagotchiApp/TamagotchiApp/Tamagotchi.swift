//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Vlasto, Benedict (JDN) on 14/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    private var happiness: Int = 0
    private var hunger: Int = 0
    private var age: Int = 0
    private var weight: Int = 5
    private var discipline: Int = 7
    private var needsAttention: Bool = false
    private var needsCleaning: Bool = false
    private var isSick: Bool = false
    
    func feed() {
        if hunger == 4 {
            // Output annoyed animation.
        } else {
            hunger += 1
        }
    }
    
    func scold() {
        
    }
    
    func clean() {
        
    }
    
    private var name = String()
    private var hungry: Int = 4
    private var sleepy: Bool = false
    private var isSick: Bool = false
    private var isDirty: Bool = false
    
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
    
    func getHappiness() -> Int {
        return happiness
    }
    
    func getIsAlive() -> Bool {
        return isAlive
    }
    
    func kill() {
        isAlive = false
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
