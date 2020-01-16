//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Vlasto, Benedict (JDN) on 14/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    var happiness: Int = 0
    var fullness: Double = 0
    var age: Int = 0
    var weight: Int = 5
    var discipline: Int = 7
    var needsAttention: Bool = false
    var needsCleaning: Bool = false
    var isSick: Bool = false
    
    func feed(type: String) {
        if fullness > 3.5 {
            // Output annoyed animation.
        } else {
            if type == "meal" {
                if fullness > 3 {
                    // Output annoyed animation.
                } else {
                    fullness += 1
                }
            } else {
                fullness += 0.5
            }
        }
    }
    
    func scold() {
        
    }
    
    func clean() {
        
    }
    
    func displayStats() -> String {
        return """
        Happiness: \(happiness)
        Hunger: \(fullness)
        Age: \(age)
        Weight: \(weight)
        Discipline: \(discipline)
        """
    }

}
