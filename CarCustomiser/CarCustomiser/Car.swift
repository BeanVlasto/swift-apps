//
//  Car.swift
//  CarCustomiser
//
//  Created by Vlasto, Benedict (JDN) on 11/01/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

struct Car {
    
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
        Make: \(make)
        Model: \(model)
        Top speed: \(topSpeed)mph
        0 -> 60 in: \(String(format: "%.1f", acceleration))s
        Handling: \(handling)
        """
    }
}
