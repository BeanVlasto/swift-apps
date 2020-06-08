//
//  Stack.swift
//  RPNCalculator
//
//  Created by Vlasto, Benedict (JDN) on 08/06/2020.
//  Copyright © 2020 Vlasto, Benedict (JDN). All rights reserved.
//

import Foundation

class Stack {
    
    var array: [Int] = []
    
    func pop() -> Int? {
        if array.count == 0 {
            print("Stack empty.")
        }
        return array.popLast()
    }
    
    func push(data: Int) {
        array.append(data)
    }
    
    func peek() -> Int? {
        if array.count == 0 {
            print("Stack empty.")
        }
        return array.last
    }
    
    func empty() {
        array = []
    }
    
    func isEmpty() -> Bool {
        if array.count == 0 {
            return true
        }
        return false
    }
    
}
