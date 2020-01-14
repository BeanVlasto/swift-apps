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
    var hunger: Int = 0
    var age: Int = 0
    var weight: Int = 5
    var discipline: Int = 7
    var needsAttention: Bool = false
    var needsCleaning: Bool = false
    var isSick: Bool = false
    
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
    
    func displayStats() -> String {
        return """
        \(happiness)
        \(hunger)
        \(age)
        \(weight)
        \(discipline)
        """
    }

}
